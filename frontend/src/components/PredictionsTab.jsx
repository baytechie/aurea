import { useState } from 'react';
import {
  Sparkles,
  Plus,
  X,
  Loader2,
  AlertCircle,
  TrendingUp,
  ChevronRight,
} from 'lucide-react';
import { usePredictions, useCreatePrediction } from '../hooks/useIngredients';
import { CYCLE_PHASES, formatDate } from '../lib/utils';

/**
 * PredictionsTab - Request and view symptom predictions
 */
function PredictionsTab() {
  const { data: predictions, isLoading } = usePredictions();
  const createPrediction = useCreatePrediction();
  const [showForm, setShowForm] = useState(false);

  return (
    <div className="max-w-4xl">
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Predictions</h1>
          <p className="text-gray-600">See how foods might affect you</p>
        </div>
        <button
          onClick={() => setShowForm(true)}
          className="btn-primary flex items-center gap-2"
        >
          <Sparkles className="w-4 h-4" />
          New Prediction
        </button>
      </div>

      {/* Prediction Form Modal */}
      {showForm && (
        <PredictionForm
          onClose={() => setShowForm(false)}
          onSubmit={async (data) => {
            await createPrediction.mutateAsync(data);
            setShowForm(false);
          }}
          isSubmitting={createPrediction.isPending}
        />
      )}

      {/* Info Banner */}
      <div className="card mb-6 bg-gradient-to-r from-primary-50 to-secondary-50 border-primary-200">
        <div className="flex items-start gap-3">
          <Sparkles className="w-5 h-5 text-primary-600 mt-0.5" />
          <div>
            <p className="font-medium text-primary-900">How predictions work</p>
            <p className="text-sm text-primary-700 mt-1">
              We analyze your personal log history to predict how specific ingredients
              might affect your symptoms. The more you log, the more accurate predictions become.
            </p>
          </div>
        </div>
      </div>

      {/* Predictions List */}
      {isLoading ? (
        <div className="card flex items-center justify-center py-12">
          <Loader2 className="w-8 h-8 text-primary-600 animate-spin" />
          <span className="ml-3 text-gray-600">Loading predictions...</span>
        </div>
      ) : predictions?.length > 0 ? (
        <div className="space-y-4">
          {predictions.map((prediction) => (
            <PredictionCard key={prediction.id} prediction={prediction} />
          ))}
        </div>
      ) : (
        <div className="card text-center py-12">
          <Sparkles className="w-12 h-12 text-gray-300 mx-auto mb-4" />
          <p className="text-gray-600 mb-2">No predictions yet</p>
          <p className="text-sm text-gray-500 mb-4">
            Request your first prediction to see how foods might affect you
          </p>
          <button
            onClick={() => setShowForm(true)}
            className="btn-primary"
          >
            Create Prediction
          </button>
        </div>
      )}
    </div>
  );
}

/**
 * Prediction request form
 */
