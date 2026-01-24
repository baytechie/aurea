import { useCallback, useRef } from 'react';

/**
 * Emoji mappings for each symptom type and level (0-5)
 */
const SYMPTOM_EMOJIS = {
  energy: ['😴', '😪', '😐', '🙂', '😊', '🌟'],
  bloating: ['😊', '🙂', '😐', '😕', '😣', '😫'],
  focus: ['🌫️', '😵', '🤔', '💭', '🎯', '🧠'],
  mood: ['😢', '😔', '😐', '🙂', '😄', '🥳'],
  sleep: ['😩', '😴', '😐', '😌', '😊', '💤'],
};

/**
 * Default emoji set for unknown symptom types
 */
const DEFAULT_EMOJIS = ['😔', '😕', '😐', '🙂', '😊', '🌟'];

/**
 * Get emoji for a specific symptom and level
 */
function getEmoji(symptomKey, level, inverted = false) {
  const emojis = SYMPTOM_EMOJIS[symptomKey] || DEFAULT_EMOJIS;
  const index = Math.min(Math.max(level, 0), 5);
  return emojis[index];
}

/**
 * Get background color class based on value and inverted status
 */
function getSliderColor(value, inverted = false) {
  const normalizedValue = inverted ? 5 - value : value;
  if (normalizedValue >= 4) return 'bg-success-500';
  if (normalizedValue >= 2) return 'bg-warning-500';
  return 'bg-danger-500';
}

/**
 * SymptomSlider - An accessible slider component with emoji indicators
 * for tracking symptom levels from 0-5.
 *
 * @param {Object} props
 * @param {string} props.id - Unique identifier for the slider
 * @param {string} props.symptomKey - Key to identify the symptom type (energy, bloating, etc.)
 * @param {string} props.label - Display label for the symptom
 * @param {number} props.value - Current value (0-5)
 * @param {function} props.onChange - Callback when value changes
 * @param {boolean} props.inverted - Whether higher values are negative (e.g., bloating)
 * @param {boolean} props.disabled - Disable interaction
 * @param {string} props.helpText - Optional help text displayed below slider
 */
function SymptomSlider({
  id,
  symptomKey = 'default',
  label,
  value,
  onChange,
  inverted = false,
  disabled = false,
  helpText,
}) {
  const sliderRef = useRef(null);

  // Label texts based on inverted status
  const labels = inverted
    ? ['None', 'Mild', 'Moderate', 'High', 'Severe', 'Extreme']
    : ['Very Low', 'Low', 'Moderate', 'Good', 'Great', 'Excellent'];

  // Current label text for screen readers and display
  const currentLabel = labels[value];
  const currentEmoji = getEmoji(symptomKey, value, inverted);

  // Handle keyboard navigation for accessibility
  const handleKeyDown = useCallback(
    (e) => {
      if (disabled) return;

      let newValue = value;

      switch (e.key) {
        case 'ArrowRight':
        case 'ArrowUp':
          e.preventDefault();
          newValue = Math.min(value + 1, 5);
          break;
        case 'ArrowLeft':
        case 'ArrowDown':
          e.preventDefault();
          newValue = Math.max(value - 1, 0);
          break;
        case 'Home':
          e.preventDefault();
          newValue = 0;
          break;
        case 'End':
          e.preventDefault();
          newValue = 5;
          break;
        case 'PageUp':
          e.preventDefault();
          newValue = Math.min(value + 2, 5);
          break;
        case 'PageDown':
          e.preventDefault();
          newValue = Math.max(value - 2, 0);
          break;
        default:
          return;
      }

      if (newValue !== value) {
        onChange(newValue);
      }
    },
    [value, onChange, disabled]
  );

  // Calculate fill percentage for visual track
  const fillPercentage = (value / 5) * 100;

  return (
    <div className={`${disabled ? 'opacity-50' : ''}`}>
      {/* Header with label, emoji, and current value */}
      <div className="flex items-center justify-between mb-3">
        <label
          htmlFor={id}
          className="text-sm font-medium text-gray-700 flex items-center gap-2"
        >
          {label}
        </label>
        <div className="flex items-center gap-2">
          <span
            className="text-2xl transition-transform duration-200 hover:scale-110"
            role="img"
            aria-hidden="true"
          >
            {currentEmoji}
          </span>
          <span className="text-sm font-medium text-primary-600 min-w-[80px] text-right">
            {currentLabel}
          </span>
        </div>
      </div>

      {/* Emoji scale indicator */}
      <div className="flex justify-between mb-2 px-1" aria-hidden="true">
        {[0, 1, 2, 3, 4, 5].map((level) => (
          <button
            key={level}
            type="button"
            onClick={() => !disabled && onChange(level)}
            className={`text-lg transition-all duration-200 hover:scale-125 focus:scale-125 focus:outline-none
              ${value === level ? 'scale-125 opacity-100' : 'opacity-50 hover:opacity-75'}`}
            tabIndex={-1}
            disabled={disabled}
          >
            {getEmoji(symptomKey, level, inverted)}
          </button>
        ))}
      </div>

      {/* Slider track container */}
      <div className="relative h-2 mb-2">
        {/* Background track */}
        <div className="absolute inset-0 bg-gray-200 rounded-full" />

        {/* Filled track */}
        <div
          className={`absolute h-full rounded-full transition-all duration-200 ${getSliderColor(
            value,
            inverted
          )}`}
          style={{ width: `${fillPercentage}%` }}
        />

        {/* Range input (for accessibility and native behavior) */}
        <input
          ref={sliderRef}
          id={id}
          type="range"
          min="0"
          max="5"
          step="1"
          value={value}
          onChange={(e) => onChange(parseInt(e.target.value, 10))}
          onKeyDown={handleKeyDown}
          disabled={disabled}
          className="symptom-slider absolute inset-0 w-full cursor-pointer bg-transparent"
          aria-label={`${label} slider`}
          aria-valuemin={0}
          aria-valuemax={5}
          aria-valuenow={value}
          aria-valuetext={`${currentLabel}, ${value} out of 5`}
          aria-describedby={helpText ? `${id}-help` : undefined}
        />
      </div>

      {/* Min/Max labels */}
      <div className="flex justify-between text-xs text-gray-400">
        <span>{labels[0]}</span>
        <span>{labels[5]}</span>
      </div>

      {/* Optional help text */}
      {helpText && (
        <p id={`${id}-help`} className="text-xs text-gray-500 mt-2">
          {helpText}
        </p>
      )}
    </div>
  );
}

export default SymptomSlider;
