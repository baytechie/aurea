import React, { useState } from 'react';
import { ChevronDown, ChevronUp, HelpCircle } from 'lucide-react';
import ScoreBar from './ScoreBar';
import {
  getSimpleScoreColor,
  getConfidenceColor,
  getConfidenceBackgroundColor,
  formatConfidenceLevel
} from '../../lib/scoreUtils';

/**
 * ConfidenceBadge - Badge showing confidence level with appropriate styling.
 *
 * Confidence levels:
 * - High: Green - Strong, consistent evidence
 * - Medium: Blue - Good evidence with some limitations
 * - Low: Yellow - Limited or conflicting evidence
 * - Emerging: Purple - New research area
 */
function ConfidenceBadge({ level }) {
  if (!level) return null;

  const color = getConfidenceColor(level);
  const bgColor = getConfidenceBackgroundColor(level);
  const label = formatConfidenceLevel(level);

  return (
    <span
      className="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium flex-shrink-0"
      style={{
        backgroundColor: bgColor,
        color: color,
      }}
      role="status"
      aria-label={`Confidence level: ${label}`}
    >
      {label}
    </span>
  );
}

/**
 * CategorySection - Individual health category display with expandable details.
 *
 * Features:
 * - Score bar with color gradient (0-100)
 * - Confidence level badge
 * - Expandable description text
 * - Optional help text for special categories (e.g., inflammation)
 *
 * @param {Object} props
 * @param {string} props.title - Category title (e.g., "Blood Sugar Impact")
 * @param {React.ComponentType} props.icon - Optional icon component
 * @param {string} props.description - Category description from API
 * @param {string} props.defaultDescription - Fallback description if API doesn't provide one
 * @param {string[]} props.details - List of detail points
 * @param {number} props.score - Score from 0-100
 * @param {boolean} props.showScore - Whether to show score bar (default true)
 * @param {string} props.confidenceLevel - Confidence level (high, medium, low, emerging)
 * @param {number} props.confidence - Confidence percentage (0-100)
 * @param {boolean} props.invertDisplay - If true, display as inverted (for anti-inflammatory)
 * @param {string} props.displayLabel - Custom label for the display
 * @param {string} props.helpText - Optional help text to explain the metric
 */
