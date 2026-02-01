import React from 'react';
import { Heart, CheckCircle, AlertTriangle } from 'lucide-react';
import ScoreBar from './ScoreBar';
import {
  getSimpleScoreColor,
  getSimpleScoreLabel,
  getRiskLevel,
  getCategoryStyle,
  formatCategoryName
} from '../../lib/scoreUtils';

/**
 * CategoryBadge - Display ingredient category with appropriate styling.
 *
 * Uses color-coded pill design for visual categorization.
 * Colors are designed for WCAG AA contrast compliance.
 */
function CategoryBadge({ category }) {
  if (!category) return null;

  const style = getCategoryStyle(category);
  const label = formatCategoryName(category);

  return (
    <span
      className="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium"
      style={{
        backgroundColor: style.bgColor,
        color: style.color,
      }}
    >
      {label}
    </span>
  );
}

/**
 * TrustIndicator - Show whether data is from researched or public sources.
 *
 * Visual indicators:
 * - Green check: Fully researched with verified sources
 * - Amber warning: Based on public/community sources
 */
function TrustIndicator({ isTrusted, showLabel = true }) {
  if (isTrusted) {
    return (
      <span
        className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-medium bg-green-100 text-green-700"
        role="status"
        aria-label="This ingredient has been fully researched"
      >
        <CheckCircle size={14} className="flex-shrink-0" aria-hidden="true" />
        {showLabel && 'Researched'}
      </span>
    );
  }

  return (
    <span
      className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-medium bg-amber-100 text-amber-700"
      role="status"
      aria-label="This ingredient data is from public sources"
    >
      <AlertTriangle size={14} className="flex-shrink-0" aria-hidden="true" />
      {showLabel && 'Public Source'}
    </span>
  );
}

/**
 * IngredientCard - Main display card for ingredient health scores.
 *
 * Design features:
 * - Prominent overall score with 3-tier color coding (green/yellow/red)
 * - Category badge with color-coded pill
 * - Trust indicator showing research quality
 * - Clean, modern design with proper accessibility
 *
 * Color coding (higher is better):
 * - Green (70-100): Good, low concern
 * - Yellow (40-69): Moderate concern
 * - Red (0-39): High concern, caution advised
 *
 * @param {Object} props
 * @param {string} props.name - Ingredient name
 * @param {number} props.overallScore - Overall health score (0-100)
 * @param {string} props.category - Ingredient category (e.g., "Sweeteners")
 * @param {boolean} props.isTrusted - True if fully researched, false if public sources
 * @param {string} props.description - Description text
 * @param {function} props.onSave - Callback when save button clicked
 * @param {boolean} props.isSaved - Whether ingredient is saved
 * @param {boolean} props.compact - Use compact layout for list views
 * @param {function} props.onClick - Callback when card is clicked (for compact mode)
 */
