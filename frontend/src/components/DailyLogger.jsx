import { useState, useEffect, useRef, useCallback } from 'react';
import { Plus, X, Loader2, Check, Calendar, Search, Clock, Zap } from 'lucide-react';
import { useQuery } from '@tanstack/react-query';
import { useCreateLog } from '../hooks/useIngredients';
import { ingredientApi } from '../lib/api';
import { SYMPTOM_LABELS, CYCLE_PHASES, getToday } from '../lib/utils';
import SymptomSlider from './SymptomSlider';

// Common foods for quick suggestions
const QUICK_ADD_FOODS = [
  'Eggs', 'Oatmeal', 'Banana', 'Chicken', 'Rice',
  'Salad', 'Coffee', 'Yogurt', 'Avocado', 'Bread',
];

const HISTORY_STORAGE_KEY = 'aurea_food_history';
const MAX_HISTORY_ITEMS = 20;

function DailyLogger() {
  const [date, setDate] = useState(getToday());
  const [ingredients, setIngredients] = useState([]);
  const [ingredientInput, setIngredientInput] = useState('');
  const [searchTerm, setSearchTerm] = useState('');
  const [recentFoods, setRecentFoods] = useState([]);
  const [showSuggestions, setShowSuggestions] = useState(false);
  const [symptoms, setSymptoms] = useState({
    energy: 3,
    bloating: 0,
    focus: 3,
    mood: 3,
    sleep: 3,
  });
  const [cyclePhase, setCyclePhase] = useState('');
  const [submitted, setSubmitted] = useState(false);
  const timeoutRef = useRef(null);
  const inputRef = useRef(null);

  const createLog = useCreateLog();

  // Load food history on mount
  useEffect(() => {
    loadFoodHistory();
  }, []);

  const loadFoodHistory = () => {
    try {
      const history = localStorage.getItem(HISTORY_STORAGE_KEY);
      if (history) {
        setRecentFoods(JSON.parse(history));
      }
    } catch (error) {
      console.log('Error loading food history:', error);
    }
  };

  const saveFoodHistory = (newFoods) => {
    try {
      const existingHistory = [...recentFoods];
      const updatedHistory = [...new Set([...newFoods, ...existingHistory])]
        .slice(0, MAX_HISTORY_ITEMS);
      localStorage.setItem(HISTORY_STORAGE_KEY, JSON.stringify(updatedHistory));
      setRecentFoods(updatedHistory);
    } catch (error) {
      console.log('Error saving food history:', error);
    }
  };

  // Search for ingredient suggestions
  const { data: searchResults, isLoading: isSearching } = useQuery({
    queryKey: ['ingredientSearch', searchTerm],
    queryFn: () => ingredientApi.search(searchTerm, 10),
    enabled: searchTerm.length >= 2,
  });

  // Cleanup timeout on unmount
  useEffect(() => {
    return () => {
      if (timeoutRef.current) {
        clearTimeout(timeoutRef.current);
      }
    };
  }, []);

  const handleInputChange = useCallback((e) => {
    const value = e.target.value;
    setIngredientInput(value);
    setShowSuggestions(true);

    // Clear previous timeout
    if (timeoutRef.current) {
      clearTimeout(timeoutRef.current);
    }

    // Set new debounced search
    timeoutRef.current = setTimeout(() => {
      setSearchTerm(value);
    }, 300);
  }, []);

  const addIngredient = (name) => {
    const toAdd = name || ingredientInput.trim();
    const normalized = toAdd.toLowerCase();
    if (normalized && !ingredients.includes(normalized)) {
      setIngredients([...ingredients, normalized]);
    }
    setIngredientInput('');
    setSearchTerm('');
    setShowSuggestions(false);
  };

  const removeIngredient = (ingredient) => {
    setIngredients(ingredients.filter((i) => i !== ingredient));
  };

  const handleKeyDown = (e) => {
    if (e.key === 'Enter') {
      e.preventDefault();
      addIngredient();
    }
  };

  const handleSymptomChange = (symptom, value) => {
    setSymptoms({ ...symptoms, [symptom]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (ingredients.length === 0) return;

    try {
      await createLog.mutateAsync({
        date,
        ingredients,
        symptoms,
        cycle_phase: cyclePhase || null,
      });
      // Save foods to history before clearing
      saveFoodHistory(ingredients);
      setSubmitted(true);
      // Reset form after delay
      setTimeout(() => {
        setIngredients([]);
        setSymptoms({ energy: 3, bloating: 0, focus: 3, mood: 3, sleep: 3 });
        setCyclePhase('');
        setSubmitted(false);
      }, 2000);
    } catch (error) {
      console.error('Failed to submit log:', error);
    }
  };

  // Filter suggestions to not show already added items
  const filteredSuggestions = (searchResults?.results || [])
    .filter((item) => !ingredients.includes((item.ingredient_name || item.name || '').toLowerCase()))
    .slice(0, 6);

  // Get recent foods not already added
  const availableRecentFoods = recentFoods
    .filter((food) => !ingredients.includes(food.toLowerCase()))
    .slice(0, 8);

  // Get quick add foods not already added
  const availableQuickFoods = QUICK_ADD_FOODS
    .filter((food) => !ingredients.includes(food.toLowerCase()))
    .slice(0, 10);

  // Match input to available foods for inline suggestions
  const matchingFoods = ingredientInput.length >= 1
    ? [...recentFoods, ...QUICK_ADD_FOODS]
        .filter((food) =>
          food.toLowerCase().startsWith(ingredientInput.toLowerCase()) &&
          !ingredients.includes(food.toLowerCase())
        )
        .slice(0, 5)
    : [];

  if (submitted) {
    return (
      <div className="max-w-2xl">
        <div className="card text-center py-12">
          <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <Check className="w-8 h-8 text-green-600" />
          </div>
          <h2 className="text-xl font-semibold text-gray-900 mb-2">Log Saved!</h2>
          <p className="text-gray-600">
            Your entry has been recorded. Keep tracking to unlock insights!
          </p>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-2xl">
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Daily Logger</h1>
      <p className="text-gray-600 mb-6">
        Record what you ate and how you feel today
      </p>

      <form onSubmit={handleSubmit} className="space-y-6">
        {/* Date Picker */}
        <div className="card">
          <label className="block text-sm font-medium text-gray-700 mb-2">
            <Calendar className="w-4 h-4 inline mr-2" />
            Date
          </label>
          <input
            type="date"
            value={date}
            onChange={(e) => setDate(e.target.value)}
            max={getToday()}
            className="input-field"
          />
        </div>

        {/* Ingredients Section */}
        <div className="card">
          <h2 className="font-semibold text-gray-900 mb-4">What did you eat?</h2>

          {/* Ingredient Input */}
          <div className="relative mb-4">
            <div className="flex gap-2">
              <div className="relative flex-1">
                <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400" />
                <input
                  ref={inputRef}
                  type="text"
                  value={ingredientInput}
                  onChange={handleInputChange}
                  onKeyDown={handleKeyDown}
                  onFocus={() => setShowSuggestions(true)}
                  placeholder="Search or type food..."
                  className="input-field pl-10 pr-10"
                />
                {ingredientInput && (
                  <button
                    type="button"
                    onClick={() => {
                      setIngredientInput('');
                      setSearchTerm('');
                    }}
                    className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600"
                  >
                    <X className="w-4 h-4" />
                  </button>
                )}
              </div>
              <button
                type="button"
                onClick={() => addIngredient()}
                disabled={!ingredientInput.trim()}
                className="btn-secondary flex items-center gap-1 disabled:opacity-50 disabled:cursor-not-allowed"
              >
                <Plus className="w-4 h-4" />
                Add
              </button>
            </div>

            {/* Live Suggestions Dropdown */}
            {showSuggestions && ingredientInput.length >= 2 && (
              <div className="absolute z-10 w-full mt-1 bg-white rounded-lg border border-gray-200 shadow-lg max-h-64 overflow-y-auto">
                {isSearching ? (
                  <div className="flex items-center justify-center gap-2 p-4 text-gray-500">
                    <Loader2 className="w-4 h-4 animate-spin" />
                    <span className="text-sm">Searching...</span>
                  </div>
                ) : filteredSuggestions.length > 0 ? (
                  <>
                    <p className="text-xs font-semibold text-gray-500 px-3 pt-2 pb-1 uppercase">Suggestions</p>
                    {filteredSuggestions.map((item, idx) => (
                      <button
                        key={`${item.ingredient_name || item.name}-${idx}`}
                        type="button"
                        onClick={() => addIngredient(item.ingredient_name || item.name)}
                        className="w-full flex items-center gap-3 px-3 py-2 hover:bg-gray-50 text-left border-b border-gray-100 last:border-0"
                      >
                        <span className="w-6 h-6 rounded bg-teal-100 flex items-center justify-center">
                          <span className="text-teal-600 text-xs">🥬</span>
                        </span>
                        <span className="flex-1 text-sm capitalize">{item.ingredient_name || item.name}</span>
                        <Plus className="w-4 h-4 text-teal-600" />
                      </button>
                    ))}
                  </>
                ) : matchingFoods.length > 0 ? (
                  <>
                    <p className="text-xs font-semibold text-gray-500 px-3 pt-2 pb-1 uppercase">Quick Add</p>
                    {matchingFoods.map((food, idx) => (
                      <button
                        key={`match-${food}-${idx}`}
                        type="button"
                        onClick={() => addIngredient(food)}
                        className="w-full flex items-center gap-3 px-3 py-2 hover:bg-gray-50 text-left border-b border-gray-100 last:border-0"
                      >
                        <Clock className="w-4 h-4 text-gray-400" />
                        <span className="flex-1 text-sm capitalize">{food}</span>
                        <Plus className="w-4 h-4 text-teal-600" />
                      </button>
                    ))}
                  </>
                ) : (
                  <button
                    type="button"
                    onClick={() => addIngredient()}
                    className="w-full flex items-center gap-3 px-3 py-3 hover:bg-gray-50 text-left"
                  >
                    <Plus className="w-4 h-4 text-teal-600" />
                    <span className="text-sm">Add "{ingredientInput}"</span>
                  </button>
                )}
              </div>
            )}
          </div>

          {/* Added Ingredients */}
          {ingredients.length > 0 && (
            <div className="mb-4">
              <p className="text-sm text-green-600 font-medium mb-2 flex items-center gap-1">
                <Check className="w-4 h-4" />
                Added ({ingredients.length})
              </p>
              <div className="flex flex-wrap gap-2">
                {ingredients.map((ingredient) => (
                  <span
                    key={ingredient}
                    className="inline-flex items-center gap-1 px-3 py-1 bg-teal-100 text-teal-700 rounded-full text-sm"
                  >
                    {ingredient}
                    <button
                      type="button"
                      onClick={() => removeIngredient(ingredient)}
                      className="hover:text-teal-900"
                    >
                      <X className="w-4 h-4" />
                    </button>
                  </span>
                ))}
              </div>
            </div>
          )}

          {/* Recent Foods */}
          {availableRecentFoods.length > 0 && !showSuggestions && (
            <div className="mb-4">
              <p className="text-sm text-gray-600 font-medium mb-2 flex items-center gap-1">
                <Clock className="w-4 h-4" />
                Recent
              </p>
              <div className="flex flex-wrap gap-2">
                {availableRecentFoods.map((food, idx) => (
                  <button
                    key={`recent-${food}-${idx}`}
                    type="button"
                    onClick={() => addIngredient(food)}
                    className="inline-flex items-center gap-1 px-3 py-1 bg-gray-100 text-gray-700 rounded-full text-sm hover:bg-gray-200 transition-colors"
                  >
                    {food}
                    <Plus className="w-3 h-3" />
                  </button>
                ))}
              </div>
            </div>
          )}

          {/* Quick Add Foods */}
          {ingredients.length === 0 && availableRecentFoods.length === 0 && !showSuggestions && (
            <div>
              <p className="text-sm text-gray-600 font-medium mb-2 flex items-center gap-1">
                <Zap className="w-4 h-4" />
                Quick Add
              </p>
              <div className="flex flex-wrap gap-2">
                {availableQuickFoods.map((food, idx) => (
                  <button
                    key={`quick-${food}-${idx}`}
                    type="button"
                    onClick={() => addIngredient(food)}
                    className="inline-flex items-center gap-1 px-3 py-1 bg-teal-50 text-teal-700 rounded-full text-sm hover:bg-teal-100 transition-colors"
                  >
                    {food}
                    <Plus className="w-3 h-3" />
                  </button>
                ))}
              </div>
            </div>
          )}

          {/* Add More when some ingredients selected */}
          {ingredients.length > 0 && availableQuickFoods.length > 0 && !showSuggestions && (
            <div>
              <p className="text-sm text-gray-600 font-medium mb-2 flex items-center gap-1">
                <Plus className="w-4 h-4" />
                Add More
              </p>
              <div className="flex flex-wrap gap-2">
                {availableQuickFoods.slice(0, 6).map((food, idx) => (
                  <button
                    key={`more-${food}-${idx}`}
                    type="button"
                    onClick={() => addIngredient(food)}
                    className="inline-flex items-center gap-1 px-3 py-1 bg-white border border-gray-200 text-gray-600 rounded-full text-sm hover:bg-gray-50 transition-colors"
                  >
                    {food}
                    <Plus className="w-3 h-3" />
                  </button>
                ))}
              </div>
            </div>
          )}

          {/* Empty State Hint */}
          {ingredients.length === 0 && !showSuggestions && availableRecentFoods.length === 0 && (
            <p className="text-sm text-gray-500 text-center mt-4">
              Tap items above or search to add what you ate
            </p>
          )}
        </div>

        {/* Symptoms Section */}
        <div className="card">
          <h2 className="font-semibold text-gray-900 mb-4">How do you feel?</h2>
          <div className="space-y-6">
            {Object.entries(SYMPTOM_LABELS).map(([key, label]) => (
              <SymptomSlider
                key={key}
                label={label}
                value={symptoms[key]}
                onChange={(value) => handleSymptomChange(key, value)}
                inverted={key === 'bloating'}
              />
            ))}
          </div>
        </div>

        {/* Cycle Phase (Optional) */}
        <div className="card">
          <h2 className="font-semibold text-gray-900 mb-2">
            Cycle Phase <span className="font-normal text-gray-500">(optional)</span>
          </h2>
          <p className="text-sm text-gray-500 mb-4">
            Track your menstrual cycle for more personalized insights
          </p>
          <select
            value={cyclePhase}
            onChange={(e) => setCyclePhase(e.target.value)}
            className="input-field"
          >
            {CYCLE_PHASES.map((phase) => (
              <option key={phase.value} value={phase.value}>
                {phase.label}
              </option>
            ))}
          </select>
        </div>

        {/* Submit Button */}
        <button
          type="submit"
          disabled={ingredients.length === 0 || createLog.isPending}
          className="btn-primary w-full flex items-center justify-center gap-2"
        >
          {createLog.isPending ? (
            <>
              <Loader2 className="w-5 h-5 animate-spin" />
              Saving...
            </>
          ) : (
            <>
              <Check className="w-5 h-5" />
              Save Daily Log
            </>
          )}
        </button>

        {createLog.error && (
          <p className="text-red-500 text-sm text-center">
            Failed to save log. Please try again.
          </p>
        )}
      </form>
    </div>
  );
}

export default DailyLogger;
