import React, { useState, useCallback, useEffect } from 'react';
import { Loader2, Filter, ArrowUpDown, X, Search } from 'lucide-react';
import SearchBar from './SearchBar';
import IngredientCard, { IngredientCardSkeleton } from './IngredientCard';
import HealthBreakdown, { HealthBreakdownSkeleton } from './HealthBreakdown';
import { ingredientApi } from '../../lib/api';
import { getCategoryStyle, formatCategoryName } from '../../lib/scoreUtils';

// Debounce hook
function useDebounce(value, delay) {
  const [debouncedValue, setDebouncedValue] = useState(value);

  useEffect(() => {
    const timer = setTimeout(() => setDebouncedValue(value), delay);
    return () => clearTimeout(timer);
  }, [value, delay]);

  return debouncedValue;
}

// Available sort options
const SORT_OPTIONS = [
  { value: 'name', label: 'Name (A-Z)' },
  { value: 'overall_score', label: 'Overall Score' },
  { value: 'blood_sugar_impact', label: 'Blood Sugar Impact' },
  { value: 'inflammation_potential', label: 'Inflammation' },
  { value: 'gut_impact', label: 'Gut Impact' },
  { value: 'disease_links', label: 'Disease Links' },
];

/**
 * CategoryTabs - Horizontal scrollable category filter pills.
 *
 * Features:
 * - Color-coded pills matching category colors
 * - Horizontal scroll on mobile
 * - Active state with primary brand color
 */
function CategoryTabs({ categories, activeCategory, onSelect }) {
  return (
    <div
      className="flex gap-2 mb-6 overflow-x-auto pb-2 -mx-4 px-4 sm:mx-0 sm:px-0 sm:flex-wrap"
      role="tablist"
      aria-label="Filter by category"
    >
      <button
        onClick={() => onSelect(null)}
        role="tab"
        aria-selected={!activeCategory}
        className={`flex-shrink-0 px-4 py-2 rounded-full text-sm font-medium transition-all focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 ${
          !activeCategory
            ? 'bg-[#2D7D5E] text-white shadow-sm'
            : 'bg-white text-gray-700 border border-gray-200 hover:bg-gray-50 hover:border-gray-300'
        }`}
      >
        All Categories
      </button>
      {categories.map((category) => {
        const style = getCategoryStyle(category);
        const isActive = activeCategory === category;
        return (
          <button
            key={category}
            onClick={() => onSelect(category)}
            role="tab"
            aria-selected={isActive}
            className={`flex-shrink-0 px-4 py-2 rounded-full text-sm font-medium transition-all focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 ${
              isActive
                ? 'shadow-sm'
                : 'bg-white border border-gray-200 hover:border-gray-300'
            }`}
            style={isActive ? {
              backgroundColor: style.bgColor,
              color: style.color,
              borderColor: style.color
            } : undefined}
          >
            {formatCategoryName(category)}
          </button>
        );
      })}
    </div>
  );
}

// Sort dropdown component
function SortDropdown({ value, onChange }) {
  return (
    <div className="relative">
      <select
        value={value}
        onChange={(e) => onChange(e.target.value)}
        className="appearance-none bg-white border border-gray-300 rounded-lg px-4 py-2 pr-10 text-sm font-medium text-gray-700 cursor-pointer hover:border-gray-400 focus:outline-none focus:ring-2 focus:ring-[#2D7D5E] focus:border-transparent"
      >
        {SORT_OPTIONS.map((option) => (
          <option key={option.value} value={option.value}>
            Sort by: {option.label}
          </option>
        ))}
      </select>
      <ArrowUpDown
        size={16}
        className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 pointer-events-none"
      />
    </div>
  );
}

// Active filters display
function ActiveFilters({ category, sortBy, onClearCategory, onClearSort }) {
  if (!category && sortBy === 'name') return null;

  return (
    <div className="flex flex-wrap gap-2 mb-4">
      {category && (
        <span className="inline-flex items-center gap-1 px-3 py-1 rounded-full text-sm bg-[#E0F0EC] text-[#2D7D5E]">
          Category: {category}
          <button onClick={onClearCategory} className="ml-1 hover:text-[#1a4d3a]">
            <X size={14} />
          </button>
        </span>
      )}
      {sortBy !== 'name' && (
        <span className="inline-flex items-center gap-1 px-3 py-1 rounded-full text-sm bg-gray-100 text-gray-700">
          Sorted by: {SORT_OPTIONS.find((o) => o.value === sortBy)?.label}
          <button onClick={onClearSort} className="ml-1 hover:text-gray-900">
            <X size={14} />
          </button>
        </span>
      )}
    </div>
  );
}