export default function CategorySection({
  title,
  icon: Icon,
  description,
  defaultDescription,
  details = [],
  score,
  showScore = true,
  confidenceLevel,
  confidence,
  invertDisplay = false,
  displayLabel,
  helpText,
}) {
  const [expanded, setExpanded] = useState(false);

  // Calculate display score (invert if needed, e.g., for inflammation)
  const displayScore = invertDisplay && typeof score === 'number' ? 100 - score : score;
  const scoreColor = getSimpleScoreColor(displayScore);

  // Determine if we have expandable content
  const hasExpandableContent = description || (details && details.length > 0);
  const displayDescription = description || defaultDescription;

  // Truncate description for collapsed state
  const truncatedDescription = displayDescription && displayDescription.length > 100
    ? displayDescription.substring(0, 100) + '...'
    : displayDescription;

  return (
    <div
      className="bg-white border border-gray-200 rounded-xl shadow-sm overflow-hidden transition-shadow hover:shadow-md"
      role="region"
      aria-label={`${displayLabel || title} health category`}
    >
      {/* Header */}
      <div className="p-4 sm:p-5">
        <div className="flex items-start justify-between gap-3 mb-3">
          {/* Title with optional icon */}
          <div className="flex items-center gap-2 min-w-0">
            {Icon && (
              <div
                className="flex-shrink-0 w-8 h-8 rounded-lg flex items-center justify-center"
                style={{ backgroundColor: `${scoreColor}15` }}
              >
                <Icon size={18} style={{ color: scoreColor }} aria-hidden="true" />
              </div>
            )}
            <h3
              className="text-base font-semibold text-gray-900 truncate"
              style={{ fontFamily: 'Inter, system-ui, sans-serif' }}
            >
              {displayLabel || title}
            </h3>
          </div>

          {/* Confidence badge */}
          <ConfidenceBadge level={confidenceLevel} />
        </div>

        {/* Score bar with value */}
        {showScore && typeof displayScore === 'number' && (
          <div className="mb-3">
            <div className="flex items-center gap-3">
              <div className="flex-1">
                <ScoreBar
                  score={displayScore}
                  showMarker={false}
                  height="sm"
                  aria-label={`Score: ${displayScore} out of 100`}
                />
              </div>
              <span
                className="text-sm font-bold min-w-[48px] text-right tabular-nums"
                style={{ color: scoreColor }}
              >
                {displayScore}
              </span>
            </div>
          </div>
        )}

        {/* Description (collapsed or full) */}
        {displayDescription && (
          <p className="text-sm text-gray-600 leading-relaxed">
            {expanded ? displayDescription : truncatedDescription}
          </p>
        )}

        {/* Help text */}
        {helpText && (
          <div className="flex items-start gap-1.5 mt-2 text-xs text-gray-500">
            <HelpCircle size={14} className="flex-shrink-0 mt-0.5" aria-hidden="true" />
            <span>{helpText}</span>
          </div>
        )}
      </div>

      {/* Expandable content */}
      {hasExpandableContent && (displayDescription?.length > 100 || details?.length > 0) && (
        <>
          {/* Expand/collapse button */}
          <button
            onClick={() => setExpanded(!expanded)}
            className="w-full px-4 sm:px-5 py-3 flex items-center justify-center gap-2 text-sm font-medium text-gray-600 bg-gray-50 border-t border-gray-100 hover:bg-gray-100 transition-colors focus:outline-none focus:ring-2 focus:ring-inset focus:ring-green-500"
            aria-expanded={expanded}
            aria-controls={`${title.replace(/\s+/g, '-').toLowerCase()}-details`}
          >
            {expanded ? (
              <>
                <span>Show less</span>
                <ChevronUp size={16} aria-hidden="true" />
              </>
            ) : (
              <>
                <span>Show more</span>
                <ChevronDown size={16} aria-hidden="true" />
              </>
            )}
          </button>

          {/* Details list (shown when expanded) */}
          {expanded && details && details.length > 0 && (
            <div
              id={`${title.replace(/\s+/g, '-').toLowerCase()}-details`}
              className="px-4 sm:px-5 pb-4 border-t border-gray-100"
            >
              <h4 className="text-xs font-semibold text-gray-500 uppercase tracking-wider mt-3 mb-2">
                Key Points
              </h4>
              <ul className="space-y-2">
                {details.map((detail, idx) => (
                  <li
                    key={idx}
                    className="flex items-start gap-2 text-sm text-gray-600"
                  >
                    <span
                      className="flex-shrink-0 w-1.5 h-1.5 rounded-full mt-2"
                      style={{ backgroundColor: '#2D7D5E' }}
                      aria-hidden="true"
                    />
                    <span>{detail}</span>
                  </li>
                ))}
              </ul>
            </div>
          )}
        </>
      )}

      {/* Confidence percentage indicator (subtle) */}
      {typeof confidence === 'number' && confidence > 0 && (
        <div className="px-4 sm:px-5 py-2 bg-gray-50 border-t border-gray-100">
          <div className="flex items-center justify-between text-xs text-gray-500">
            <span>Research confidence</span>
            <span className="font-medium">{confidence}%</span>
          </div>
        </div>
      )}
    </div>
  );
}

/**
 * CategorySectionSkeleton - Loading state for CategorySection.
 */
export function CategorySectionSkeleton() {
  return (
    <div
      className="bg-white border border-gray-200 rounded-xl p-5 shadow-sm animate-pulse"
      aria-label="Loading category..."
      role="status"
    >
      <div className="flex items-start justify-between mb-3">
        <div className="flex items-center gap-2">
          <div className="w-8 h-8 rounded-lg bg-gray-200" />
          <div className="h-5 w-32 bg-gray-200 rounded" />
        </div>
        <div className="h-6 w-16 bg-gray-200 rounded-full" />
      </div>
      <div className="flex items-center gap-3 mb-3">
        <div className="flex-1 h-2 bg-gray-200 rounded" />
        <div className="h-5 w-8 bg-gray-200 rounded" />
      </div>
      <div className="h-4 w-full bg-gray-200 rounded mb-2" />
      <div className="h-4 w-3/4 bg-gray-200 rounded" />
    </div>
  );
}
