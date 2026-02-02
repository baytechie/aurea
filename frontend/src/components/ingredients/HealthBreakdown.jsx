import React from 'react';
import { Activity, Flame, Heart, Shield, Zap } from 'lucide-react';
import CategorySection from './CategorySection';
import SourcesList from './SourcesList';
import {
  getConfidenceColor,
  getConfidenceBackgroundColor,
  formatConfidenceLevel
} from '../../lib/scoreUtils';

/**
 * Icon mapping for health categories.
 */
const CATEGORY_ICONS = {
  bloodSugar: Activity,
  inflammation: Flame,
  gut: Heart,
  diseaseLinks: Shield,
  hormonal: Zap,
};

/**
 * HealthBreakdown - Container for all health category sections.
 *
 * Displays detailed health impact information across 5 categories:
 * - Blood Sugar Impact
 * - Anti-inflammatory Score (higher = less inflammatory = better)
 * - Gut Health Impact
 * - Disease Risk Profile
 * - Hormonal Impact
 *
 * All scores use consistent semantics: higher = better.
 *
 * @param {Object} props
 * @param {Object} props.categories - Category data object
 * @param {Object} props.categories.bloodSugar - Blood sugar impact data
 * @param {Object} props.categories.inflammation - Inflammation data (higher = less inflammatory = better)
 * @param {Object} props.categories.gut - Gut impact data
 * @param {Object} props.categories.hormonal - Hormonal relevance data
 * @param {Object} props.categories.diseaseLinks - Disease links data
 * @param {Object} props.categories.evidence - Evidence confidence data
 * @param {Array} props.sources - Research sources array
 */
export default function HealthBreakdown({ categories, sources }) {
  if (!categories) return null;

  const { bloodSugar, inflammation, gut, hormonal, diseaseLinks, evidence } = categories;

  // Check if we have any health data to display
  const hasHealthData = bloodSugar?.score != null ||
    inflammation?.score != null ||
    gut?.score != null ||
    hormonal?.score != null ||
    diseaseLinks?.score != null;

  if (!hasHealthData && !evidence && (!sources || sources.length === 0)) {
    return (
      <div className="w-full max-w-xl p-6 bg-gray-50 rounded-xl text-center mt-6">
        <p className="text-gray-500">
          No detailed health breakdown available for this ingredient.
        </p>
      </div>
    );
  }

  return (
    <div className="w-full max-w-xl space-y-4 mt-6">
      {/* Section Header */}
      {hasHealthData && (
        <div className="mb-2">
          <h2
            className="text-lg font-semibold text-gray-900"
            style={{ fontFamily: 'Georgia, serif' }}
          >
            Health Impact Breakdown
          </h2>
          <p className="text-sm text-gray-500 mt-1">
            Detailed analysis across key health categories
          </p>
        </div>
      )}

      {/* Blood Sugar Impact */}
      {bloodSugar?.score != null && (
        <CategorySection
          title="Blood Sugar Impact"
          icon={CATEGORY_ICONS.bloodSugar}
          description={bloodSugar.description}
          defaultDescription="How this ingredient affects blood glucose levels and insulin response"
          details={bloodSugar.details || []}
          score={bloodSugar.score}
          confidenceLevel={bloodSugar.confidenceLevel}
          confidence={bloodSugar.confidence}
          confidenceRationale={bloodSugar.confidenceRationale}
        />
      )}

      {/* Anti-inflammatory Score (higher = less inflammatory = better) */}
      {inflammation?.score != null && (
        <CategorySection
          title="Anti-inflammatory Score"
          icon={CATEGORY_ICONS.inflammation}
          description={inflammation.description}
          defaultDescription="Higher score indicates less inflammatory potential"
          details={inflammation.details || []}
          score={inflammation.score}
          confidenceLevel={inflammation.confidenceLevel}
          confidence={inflammation.confidence}
          confidenceRationale={inflammation.confidenceRationale}
          helpText="Higher score means less inflammatory. Sugar scores low (25), Spinach scores high (88)."
        />
      )}

      {/* Gut Impact */}
      {gut?.score != null && (
        <CategorySection
          title="Gut Health Impact"
          icon={CATEGORY_ICONS.gut}
          description={gut.description}
          defaultDescription="Effect on digestive health, gut microbiome, and intestinal comfort"
          details={gut.details || []}
          score={gut.score}
          confidenceLevel={gut.confidenceLevel}
          confidence={gut.confidence}
          confidenceRationale={gut.confidenceRationale}
        />
      )}

      {/* Disease Links */}
      {diseaseLinks?.score != null && (
        <CategorySection
          title="Disease Risk Profile"
          icon={CATEGORY_ICONS.diseaseLinks}
          description={diseaseLinks.description}
          defaultDescription="Association with chronic disease risk based on scientific research"
          details={diseaseLinks.details || []}
          score={diseaseLinks.score}
          confidenceLevel={diseaseLinks.confidenceLevel}
          confidence={diseaseLinks.confidence}
          confidenceRationale={diseaseLinks.confidenceRationale}
        />
      )}

      {/* Hormonal Relevance */}
      {hormonal?.score != null && (
        <CategorySection
          title="Hormonal Impact"
          icon={CATEGORY_ICONS.hormonal}
          description={hormonal.description}
          defaultDescription="Potential effects on hormonal balance and endocrine function"
          details={hormonal.details || []}
          score={hormonal.score}
          confidenceLevel={hormonal.confidenceLevel}
          confidence={hormonal.confidence}
          confidenceRationale={hormonal.confidenceRationale}
        />
      )}

      {/* Evidence Confidence (no score bar) */}
      {evidence && (
        <EvidenceSection
          confidence={evidence.confidence}
          description={evidence.description}
          sources={evidence.sources}
        />
      )}

      {/* Research Sources */}
      {sources && sources.length > 0 && <SourcesList sources={sources} />}
    </div>
  );
}