/**
 * Helper function to parse JSON details from API response.
 * Handles both string JSON and already-parsed objects.
 */
function parseDetails(detailsData) {
  if (!detailsData) return null;

  // If it's already an object, return it
  if (typeof detailsData === 'object' && detailsData !== null) {
    return detailsData;
  }

  // Try to parse if it's a string
  if (typeof detailsData === 'string') {
    try {
      return JSON.parse(detailsData);
    } catch (e) {
      console.warn('Failed to parse details JSON:', e);
      return null;
    }
  }

  return null;
}

/**
 * Transform API response to component format with detailed health data.
 * Handles both legacy format (*_details fields) and new format (health_scores object).
 */
function transformIngredientData(data) {
  // Try new nested health_scores format first, fallback to legacy *_details fields
  const healthScores = data.health_scores || {};

  // Parse detailed data from API (legacy format support)
  const bloodSugarDetails = healthScores.blood_sugar || parseDetails(data.blood_sugar_details);
  const inflammationDetails = healthScores.inflammation || parseDetails(data.inflammation_details);
  const gutDetails = healthScores.gut_impact || parseDetails(data.gut_impact_details);
  const diseaseLinksDetails = healthScores.disease_links || parseDetails(data.disease_links_details);
  const hormonalData = healthScores.hormonal || parseDetails(data.hormonal_relevance);

  // Generate description based on score
  const scoreDescription =
    data.overall_score >= 70
      ? 'low'
      : data.overall_score >= 50
        ? 'moderate'
        : 'high';

  return {
    name: data.name,
    overallScore: data.overall_score,
    category: data.category || null,
    isTrusted: data.is_trusted === 1,
    riskLevel: null, // Will be computed from score
    description:
      `Based on current evidence, this ingredient shows ${scoreDescription} health impact for most people.`,
    categories: {
      bloodSugar: {
        score: bloodSugarDetails?.score ?? data.blood_sugar_impact,
        description:
          bloodSugarDetails?.description ||
          'How this ingredient affects blood glucose levels and insulin response',
        confidenceLevel: bloodSugarDetails?.confidence_level,
        confidence: bloodSugarDetails?.confidence_score ?? bloodSugarDetails?.confidence,
        confidenceRationale: bloodSugarDetails?.confidence_rationale,
        details: bloodSugarDetails?.details || [],
      },
      inflammation: {
        // Note: Store raw value, CategorySection will handle inversion
        score: inflammationDetails?.score ?? data.inflammation_potential,
        description:
          inflammationDetails?.description ||
          'Potential to trigger or reduce inflammatory responses in the body',
        confidenceLevel: inflammationDetails?.confidence_level,
        confidence: inflammationDetails?.confidence_score ?? inflammationDetails?.confidence,
        confidenceRationale: inflammationDetails?.confidence_rationale,
        details: inflammationDetails?.details || [],
      },
      gut: {
        score: gutDetails?.score ?? data.gut_impact,
        description:
          gutDetails?.description ||
          'Effect on digestive health, gut microbiome, and intestinal comfort',
        confidenceLevel: gutDetails?.confidence_level,
        confidence: gutDetails?.confidence_score ?? gutDetails?.confidence,
        confidenceRationale: gutDetails?.confidence_rationale,
        details: gutDetails?.details || [],
      },
      diseaseLinks: {
        score: diseaseLinksDetails?.score ?? data.disease_links,
        description:
          diseaseLinksDetails?.description ||
          'Association with chronic disease risk based on scientific research',
        confidenceLevel: diseaseLinksDetails?.confidence_level,
        confidence: diseaseLinksDetails?.confidence_score ?? diseaseLinksDetails?.confidence,
        confidenceRationale: diseaseLinksDetails?.confidence_rationale,
        details: diseaseLinksDetails?.details || [],
      },
      hormonal: {
        score: hormonalData?.score,
        description:
          hormonalData?.description ||
          'Potential effects on hormonal balance and endocrine function',
        confidenceLevel: hormonalData?.confidence_level,
        confidence: hormonalData?.confidence_score ?? hormonalData?.confidence,
        confidenceRationale: hormonalData?.confidence_rationale,
        // Handle legacy format where details is a single string
        details: Array.isArray(hormonalData?.details)
          ? hormonalData.details
          : hormonalData?.details
            ? [hormonalData.details]
            : [],
      },
      evidence: {
        confidence: data.evidence_confidence || 'Mixed Evidence',
        sources: data.sources?.map((s) => s.name).join(', ') || 'Research databases',
      },
    },
    sources: data.sources || [],
  };
}

