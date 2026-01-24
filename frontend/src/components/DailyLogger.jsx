import { useState } from 'react';
import { Plus, X, Loader2, Check, Calendar } from 'lucide-react';
import { useCreateLog } from '../hooks/useIngredients';
import { SYMPTOM_LABELS, CYCLE_PHASES, getToday } from '../lib/utils';
import SymptomSlider from './SymptomSlider';

function DailyLogger() {
  const [date, setDate] = useState(getToday());
  const [ingredients, setIngredients] = useState([]);
  const [ingredientInput, setIngredientInput] = useState('');
  const [symptoms, setSymptoms] = useState({
    energy: 3,
    bloating: 0,
    focus: 3,
    mood: 3,
    sleep: 3,
  });
  const [cyclePhase, setCyclePhase] = useState('');
  const [submitted, setSubmitted] = useState(false);

  const createLog = useCreateLog();

  const addIngredient = () => {
    const trimmed = ingredientInput.trim().toLowerCase();
    if (trimmed && !ingredients.includes(trimmed)) {
      setIngredients([...ingredients, trimmed]);
      setIngredientInput('');
    }
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
          <div className="flex gap-2 mb-4">
            <input
              type="text"
              value={ingredientInput}
              onChange={(e) => setIngredientInput(e.target.value)}
              onKeyDown={handleKeyDown}
              placeholder="Add an ingredient (e.g., sugar, wheat, dairy)"
              className="input-field flex-1"
            />
            <button
              type="button"
              onClick={addIngredient}
              className="btn-secondary flex items-center gap-1"
            >
              <Plus className="w-4 h-4" />
              Add
            </button>
          </div>

          {/* Ingredient Tags */}
          {ingredients.length > 0 ? (
            <div className="flex flex-wrap gap-2">
              {ingredients.map((ingredient) => (
                <span
                  key={ingredient}
                  className="inline-flex items-center gap-1 px-3 py-1 bg-primary-100 text-primary-700 rounded-full text-sm"
                >
                  {ingredient}
                  <button
                    type="button"
                    onClick={() => removeIngredient(ingredient)}
                    className="hover:text-primary-900"
                  >
                    <X className="w-4 h-4" />
                  </button>
                </span>
              ))}
            </div>
          ) : (
            <p className="text-sm text-gray-500">No ingredients added yet</p>
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

function SymptomSliderFallback({ label, value, onChange, inverted = false }) {
  const labels = inverted
    ? ['None', 'Mild', 'Moderate', 'High', 'Severe', 'Extreme']
    : ['Very Low', 'Low', 'Moderate', 'Good', 'Great', 'Excellent'];

  return (
    <div>
      <div className="flex items-center justify-between mb-2">
        <label className="text-sm font-medium text-gray-700">{label}</label>
        <span className="text-sm text-primary-600 font-medium">
          {labels[value]}
        </span>
      </div>
      <input
        type="range"
        min="0"
        max="5"
        value={value}
        onChange={(e) => onChange(parseInt(e.target.value))}
        className="symptom-slider"
      />
      <div className="flex justify-between text-xs text-gray-400 mt-1">
        <span>{labels[0]}</span>
        <span>{labels[5]}</span>
      </div>
    </div>
  );
}

export default DailyLogger;
