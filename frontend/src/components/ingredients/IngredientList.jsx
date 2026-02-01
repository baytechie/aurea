import React, { useState, useEffect, useCallback } from 'react';
import { Loader2, ChevronDown, Filter, X, Search } from 'lucide-react';
import IngredientCard, { IngredientCardSkeleton } from './IngredientCard';
import { ingredientApi } from '../../lib/api';
import { getCategoryStyle, formatCategoryName } from '../../lib/scoreUtils';

/**
 * Sort options for ingredient list.
 */
const SORT_OPTIONS = [
  { value: 'name', label: 'Name (A-Z)' },
  { value: 'overall_score_desc', label: 'Highest Score' },
  { value: 'overall_score_asc', label: 'Lowest Score' },
  { value: 'blood_sugar_impact', label: 'Blood Sugar Impact' },
  { value: 'gut_impact', label: 'Gut Health' },
];

/**
 * IngredientList - Grid view of ingredients with filtering and sorting.
 *
 * Features:
 * - Category filter tabs
 * - Sort dropdown
 * - Compact ingredient cards
 * - Infinite scroll or pagination
 *
 * @param {Object} props
 * @param {function} props.onSelectIngredient - Callback when ingredient is clicked
 * @param {Array} props.savedIngredients - List of saved ingredient names
 * @param {function} props.onToggleSave - Callback to save/unsave an ingredient
 */