/**
 * IngredientSearch - Main container for ingredient search feature.
 *
 * Combines SearchBar, IngredientCard, and HealthBreakdown components
 * with API integration and state management.
 */
export default function IngredientSearch() {
  // Search state
  const [searchQuery, setSearchQuery] = useState('');
  const [suggestions, setSuggestions] = useState([]);
  const [isSearching, setIsSearching] = useState(false);

  // Filter state
  const [categories, setCategories] = useState([]);
  const [activeCategory, setActiveCategory] = useState(null);
  const [sortBy, setSortBy] = useState('name');
  const [showFilters, setShowFilters] = useState(false);

  // Ingredient state
  const [selectedIngredient, setSelectedIngredient] = useState(null);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(null);

  // Saved state
  const [savedIngredients, setSavedIngredients] = useState(() => {
    const saved = localStorage.getItem('aurea_saved_ingredients');
    return saved ? JSON.parse(saved) : [];
  });

  // Debounced search query
  const debouncedQuery = useDebounce(searchQuery, 300);

  // Fetch available categories on mount
  useEffect(() => {
    const fetchCategories = async () => {
      try {
        const response = await ingredientApi.getCategories();
        setCategories(response.categories || []);
      } catch (err) {
        console.error('Failed to fetch categories:', err);
        // Set some default categories as fallback
        setCategories([
          'Sweeteners',
          'Fats & Oils',
          'Preservatives',
          'Emulsifiers',
          'Proteins',
          'Grains',
          'Dairy',
        ]);
      }
    };

    fetchCategories();
  }, []);

  // Fetch autocomplete suggestions
  useEffect(() => {
    if (debouncedQuery.length < 2) {
      setSuggestions([]);
      return;
    }

    const fetchSuggestions = async () => {
      setIsSearching(true);
      try {
        const response = await ingredientApi.search(debouncedQuery, 10, {
          category: activeCategory,
          sort_by: sortBy,
        });
        setSuggestions(response.results || []);
      } catch (err) {
        console.error('Search error:', err);
        setSuggestions([]);
      } finally {
        setIsSearching(false);
      }
    };

    fetchSuggestions();
  }, [debouncedQuery, activeCategory, sortBy]);

  // Fetch ingredient score
  const handleSelectIngredient = useCallback(async (ingredientName) => {
    setSearchQuery(ingredientName);
    setSuggestions([]);
    setIsLoading(true);
    setError(null);

    try {
      const data = await ingredientApi.getScore(ingredientName);
      const transformed = transformIngredientData(data);
      setSelectedIngredient(transformed);
    } catch (err) {
      console.error('Error fetching ingredient:', err);
      setError(err.response?.data?.detail || 'Failed to load ingredient data');
      setSelectedIngredient(null);
    } finally {
      setIsLoading(false);
    }
  }, []);

  // Toggle save ingredient
  const handleToggleSave = useCallback(() => {
    if (!selectedIngredient) return;

    setSavedIngredients((prev) => {
      const name = selectedIngredient.name;
      const newSaved = prev.includes(name) ? prev.filter((n) => n !== name) : [...prev, name];

      localStorage.setItem('aurea_saved_ingredients', JSON.stringify(newSaved));
      return newSaved;
    });
  }, [selectedIngredient]);

  const isSaved = selectedIngredient && savedIngredients.includes(selectedIngredient.name);

  return (
    <div className="min-h-screen py-6 px-4" style={{ backgroundColor: '#F5F3F0' }}>
      <div className="max-w-4xl mx-auto">
        {/* Search Bar */}
        <div className="mb-4">
          <SearchBar
            value={searchQuery}
            onChange={setSearchQuery}
            onSelect={handleSelectIngredient}
            suggestions={suggestions}
            isLoading={isSearching}
          />
        </div>

        {/* Filter Toggle Button */}
        <div className="flex items-center justify-between mb-4">
          <button
            onClick={() => setShowFilters(!showFilters)}
            className="inline-flex items-center gap-2 px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors"
          >
            <Filter size={16} />
            {showFilters ? 'Hide Filters' : 'Show Filters'}
          </button>

          <SortDropdown value={sortBy} onChange={setSortBy} />
        </div>

        {/* Category Tabs (collapsible) */}
        {showFilters && categories.length > 0 && (
          <CategoryTabs
            categories={categories}
            activeCategory={activeCategory}
            onSelect={setActiveCategory}
          />
        )}

        {/* Active Filters Display */}
        <ActiveFilters
          category={activeCategory}
          sortBy={sortBy}
          onClearCategory={() => setActiveCategory(null)}
          onClearSort={() => setSortBy('name')}
        />

        {/* Loading State with Skeleton */}
        {isLoading && (
          <div className="flex flex-col items-center">
            <IngredientCardSkeleton />
            <div className="mt-6 w-full max-w-xl">
              <HealthBreakdownSkeleton />
            </div>
          </div>
        )}

        {/* Error State */}
        {error && !isLoading && (
          <div
            className="max-w-md mx-auto p-6 rounded-xl border-2 text-center"
            style={{
              backgroundColor: '#FEF3C7',
              borderColor: '#F59E0B',
            }}
          >
            <p className="text-amber-800 mb-4">{error}</p>
            <button
              onClick={() => setError(null)}
              className="px-6 py-2 rounded-lg font-semibold text-white transition-colors"
              style={{ backgroundColor: '#2D7D5E' }}
            >
              Try Again
            </button>
          </div>
        )}

        {/* Ingredient Results */}
        {selectedIngredient && !isLoading && !error && (
          <div className="flex flex-col items-center">
            {/* Main Card */}
            <IngredientCard
              name={selectedIngredient.name}
              overallScore={selectedIngredient.overallScore}
              riskLevel={selectedIngredient.riskLevel}
              description={selectedIngredient.description}
              category={selectedIngredient.category}
              isTrusted={selectedIngredient.isTrusted}
              onSave={handleToggleSave}
              isSaved={isSaved}
            />

            {/* Health Breakdown */}
            <HealthBreakdown
              categories={selectedIngredient.categories}
              sources={selectedIngredient.sources}
            />

            {/* Add to Log Button */}
            <button
              className="mt-8 px-8 py-3 rounded-lg font-semibold text-white w-full max-w-xs transition-all hover:shadow-lg"
              style={{
                backgroundColor: '#2D7D5E',
              }}
            >
              ADD TO TODAY'S LOG
            </button>
          </div>
        )}

        {/* Empty State */}
        {!selectedIngredient && !isLoading && !error && (
          <div className="flex flex-col items-center justify-center py-16 px-4">
            <div
              className="w-20 h-20 rounded-full flex items-center justify-center mb-6"
              style={{ backgroundColor: '#E0F0EC' }}
            >
              <Search size={32} style={{ color: '#2D7D5E' }} aria-hidden="true" />
            </div>
            <h2
              className="text-xl font-semibold text-gray-900 mb-2 text-center"
              style={{ fontFamily: 'Georgia, serif' }}
            >
              Search for an Ingredient
            </h2>
            <p className="text-gray-500 text-center max-w-md mb-6">
              Enter an ingredient name above to see its health impact scores,
              research-backed information, and detailed breakdown.
            </p>
            <div className="flex flex-wrap justify-center gap-2">
              {['Sugar', 'Olive Oil', 'Aspartame', 'Whey Protein'].map((suggestion) => (
                <button
                  key={suggestion}
                  onClick={() => handleSelectIngredient(suggestion.toLowerCase())}
                  className="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-200 rounded-full hover:bg-gray-50 hover:border-gray-300 transition-colors focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500"
                >
                  Try "{suggestion}"
                </button>
              ))}
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