function PredictionForm({ onClose, onSubmit, isSubmitting }) {
  const [ingredients, setIngredients] = useState([]);
  const [ingredientInput, setIngredientInput] = useState('');
  const [cyclePhase, setCyclePhase] = useState('');

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

  const handleSubmit = (e) => {
    e.preventDefault();
    if (ingredients.length === 0) return;
    onSubmit({
      ingredients,
      cycle_phase: cyclePhase || null,
    });
  };

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center p-4 z-50">
      <div className="bg-white rounded-xl shadow-xl max-w-lg w-full max-h-[90vh] overflow-y-auto">
        <div className="p-6">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-xl font-bold text-gray-900">Request Prediction</h2>
            <button
              onClick={onClose}
              className="p-2 hover:bg-gray-100 rounded-lg transition-colors"
            >
              <X className="w-5 h-5 text-gray-500" />
            </button>
          </div>

          <form onSubmit={handleSubmit} className="space-y-6">
            {/* Ingredients Input */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                What are you planning to eat?
              </label>
              <div className="flex gap-2">
                <input
                  type="text"
                  value={ingredientInput}
                  onChange={(e) => setIngredientInput(e.target.value)}
                  onKeyDown={handleKeyDown}
                  placeholder="Add ingredient"
                  className="input-field flex-1"
                />
                <button
                  type="button"
                  onClick={addIngredient}
                  className="btn-secondary flex items-center gap-1"
                >
                  <Plus className="w-4 h-4" />
                </button>
              </div>

              {/* Ingredient Tags */}
              {ingredients.length > 0 && (
                <div className="flex flex-wrap gap-2 mt-3">
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
              )}
            </div>

            {/* Cycle Phase */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Current cycle phase (optional)
              </label>
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
            <div className="flex gap-3">
              <button
                type="button"
                onClick={onClose}
                className="btn-secondary flex-1"
              >
                Cancel
              </button>
              <button
                type="submit"
                disabled={ingredients.length === 0 || isSubmitting}
                className="btn-primary flex-1 flex items-center justify-center gap-2"
              >
                {isSubmitting ? (
                  <>
                    <Loader2 className="w-5 h-5 animate-spin" />
                    Analyzing...
                  </>
                ) : (
                  <>
                    <Sparkles className="w-5 h-5" />
                    Get Prediction
                  </>
                )}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}

/**
 * Individual prediction result card
 */
function PredictionCard({ prediction }) {
  const [expanded, setExpanded] = useState(false);

  // Calculate risk level based on bloating probability
  const riskLevel = prediction.predicted_bloating_probability > 0.6
    ? 'high'
    : prediction.predicted_bloating_probability > 0.3
    ? 'medium'
    : 'low';

  const riskColors = {
    high: 'bg-danger-100 text-danger-700 border-danger-200',
    medium: 'bg-warning-100 text-warning-700 border-warning-200',
    low: 'bg-success-100 text-success-700 border-success-200',
  };

  const riskLabels = {
    high: 'High Risk',
    medium: 'Moderate',
    low: 'Low Risk',
  };

  return (
    <div className="card hover:shadow-md transition-shadow">
      <div
        className="flex items-center justify-between cursor-pointer"
        onClick={() => setExpanded(!expanded)}
      >
        <div className="flex items-center gap-4">
          <div className={`px-3 py-1 rounded-full text-sm font-medium ${riskColors[riskLevel]}`}>
            {riskLabels[riskLevel]}
          </div>
          <div>
            <p className="text-sm text-gray-500">{formatDate(prediction.created_at)}</p>
            <p className="font-medium text-gray-900">
              {prediction.ingredients?.slice(0, 3).join(', ')}
              {prediction.ingredients?.length > 3 && ` +${prediction.ingredients.length - 3} more`}
            </p>
          </div>
        </div>
        <ChevronRight
          className={`w-5 h-5 text-gray-400 transition-transform ${expanded ? 'rotate-90' : ''}`}
        />
      </div>

      {expanded && (
        <div className="mt-4 pt-4 border-t border-gray-100 space-y-4">
          {/* Ingredients List */}
          <div>
            <p className="text-sm font-medium text-gray-700 mb-2">Ingredients analyzed:</p>
            <div className="flex flex-wrap gap-2">
              {prediction.ingredients?.map((ing) => (
                <span key={ing} className="badge badge-secondary">
                  {ing}
                </span>
              ))}
            </div>
          </div>

          {/* Symptom Predictions */}
          {prediction.predicted_symptoms && (
            <div>
              <p className="text-sm font-medium text-gray-700 mb-2">Predicted symptoms:</p>
              <div className="grid grid-cols-2 gap-3">
                {Object.entries(prediction.predicted_symptoms).map(([symptom, prob]) => (
                  <SymptomProbabilityBar key={symptom} symptom={symptom} probability={prob} />
                ))}
              </div>
            </div>
          )}

          {/* Interpretation */}
          {prediction.interpretation && (
            <div className="p-4 rounded-lg bg-gray-50">
              <p className="text-sm text-gray-700">
                <TrendingUp className="w-4 h-4 inline mr-2 text-primary-600" />
                {prediction.interpretation}
              </p>
            </div>
          )}

          {/* Confidence */}
          {prediction.confidence && (
            <div className="flex items-center gap-2 text-sm text-gray-500">
              <AlertCircle className="w-4 h-4" />
              Confidence: {prediction.confidence}
            </div>
          )}
        </div>
      )}
    </div>
  );
}

/**
 * Symptom probability bar visualization
 */
function SymptomProbabilityBar({ symptom, probability }) {
  const percent = (probability * 100).toFixed(0);
  const color = probability > 0.6 ? 'bg-danger-500' : probability > 0.3 ? 'bg-warning-500' : 'bg-success-500';

  // Format symptom name for display
  const displayName = symptom
    .replace(/_/g, ' ')
    .replace(/\b\w/g, (l) => l.toUpperCase());

  return (
    <div>
      <div className="flex items-center justify-between text-sm mb-1">
        <span className="text-gray-600">{displayName}</span>
        <span className="font-medium text-gray-900">{percent}%</span>
      </div>
      <div className="h-2 bg-gray-200 rounded-full overflow-hidden">
        <div
          className={`h-full rounded-full transition-all duration-500 ${color}`}
          style={{ width: `${percent}%` }}
        />
      </div>
    </div>
  );
}

export default PredictionsTab;
