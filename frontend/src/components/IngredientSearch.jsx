import { useState, useCallback } from 'react';
import { Search, Loader2, AlertCircle, Info } from 'lucide-react';
import { useIngredientSearch } from '../hooks/useIngredients';
import { debounce, getScoreColor, getScoreBgColor } from '../lib/utils';

function IngredientSearch() {
  const [searchTerm, setSearchTerm] = useState('');
  const [debouncedTerm, setDebouncedTerm] = useState('');

  const { data: ingredient, isLoading, error } = useIngredientSearch(debouncedTerm);

  // Debounce search input
  const debouncedSearch = useCallback(
    debounce((term) => {
      setDebouncedTerm(term);
    }, 500),
    []
  );

  const handleSearchChange = (e) => {
    const value = e.target.value;
    setSearchTerm(value);
    debouncedSearch(value);
  };

  return (
    <div className="max-w-2xl">
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
          placeholder="Search for an ingredient (e.g., sugar, turmeric, emulsifier)"
          className="input-field pl-12 text-lg py-3"
        />
        {isLoading && (
          <Loader2 className="absolute right-4 top-1/2 -translate-y-1/2 w-5 h-5 text-indigo-600 animate-spin" />
        )}
      </div>

      {/* Error State */}
      {error && (
        <div className="card bg-red-50 border-red-200 flex items-start gap-3">
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
        <div className="space-y-6">
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

      {/* Empty State */}
      {!ingredient && !isLoading && !error && searchTerm.length < 2 && (
        <div className="text-center py-12">
          <Search className="w-12 h-12 text-gray-300 mx-auto mb-4" />
          <p className="text-gray-500">
            Start typing to search for ingredients
          </p>
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
