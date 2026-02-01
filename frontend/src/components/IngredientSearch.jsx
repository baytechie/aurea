import { useState, useEffect, useRef, useCallback } from 'react';
import { Search, Loader2, AlertCircle, Info, Trophy, AlertTriangle } from 'lucide-react';
import { useQuery, useQueries } from '@tanstack/react-query';
import { ingredientApi } from '../lib/api';
import { getScoreColor, getScoreBgColor } from '../lib/utils';

// Ingredient names to fetch (we'll get real scores from API)
const TOP_RATED_NAMES = ['Spinach', 'Salmon', 'Blueberries', 'Avocado', 'Broccoli', 'Quinoa'];
const WATCH_LIST_NAMES = ['Sugar', 'White Bread', 'Soda', 'Processed Meat', 'Margarine', 'Candy'];

function IngredientSearch() {
  const [searchTerm, setSearchTerm] = useState('');
  const [debouncedTerm, setDebouncedTerm] = useState('');
  const [selectedIngredient, setSelectedIngredient] = useState(null);
  const timeoutRef = useRef(null);

  // Fetch search results
  const { data: ingredient, isLoading, error } = useQuery({
    queryKey: ['ingredient', debouncedTerm],
    queryFn: () => ingredientApi.getScore(debouncedTerm),
    enabled: !!debouncedTerm && debouncedTerm.length >= 2,
  });

  // Fetch real scores for top rated ingredients
  const topRatedQueries = useQueries({
    queries: TOP_RATED_NAMES.map((name) => ({
      queryKey: ['ingredient', name],
      queryFn: () => ingredientApi.getScore(name),
      staleTime: 1000 * 60 * 60, // Cache for 1 hour
    })),
  });

  // Fetch real scores for watch list ingredients
  const watchListQueries = useQueries({
    queries: WATCH_LIST_NAMES.map((name) => ({
      queryKey: ['ingredient', name],
      queryFn: () => ingredientApi.getScore(name),
      staleTime: 1000 * 60 * 60, // Cache for 1 hour
    })),
  });

  // Process fetched data into display format
  const topRatedData = topRatedQueries
    .filter((q) => q.data)
    .map((q) => ({
      name: q.data.name,
      score: q.data.overall_score,
      category: q.data.category || 'Food',
    }))
    .sort((a, b) => (b.score || 0) - (a.score || 0));

  const watchListData = watchListQueries
    .filter((q) => q.data)
    .map((q) => ({
      name: q.data.name,
      score: q.data.overall_score,
      category: q.data.category || 'Food',
    }))
    .sort((a, b) => (a.score || 0) - (b.score || 0));

  const isLoadingLists = topRatedQueries.some((q) => q.isLoading) || watchListQueries.some((q) => q.isLoading);

  // Cleanup timeout on unmount
  useEffect(() => {
    return () => {
      if (timeoutRef.current) {
        clearTimeout(timeoutRef.current);
      }
    };
  }, []);

  const handleSearchChange = useCallback((e) => {
    const value = e.target.value;
    setSearchTerm(value);
    setSelectedIngredient(null);

    // Clear previous timeout
    if (timeoutRef.current) {
      clearTimeout(timeoutRef.current);
    }

    // Set new debounced search
    timeoutRef.current = setTimeout(() => {
      setDebouncedTerm(value);
    }, 300);
  }, []);

  const handleIngredientClick = (name) => {
    setSearchTerm(name);
    setDebouncedTerm(name);
    setSelectedIngredient(name);
  };

  const displayIngredient = ingredient || selectedIngredient;

  const getScoreLabel = (score) => {
    if (score >= 70) return 'Good';
    if (score >= 40) return 'Moderate';
    return 'Caution';
  };

  const getScoreBadgeColor = (score) => {
    if (score >= 70) return 'bg-green-500';
    if (score >= 40) return 'bg-yellow-500';
    return 'bg-red-500';
  };

  return (
    <div className="max-w-4xl">
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Search Ingredients</h1>
      <p className="text-gray-600 mb-6">
        Look up any ingredient to see its health impact scores
      </p>

      {/* Search Input */}
      <div className="relative mb-8">
        <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-gray-400" />
        <input
          type="text"
          value={searchTerm}
          onChange={handleSearchChange}
          placeholder="Search for an ingredient (e.g., sugar, turmeric, salmon)"
          className="input-field pl-12 text-lg py-3"
        />
        {isLoading && (
          <Loader2 className="absolute right-4 top-1/2 -translate-y-1/2 w-5 h-5 text-teal-600 animate-spin" />
        )}
      </div>

      {/* Error State */}
      {error && (
        <div className="card bg-red-50 border-red-200 flex items-start gap-3 mb-6">
          <AlertCircle className="w-5 h-5 text-red-500 flex-shrink-0 mt-0.5" />
          <div>
            <p className="font-medium text-red-800">Ingredient not found</p>
            <p className="text-sm text-red-600">
              {error.response?.status === 404
                ? "We don't have data for this ingredient yet. Try another one!"
                : 'Something went wrong. Please try again.'}
            </p>
          </div>
        </div>
      )}

      {/* Results */}
      {ingredient && !isLoading && (
        <div className="space-y-6 mb-8">
          {/* Overall Score */}
          <div className="card">
            <div className="flex items-center justify-between mb-4">
              <h2 className="text-xl font-semibold text-gray-900 capitalize">
                {ingredient.name}
              </h2>
              <div className={`px-4 py-2 rounded-lg ${getScoreBgColor(ingredient.overall_score || 50)}`}>
                <span className={`text-2xl font-bold ${getScoreColor(ingredient.overall_score || 50)}`}>
                  {ingredient.overall_score || 'N/A'}
                </span>
                <span className="text-sm text-gray-500 ml-1">/100</span>
              </div>
            </div>
            <p className="text-gray-600 text-sm flex items-center gap-2">
              <Info className="w-4 h-4" />
              Higher scores indicate better health impact
            </p>
          </div>

          {/* Category Breakdown */}
          <div className="card">
            <h3 className="font-semibold text-gray-900 mb-4">Health Impact Breakdown</h3>
            <div className="space-y-4">
              <ScoreBar
                label="Blood Sugar Impact"
                value={ingredient.blood_sugar_impact}
                description="How this ingredient affects blood glucose levels"
              />
              <ScoreBar
                label="Inflammation Potential"
                value={ingredient.inflammation_potential}
                description="Likelihood of causing inflammatory response"
                inverted
              />
              <ScoreBar
                label="Gut Health Impact"
                value={ingredient.gut_impact}
                description="Effect on gut microbiome and digestion"
              />
              <ScoreBar
                label="Hormonal Relevance"
                value={typeof ingredient.hormonal_relevance === 'number'
                  ? ingredient.hormonal_relevance
                  : ingredient.hormonal_relevance?.score || 50}
                description="Potential effect on hormonal balance"
              />
            </div>
          </div>

          {/* Evidence & Sources */}
          <div className="card">
            <h3 className="font-semibold text-gray-900 mb-3">Evidence Quality</h3>
            <div className="flex items-center gap-2 mb-4">
              <span className={`px-3 py-1 rounded-full text-sm font-medium ${
                ingredient.evidence_confidence === 'high'
                  ? 'bg-green-100 text-green-700'
                  : ingredient.evidence_confidence === 'medium'
                  ? 'bg-yellow-100 text-yellow-700'
                  : 'bg-gray-100 text-gray-700'
              }`}>
                {ingredient.evidence_confidence || 'Unknown'} confidence
              </span>
            </div>
            {ingredient.sources && ingredient.sources.length > 0 && (
              <div>
                <h4 className="text-sm font-medium text-gray-700 mb-2">Sources</h4>
                <ul className="text-sm text-gray-600 space-y-1">
                  {ingredient.sources.map((source, index) => (
                    <li key={index} className="truncate">
                      {typeof source === 'string' ? source : source.name || source.url}
                    </li>
                  ))}
                </ul>
              </div>
            )}
          </div>
        </div>
      )}

      {/* Discovery Section - Show when not searching */}
      {!ingredient && !isLoading && !error && (
        <div className="space-y-8">
          {/* Top Rated Section */}
          <div>
            <div className="flex items-center gap-3 mb-4">
              <div className="w-10 h-10 rounded-full bg-green-100 flex items-center justify-center">
                <Trophy className="w-5 h-5 text-green-600" />
              </div>
              <div>
                <h3 className="font-semibold text-gray-900">Top Rated</h3>
                <p className="text-sm text-gray-500">Healthiest choices</p>
              </div>
            </div>
            {isLoadingLists && topRatedData.length === 0 ? (
              <div className="flex items-center justify-center py-8">
                <Loader2 className="w-6 h-6 text-teal-600 animate-spin" />
              </div>
            ) : (
              <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-6 gap-3">
                {topRatedData.map((item) => (
                  <button
                    key={item.name}
                    onClick={() => handleIngredientClick(item.name)}
                    className="bg-white border border-green-200 rounded-xl p-4 text-center hover:shadow-md hover:border-green-300 transition-all"
                  >
                    <div className={`w-12 h-12 rounded-full ${getScoreBadgeColor(item.score)} mx-auto mb-2 flex items-center justify-center`}>
                      <span className="text-white font-bold">{item.score}</span>
                    </div>
                    <p className="font-medium text-gray-900 text-sm truncate">{item.name}</p>
                    <p className="text-xs text-gray-500">{item.category}</p>
                  </button>
                ))}
              </div>
            )}
          </div>

          {/* Watch List Section */}
          <div>
            <div className="flex items-center gap-3 mb-4">
              <div className="w-10 h-10 rounded-full bg-red-100 flex items-center justify-center">
                <AlertTriangle className="w-5 h-5 text-red-600" />
              </div>
              <div>
                <h3 className="font-semibold text-gray-900">Use with Caution</h3>
                <p className="text-sm text-gray-500">Limit these ingredients</p>
              </div>
            </div>
            {isLoadingLists && watchListData.length === 0 ? (
              <div className="flex items-center justify-center py-8">
                <Loader2 className="w-6 h-6 text-teal-600 animate-spin" />
              </div>
            ) : (
              <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-6 gap-3">
                {watchListData.map((item) => (
                  <button
                    key={item.name}
                    onClick={() => handleIngredientClick(item.name)}
                    className="bg-white border border-red-200 rounded-xl p-4 text-center hover:shadow-md hover:border-red-300 transition-all"
                  >
                    <div className={`w-12 h-12 rounded-full ${getScoreBadgeColor(item.score)} mx-auto mb-2 flex items-center justify-center`}>
                      <span className="text-white font-bold">{item.score}</span>
                    </div>
                    <p className="font-medium text-gray-900 text-sm truncate">{item.name}</p>
                    <p className="text-xs text-gray-500">{item.category}</p>
                  </button>
                ))}
              </div>
            )}
          </div>

          {/* Score Guide */}
          <div>
            <h3 className="font-semibold text-gray-900 mb-3">Score Guide</h3>
            <div className="bg-white rounded-xl border border-gray-200 p-4">
              <div className="grid grid-cols-3 gap-4 text-center">
                <div>
                  <div className="w-8 h-8 rounded-full bg-green-500 mx-auto mb-2" />
                  <p className="font-bold text-gray-900 text-sm">70-100</p>
                  <p className="text-xs text-gray-500">Good Choice</p>
                </div>
                <div>
                  <div className="w-8 h-8 rounded-full bg-yellow-500 mx-auto mb-2" />
                  <p className="font-bold text-gray-900 text-sm">40-69</p>
                  <p className="text-xs text-gray-500">Moderate</p>
                </div>
                <div>
                  <div className="w-8 h-8 rounded-full bg-red-500 mx-auto mb-2" />
                  <p className="font-bold text-gray-900 text-sm">0-39</p>
                  <p className="text-xs text-gray-500">Use Caution</p>
                </div>
              </div>
            </div>
          </div>

          {/* Search Tip */}
          <div className="bg-teal-50 rounded-xl p-4 flex items-start gap-3">
            <Info className="w-5 h-5 text-teal-600 flex-shrink-0 mt-0.5" />
            <p className="text-sm text-teal-700">
              Search for any ingredient to see its detailed health score and breakdown
            </p>
          </div>
        </div>
      )}
    </div>
  );
}

function ScoreBar({ label, value, description, inverted = false }) {
  // For inverted metrics (like inflammation), higher values are worse
  const displayValue = value ?? 50;
  const normalizedValue = inverted ? 100 - displayValue : displayValue;

  const getBarColor = (val) => {
    if (val >= 70) return 'bg-green-500';
    if (val >= 40) return 'bg-yellow-500';
    return 'bg-red-500';
  };

  return (
    <div>
      <div className="flex items-center justify-between mb-1">
        <span className="text-sm font-medium text-gray-700">{label}</span>
        <span className={`text-sm font-bold ${getScoreColor(normalizedValue)}`}>
          {displayValue}
        </span>
      </div>
      <div className="h-2 bg-gray-100 rounded-full overflow-hidden">
        <div
          className={`h-full rounded-full transition-all duration-300 ${getBarColor(normalizedValue)}`}
          style={{ width: `${displayValue}%` }}
        />
      </div>
      <p className="text-xs text-gray-500 mt-1">{description}</p>
    </div>
  );
}

export default IngredientSearch;
