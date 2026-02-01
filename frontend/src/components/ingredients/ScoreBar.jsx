import React from 'react';
import { SCORE_BAR_GRADIENT, INVERTED_SCORE_BAR_GRADIENT } from '../../lib/scoreUtils';

/**
 * ScoreBar - Gradient progress bar for health scores.
 *
 * Visual representation of scores from 0-100:
 * - Default gradient: Red (left/low) to Green (right/high)
 * - Shows filled portion up to the score value
 * - Optional marker line at score position
 *
 * Color interpretation:
 * - Higher scores (70-100): Green area = Good
 * - Medium scores (40-69): Yellow/amber area = Moderate
 * - Lower scores (0-39): Red area = Concern
 *
 * @param {Object} props
 * @param {number} props.score - Score from 0-100
 * @param {boolean} props.showMarker - Show vertical marker at score position
 * @param {'sm' | 'md' | 'lg'} props.height - Bar height size
 * @param {boolean} props.animated - Enable entrance animation
 * @param {boolean} props.inverted - Use inverted gradient (for metrics where lower is better)
 * @param {string} props.ariaLabel - Accessibility label
 */
export default function ScoreBar({
  score = 0,
  showMarker = true,
  height = 'md',
  animated = true,
  inverted = false,
  ariaLabel
}) {
  // Height mapping
  const heightMap = {
    sm: '6px',
    md: '10px',
    lg: '14px'
  };
  const heightPx = heightMap[height] || heightMap.md;

  // Select gradient based on inversion
  const gradient = inverted ? INVERTED_SCORE_BAR_GRADIENT : SCORE_BAR_GRADIENT;

  // Clamp score between 0 and 100
  const clampedScore = Math.max(0, Math.min(100, score));

  return (
    <div
      className="relative w-full"
      style={{ height: heightPx }}
      role="progressbar"
      aria-valuenow={clampedScore}
      aria-valuemin={0}
      aria-valuemax={100}
      aria-label={ariaLabel || `Score: ${clampedScore} out of 100`}
    >
      {/* Background track */}
      <div
        className="absolute inset-0 rounded-full bg-gray-200"
      />

      {/* Gradient fill */}
      <div
        className="absolute inset-0 rounded-full overflow-hidden"
        style={{ background: gradient }}
      >
        {/* Mask overlay to show unfilled portion */}
        <div
          className="absolute top-0 right-0 h-full bg-gray-200 rounded-r-full transition-all ease-out"
          style={{
            width: `${100 - clampedScore}%`,
            transitionDuration: animated ? '500ms' : '0ms',
            transitionDelay: animated ? '100ms' : '0ms'
          }}
        />
      </div>

      {/* Score marker line */}
      {showMarker && clampedScore > 0 && clampedScore < 100 && (
        <div
          className="absolute top-1/2 w-0.5 bg-gray-800 rounded-full shadow-sm transition-all ease-out"
          style={{
            left: `${clampedScore}%`,
            height: height === 'sm' ? '16px' : height === 'lg' ? '24px' : '20px',
            transform: 'translateX(-50%) translateY(-50%)',
            transitionDuration: animated ? '500ms' : '0ms',
            transitionDelay: animated ? '300ms' : '0ms'
          }}
          aria-hidden="true"
        />
      )}
    </div>
  );
}

/**
 * ScoreBarLabeled - Score bar with min/max labels.
 */
export function ScoreBarLabeled({
  score,
  minLabel = 'Low',
  maxLabel = 'High',
  ...props
}) {
  return (
    <div>
      <ScoreBar score={score} {...props} />
      <div className="flex justify-between mt-1">
        <span className="text-xs text-gray-400">{minLabel}</span>
        <span className="text-xs text-gray-400">{maxLabel}</span>
      </div>
    </div>
  );
}