/**
 * EvidenceSection - Shows overall evidence confidence level.
 */
function EvidenceSection({ confidence, description, sources }) {
  const confColor = getConfidenceColor(confidence);
  const confBgColor = getConfidenceBackgroundColor(confidence);
  const confLabel = formatConfidenceLevel(confidence);

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5 shadow-sm">
      <h3
        className="text-base font-semibold text-gray-900 pb-3 mb-3 border-b border-gray-200"
        style={{ fontFamily: 'Inter, system-ui, sans-serif' }}
      >
        Evidence Quality
      </h3>

      <div className="flex items-center gap-3 mb-3">
        <span className="text-sm text-gray-600">Overall confidence:</span>
        <span
          className="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium"
          style={{
            backgroundColor: confBgColor,
            color: confColor
          }}
        >
          {confLabel}
        </span>
      </div>

      {description && (
        <p className="text-sm text-gray-600 mb-3">{description}</p>
      )}

      {sources && (
        <div className="mt-3 pt-3 border-t border-gray-100">
          <p className="text-xs text-gray-500 mb-1">Based on:</p>
          <p className="text-sm text-gray-600">{sources}</p>
        </div>
      )}
    </div>
  );
}

/**
 * HealthBreakdownSkeleton - Loading state for HealthBreakdown.
 */
export function HealthBreakdownSkeleton() {
  return (
    <div className="w-full max-w-xl space-y-4 mt-6" aria-label="Loading health data..." role="status">
      {/* Header skeleton */}
      <div className="mb-2">
        <div className="h-5 w-48 bg-gray-200 rounded animate-pulse mb-2" />
        <div className="h-4 w-64 bg-gray-200 rounded animate-pulse" />
      </div>

      {/* Category section skeletons */}
      {[1, 2, 3, 4, 5].map((i) => (
        <div
          key={i}
          className="bg-white border border-gray-200 rounded-xl p-5 shadow-sm animate-pulse"
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
      ))}
    </div>
  );
}