export default function IngredientList({
  onSelectIngredient,
  savedIngredients = [],
  onToggleSave
}) {
  // State
  const [ingredients, setIngredients] = useState([]);
  const [categories, setCategories] = useState([]);
  const [activeCategory, setActiveCategory] = useState(null);
  const [sortBy, setSortBy] = useState('overall_score_desc');
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);
  const [page, setPage] = useState(1);
  const [hasMore, setHasMore] = useState(true);
  const [searchQuery, setSearchQuery] = useState('');

  const PAGE_SIZE = 20;

  // Fetch categories on mount
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

  // Fetch ingredients
  const fetchIngredients = useCallback(async (reset = false) => {
    setIsLoading(true);
    setError(null);

    try {
      const currentPage = reset ? 1 : page;
      const response = await ingredientApi.getIngredientsList({
        category: activeCategory,
        sort_by: sortBy,
        limit: PAGE_SIZE,
        offset: (currentPage - 1) * PAGE_SIZE,
        q: searchQuery || undefined
      });

      const newIngredients = response.ingredients || [];

      if (reset) {
        setIngredients(newIngredients);
        setPage(1);
      } else {
        setIngredients(prev => [...prev, ...newIngredients]);
      }

      setHasMore(newIngredients.length === PAGE_SIZE);
    } catch (err) {
      console.error('Failed to fetch ingredients:', err);
      setError('Failed to load ingredients. Please try again.');
    } finally {
      setIsLoading(false);
    }
  }, [page, activeCategory, sortBy, searchQuery]);

  // Fetch on filter/sort changes
  useEffect(() => {
    fetchIngredients(true);
  }, [activeCategory, sortBy, searchQuery]);

  // Load more handler
  const loadMore = () => {
    if (!isLoading && hasMore) {
      setPage(prev => prev + 1);
      fetchIngredients(false);
    }
  };

  // Handle category change
  const handleCategoryChange = (category) => {
    setActiveCategory(category);
    setIngredients([]);
    setPage(1);
  };

  // Handle sort change
  const handleSortChange = (newSort) => {
    setSortBy(newSort);
    setIngredients([]);
    setPage(1);
  };

  return (
    <div className="w-full">
      {/* Search Input */}
      <div className="relative mb-4">
        <Search
          size={18}
          className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400"
          aria-hidden="true"
        />
        <input
          type="text"
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          placeholder="Search ingredients..."
          className="w-full pl-10 pr-4 py-2.5 text-sm border border-gray-200 rounded-lg bg-white focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent transition-shadow"
        />
        {searchQuery && (
          <button
            onClick={() => setSearchQuery('')}
            className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600"
            aria-label="Clear search"
          >
            <X size={16} />
          </button>
        )}
      </div>

      {/* Filters Row */}
      <div className="flex items-center justify-between gap-4 mb-4">
        {/* Category Pills - Horizontal scroll on mobile */}
        <div className="flex-1 overflow-x-auto">
          <div className="flex gap-2 pb-2">
            <button
              onClick={() => handleCategoryChange(null)}
              className={`flex-shrink-0 px-3 py-1.5 rounded-full text-xs font-medium transition-all ${
                !activeCategory
                  ? 'bg-[#2D7D5E] text-white'
                  : 'bg-white text-gray-600 border border-gray-200 hover:bg-gray-50'
              }`}
            >
              All
            </button>
            {categories.slice(0, 5).map((category) => {
              const style = getCategoryStyle(category);
              const isActive = activeCategory === category;
              return (
                <button
                  key={category}
                  onClick={() => handleCategoryChange(category)}
                  className={`flex-shrink-0 px-3 py-1.5 rounded-full text-xs font-medium transition-all ${
                    isActive
                      ? ''
                      : 'bg-white border border-gray-200 hover:bg-gray-50'
                  }`}
                  style={isActive ? {
                    backgroundColor: style.bgColor,
                    color: style.color
                  } : undefined}
                >
                  {formatCategoryName(category)}
                </button>
              );
            })}
            {categories.length > 5 && (
              <button
                className="flex-shrink-0 px-3 py-1.5 rounded-full text-xs font-medium bg-white text-gray-600 border border-gray-200 hover:bg-gray-50"
              >
                +{categories.length - 5} more
              </button>
            )}
          </div>
        </div>

        {/* Sort Dropdown */}
        <div className="relative flex-shrink-0">
          <select
            value={sortBy}
            onChange={(e) => handleSortChange(e.target.value)}
            className="appearance-none bg-white border border-gray-200 rounded-lg pl-3 pr-8 py-1.5 text-xs font-medium text-gray-600 cursor-pointer hover:border-gray-300 focus:outline-none focus:ring-2 focus:ring-green-500"
          >
            {SORT_OPTIONS.map((option) => (
              <option key={option.value} value={option.value}>
                {option.label}
              </option>
            ))}
          </select>
          <ChevronDown
            size={14}
            className="absolute right-2 top-1/2 -translate-y-1/2 text-gray-400 pointer-events-none"
          />
        </div>
      </div>

      {/* Active Filter Tags */}
      {(activeCategory || searchQuery) && (
        <div className="flex flex-wrap gap-2 mb-4">
          {searchQuery && (
            <span className="inline-flex items-center gap-1 px-2.5 py-1 rounded-full text-xs bg-gray-100 text-gray-700">
              Search: "{searchQuery}"
              <button
                onClick={() => setSearchQuery('')}
                className="ml-1 hover:text-gray-900"
                aria-label="Clear search filter"
              >
                <X size={12} />
              </button>
            </span>
          )}
          {activeCategory && (
            <span
              className="inline-flex items-center gap-1 px-2.5 py-1 rounded-full text-xs"
              style={{
                backgroundColor: getCategoryStyle(activeCategory).bgColor,
                color: getCategoryStyle(activeCategory).color
              }}
            >
              {formatCategoryName(activeCategory)}
              <button
                onClick={() => handleCategoryChange(null)}
                className="ml-1 opacity-70 hover:opacity-100"
                aria-label="Clear category filter"
              >
                <X size={12} />
              </button>
            </span>
          )}
        </div>
      )}

      {/* Error State */}
      {error && (
        <div className="p-4 bg-red-50 border border-red-200 rounded-lg text-center mb-4">
          <p className="text-red-600 text-sm">{error}</p>
          <button
            onClick={() => fetchIngredients(true)}
            className="mt-2 text-sm text-red-700 underline hover:no-underline"
          >
            Try again
          </button>
        </div>
      )}

      {/* Ingredients Grid */}
      <div className="space-y-3">
        {ingredients.map((ingredient) => (
          <IngredientCard
            key={ingredient.name}
            name={ingredient.name}
            overallScore={ingredient.overall_score}
            category={ingredient.category}
            isTrusted={ingredient.is_trusted === 1}
            compact={true}
            onClick={() => onSelectIngredient(ingredient.name)}
            onSave={onToggleSave ? () => onToggleSave(ingredient.name) : undefined}
            isSaved={savedIngredients.includes(ingredient.name)}
          />
        ))}

        {/* Loading State */}
        {isLoading && (
          <>
            {ingredients.length === 0 ? (
              // Initial loading - show multiple skeletons
              Array.from({ length: 6 }).map((_, i) => (
                <IngredientCardSkeleton key={i} compact={true} />
              ))
            ) : (
              // Loading more - show spinner
              <div className="flex justify-center py-4">
                <Loader2 size={24} className="animate-spin text-gray-400" />
              </div>
            )}
          </>
        )}
      </div>

      {/* Empty State */}
      {!isLoading && ingredients.length === 0 && !error && (
        <div className="text-center py-12">
          <div
            className="w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4"
            style={{ backgroundColor: '#E0F0EC' }}
          >
            <Search size={24} style={{ color: '#2D7D5E' }} />
          </div>
          <h3 className="text-lg font-semibold text-gray-900 mb-2">
            No ingredients found
          </h3>
          <p className="text-gray-500 text-sm max-w-xs mx-auto">
            {searchQuery
              ? `No results for "${searchQuery}". Try a different search term.`
              : 'No ingredients match your current filters.'}
          </p>
          {(searchQuery || activeCategory) && (
            <button
              onClick={() => {
                setSearchQuery('');
                setActiveCategory(null);
              }}
              className="mt-4 text-sm text-[#2D7D5E] font-medium hover:underline"
            >
              Clear all filters
            </button>
          )}
        </div>
      )}

      {/* Load More Button */}
      {!isLoading && hasMore && ingredients.length > 0 && (
        <div className="flex justify-center mt-6">
          <button
            onClick={loadMore}
            className="px-6 py-2.5 text-sm font-medium text-[#2D7D5E] bg-white border border-[#2D7D5E] rounded-lg hover:bg-[#E0F0EC] transition-colors focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500"
          >
            Load More
          </button>
        </div>
      )}

      {/* End of List */}
      {!isLoading && !hasMore && ingredients.length > 0 && (
        <p className="text-center text-sm text-gray-400 mt-6">
          Showing all {ingredients.length} ingredients
        </p>
      )}
    </div>
  );
}