export default function IngredientCard({
  name,
  overallScore = 0,
  category,
  isTrusted,
  description,
  onSave,
  isSaved = false,
  compact = false,
  onClick
}) {
  const scoreColor = getSimpleScoreColor(overallScore);
  const scoreLabel = getSimpleScoreLabel(overallScore);
  const riskLevel = getRiskLevel(overallScore);

  // Compact card for list views
  if (compact) {
    return (
      <div
        className={`flex items-center gap-4 p-4 bg-white border border-gray-200 rounded-xl shadow-sm transition-all ${
          onClick ? 'cursor-pointer hover:shadow-md hover:border-gray-300' : ''
        }`}
        role="article"
        aria-label={`${name}: Health score ${overallScore} out of 100`}
        onClick={onClick}
        tabIndex={onClick ? 0 : undefined}
        onKeyDown={onClick ? (e) => e.key === 'Enter' && onClick() : undefined}
      >
        {/* Score Circle */}
        <div
          className="flex-shrink-0 w-14 h-14 rounded-full flex items-center justify-center border-2"
          style={{
            borderColor: scoreColor,
            backgroundColor: `${scoreColor}15`
          }}
          aria-hidden="true"
        >
          <span
            className="text-xl font-bold"
            style={{ color: scoreColor }}
          >
            {overallScore}
          </span>
        </div>

        {/* Content */}
        <div className="flex-1 min-w-0">
          <div className="flex items-center gap-2 mb-1">
            <h3
              className="text-base font-semibold text-gray-900 truncate"
              style={{ fontFamily: 'Georgia, serif' }}
            >
              {name}
            </h3>
            {typeof isTrusted === 'boolean' && (
              isTrusted ? (
                <CheckCircle
                  size={14}
                  className="flex-shrink-0 text-green-600"
                  aria-label="Researched"
                />
              ) : (
                <AlertTriangle
                  size={14}
                  className="flex-shrink-0 text-amber-500"
                  aria-label="Public source"
                />
              )
            )}
          </div>

          {/* Category Badge */}
          <CategoryBadge category={category} />
        </div>

        {/* Save Button */}
        {onSave && (
          <button
            onClick={(e) => {
              e.stopPropagation();
              onSave();
            }}
            className="flex-shrink-0 p-2 rounded-lg border border-gray-200 hover:bg-gray-50 transition-colors focus:outline-none focus:ring-2 focus:ring-offset-1 focus:ring-green-500"
            aria-label={isSaved ? 'Remove from saved' : 'Save ingredient'}
            aria-pressed={isSaved}
          >
            <Heart
              size={18}
              fill={isSaved ? '#EF4444' : 'none'}
              stroke={isSaved ? '#EF4444' : '#9CA3AF'}
              aria-hidden="true"
            />
          </button>
        )}
      </div>
    );
  }

  // Full card layout
  return (
    <div
      className="flex flex-col items-center w-full"
      role="article"
      aria-label={`${name}: Health score ${overallScore} out of 100`}
    >
      {/* Header: Name and Save Button */}
      <div className="relative w-full max-w-md text-center mb-4">
        <h1
          className="text-3xl font-bold text-gray-900"
          style={{ fontFamily: 'Georgia, serif' }}
        >
          {name}
        </h1>

        {onSave && (
          <button
            onClick={onSave}
            className="absolute right-0 top-0 w-10 h-10 border-2 border-gray-200 rounded-lg flex items-center justify-center transition-all hover:border-gray-300 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500"
            style={{
              backgroundColor: isSaved ? '#FEE2E2' : '#FFFFFF',
              borderColor: isSaved ? '#FECACA' : '#E5E7EB'
            }}
            aria-label={isSaved ? 'Remove from saved' : 'Save ingredient'}
            aria-pressed={isSaved}
          >
            <Heart
              size={18}
              fill={isSaved ? '#EF4444' : 'none'}
              stroke={isSaved ? '#EF4444' : '#6B7280'}
              aria-hidden="true"
            />
          </button>
        )}
      </div>

      {/* Category Badge and Trust Indicator */}
      <div className="flex items-center gap-3 mb-6 flex-wrap justify-center">
        <CategoryBadge category={category} />
        {typeof isTrusted === 'boolean' && <TrustIndicator isTrusted={isTrusted} />}
      </div>

      {/* Main Score Card */}
      <div
        className="w-full max-w-md rounded-2xl flex flex-col items-center justify-center text-center p-8 shadow-lg mb-6"
        style={{
          backgroundColor: '#FFFFFF',
          border: '1px solid #E5E7EB',
        }}
      >
        {/* Score Label */}
        <p
          className="text-xs font-semibold tracking-wider uppercase text-gray-500 mb-3"
        >
          Health Score
        </p>

        {/* Large Score Display */}
        <div className="flex items-baseline justify-center gap-2 mb-4">
          <span
            className="text-7xl font-bold"
            style={{
              fontFamily: 'Georgia, serif',
              color: scoreColor,
            }}
          >
            {overallScore}
          </span>
          <span className="text-xl text-gray-400">/100</span>
        </div>

        {/* Score Label Badge */}
        <span
          className="inline-flex items-center px-4 py-1.5 rounded-full text-sm font-semibold mb-4"
          style={{
            backgroundColor: `${scoreColor}20`,
            color: scoreColor
          }}
        >
          {scoreLabel}
        </span>

        {/* Score Bar */}
        <div className="w-full mb-4">
          <ScoreBar
            score={overallScore}
            showMarker={true}
            height="md"
            aria-label={`Score: ${overallScore} out of 100`}
          />
        </div>

        {/* Risk Level */}
        <p
          className="text-sm font-medium"
          style={{ color: scoreColor }}
        >
          {riskLevel}
        </p>
      </div>

      {/* Description */}
      {description && (
        <p className="text-sm text-gray-600 leading-relaxed text-center mb-4 max-w-md">
          {description}
        </p>
      )}

      {/* Disclaimer */}
      <p className="text-xs text-gray-400 italic text-center leading-relaxed px-4 max-w-md">
        This score is based on research but should not be taken as medical advice.
        Consult medical professionals for help with personal health concerns.
      </p>
    </div>
  );
}

/**
 * IngredientCardSkeleton - Loading state for IngredientCard.
 */
export function IngredientCardSkeleton({ compact = false }) {
  if (compact) {
    return (
      <div
        className="flex items-center gap-4 p-4 bg-white border border-gray-200 rounded-xl animate-pulse"
        aria-label="Loading ingredient..."
        role="status"
      >
        <div className="w-14 h-14 rounded-full bg-gray-200" />
        <div className="flex-1">
          <div className="h-4 w-24 bg-gray-200 rounded mb-2" />
          <div className="h-5 w-16 bg-gray-200 rounded-full" />
        </div>
      </div>
    );
  }

  return (
    <div
      className="flex flex-col items-center w-full animate-pulse"
      aria-label="Loading ingredient..."
      role="status"
    >
      <div className="w-full max-w-md text-center mb-4">
        <div className="h-8 w-32 bg-gray-200 rounded mx-auto" />
      </div>
      <div className="flex gap-3 mb-6">
        <div className="h-6 w-20 bg-gray-200 rounded-full" />
        <div className="h-6 w-24 bg-gray-200 rounded-full" />
      </div>
      <div className="w-full max-w-md rounded-2xl p-8 bg-white border border-gray-200">
        <div className="flex flex-col items-center">
          <div className="h-3 w-20 bg-gray-200 rounded mb-3" />
          <div className="h-16 w-24 bg-gray-200 rounded mb-4" />
          <div className="h-6 w-16 bg-gray-200 rounded-full mb-4" />
          <div className="h-3 w-full bg-gray-200 rounded mb-4" />
          <div className="h-4 w-24 bg-gray-200 rounded" />
        </div>
      </div>
    </div>
  );
}
