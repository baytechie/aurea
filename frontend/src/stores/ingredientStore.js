import { create } from 'zustand';
import { persist } from 'zustand/middleware';

/**
 * Ingredient Store - Manages ingredient search state across components.
 * 
 * Features:
 * - Persists saved ingredients to localStorage
 * - Caches recent searches
 * - Manages current ingredient selection
 */
export const useIngredientStore = create(
  persist(
    (set, get) => ({
      // Current ingredient selection
      currentIngredient: null,
      setCurrentIngredient: (ingredient) => set({ currentIngredient: ingredient }),
      clearCurrentIngredient: () => set({ currentIngredient: null }),

      // Saved/bookmarked ingredients
      savedIngredients: [],
      toggleSavedIngredient: (ingredientName) => set((state) => {
        const isSaved = state.savedIngredients.includes(ingredientName);
        return {
          savedIngredients: isSaved
            ? state.savedIngredients.filter(n => n !== ingredientName)
            : [...state.savedIngredients, ingredientName]
        };
      }),
      isIngredientSaved: (ingredientName) => get().savedIngredients.includes(ingredientName),

      // Recent searches (last 10)
      recentSearches: [],
      addRecentSearch: (ingredientName) => set((state) => {
        const filtered = state.recentSearches.filter(n => n !== ingredientName);
        return {
          recentSearches: [ingredientName, ...filtered].slice(0, 10)
        };
      }),
      clearRecentSearches: () => set({ recentSearches: [] }),

      // Search state
      searchQuery: '',
      setSearchQuery: (query) => set({ searchQuery: query }),
      
      // Loading states
      isLoading: false,
      setIsLoading: (loading) => set({ isLoading: loading }),
      
      // Error state
      error: null,
      setError: (error) => set({ error }),
      clearError: () => set({ error: null }),
    }),
    {
      name: 'aurea-ingredient-store',
      partialize: (state) => ({
        savedIngredients: state.savedIngredients,
        recentSearches: state.recentSearches,
      }),
    }
  )
);

export default useIngredientStore;
