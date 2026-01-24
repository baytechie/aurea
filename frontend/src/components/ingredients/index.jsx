import React, { useState, useCallback, useEffect } from 'react';
import { Loader2 } from 'lucide-react';
import SearchBar from './SearchBar';
import IngredientCard from './IngredientCard';
import HealthBreakdown from './HealthBreakdown';
import { ingredientApi } from '../../lib/api';

// Debounce hook
function useDebounce(value, delay) {
  const [debouncedValue, setDebouncedValue] = useState(value);
  
  useEffect(() => {
    const timer = setTimeout(() => setDebouncedValue(value), delay);
    return () => clearTimeout(timer);
  }, [value, delay]);
  
  return debouncedValue;
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

  // Fetch autocomplete suggestions
  useEffect(() => {
    if (debouncedQuery.length < 2) {
      setSuggestions([]);
      return;
    }

    const fetchSuggestions = async () => {
      setIsSearching(true);
      try {
        const response = await ingredientApi.search(debouncedQuery, 10);
        setSuggestions(response.results || []);
      } catch (err) {
        console.error('Search error:', err);
        setSuggestions([]);
      } finally {
        setIsSearching(false);
      }
    };

    fetchSuggestions();
  }, [debouncedQuery]);

  // Fetch ingredient score
  const handleSelectIngredient = useCallback(async (ingredientName) => {
    setSearchQuery(ingredientName);
    setSuggestions([]);
    setIsLoading(true);
    setError(null);

    try {
      const data = await ingredientApi.getScore(ingredientName);
      
      // Transform API response to component format
      setSelectedIngredient({
        name: data.name,
        overallScore: data.overall_score,
        riskLevel: null, // Will be computed from score
        description: 'Based on current evidence, this ingredient shows ' + 
          (data.overall_score >= 70 ? 'low' : data.overall_score >= 50 ? 'moderate' : 'high') + 
          ' health impact for most people.',
        categories: {
          bloodSugar: {
            score: data.blood_sugar_impact,
            description: 'How this ingredient affects blood glucose levels',
            details: []
          },
          inflammation: {
            score: data.inflammation_potential,
            description: 'Ingredients commonly associated with inflammatory responses',
            details: []
          },
          gut: {
            score: data.gut_impact,
            description: 'Likelihood of digestive discomfort for sensitive individuals',
            details: []
          },
          hormonal: {
            score: data.hormonal_relevance?.score,
            description: 'Ingredients discussed in hormone-related research',
            details: data.hormonal_relevance?.details ? [data.hormonal_relevance.details] : []
          },
          evidence: {
            confidence: data.evidence_confidence || 'Mixed Evidence',
            sources: data.sources?.map(s => s.name).join(', ') || 'Research databases'
          }
        }
      });
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
    
    setSavedIngredients(prev => {
      const name = selectedIngredient.name;
      const newSaved = prev.includes(name)
        ? prev.filter(n => n !== name)
        : [...prev, name];
      
      localStorage.setItem('aurea_saved_ingredients', JSON.stringify(newSaved));
      return newSaved;
    });
  }, [selectedIngredient]);

  const isSaved = selectedIngredient && savedIngredients.includes(selectedIngredient.name);

  return (
    <div 
      className="min-h-screen py-6 px-4"
      style={{ backgroundColor: '#F5F3F0' }}
    >
      <div className="max-w-4xl mx-auto">
        {/* Search Bar */}
        <div className="mb-8">
          <SearchBar
            value={searchQuery}
            onChange={setSearchQuery}
            onSelect={handleSelectIngredient}
            suggestions={suggestions}
            isLoading={isSearching}
          />
        </div>

        {/* Loading State */}
        {isLoading && (
          <div className="flex justify-center items-center py-20">
            <Loader2 
              size={40} 
              className="animate-spin"
              style={{ color: '#2D7D5E' }}
            />
          </div>
        )}

        {/* Error State */}
        {error && !isLoading && (
          <div 
            className="max-w-md mx-auto p-6 rounded-xl border-2 text-center"
            style={{ 
              backgroundColor: '#FEF3C7',
              borderColor: '#F59E0B'
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
              onSave={handleToggleSave}
              isSaved={isSaved}
            />

            {/* Health Breakdown */}
            <HealthBreakdown categories={selectedIngredient.categories} />

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
          <div className="flex justify-center items-center py-20">
            <p className="text-lg text-gray-500">
              Search for an ingredient to get started
            </p>
          </div>
        )}
      </div>
    </div>
  );
}
