import React from 'react';
import CategorySection from './CategorySection';

/**
 * HealthBreakdown - Container for all health category sections.
 * 
 * @param {Object} props
 * @param {Object} props.categories - Category data object
 * @param {Object} props.categories.bloodSugar
 * @param {Object} props.categories.inflammation
 * @param {Object} props.categories.gut
 * @param {Object} props.categories.hormonal
 * @param {Object} props.categories.evidence
 */
export default function HealthBreakdown({ categories }) {
  if (!categories) return null;

  const { bloodSugar, inflammation, gut, hormonal, evidence } = categories;

  return (
    <div className="w-full max-w-xl space-y-4">
      {/* Blood Sugar Impact */}
      {bloodSugar && (
        <CategorySection
          title="Blood Sugar Impact"
          description={bloodSugar.description || 'How this ingredient affects blood glucose levels'}
          details={bloodSugar.details || []}
          score={bloodSugar.score}
        />
      )}

      {/* Inflammation Potential */}
      {inflammation && (
        <CategorySection
          title="Inflammation Potential"
          description={inflammation.description || 'Ingredients commonly associated with inflammatory responses'}
          details={inflammation.details || []}
          score={inflammation.score}
        />
      )}

      {/* Gut Impact */}
      {gut && (
        <CategorySection
          title="Gut Impact"
          description={gut.description || 'Likelihood of digestive discomfort for sensitive individuals'}
          details={gut.details || []}
          score={gut.score}
        />
      )}

      {/* Hormonal Relevance */}
      {hormonal && (
        <CategorySection
          title="Hormonal Relevance"
          description={hormonal.description || 'Ingredients discussed in hormone-related research'}
          details={hormonal.details || []}
          score={typeof hormonal.score === 'number' ? hormonal.score : hormonal.score?.score}
        />
      )}

      {/* Evidence Confidence (no score bar) */}
      {evidence && (
        <div className="bg-white border border-gray-200 rounded-xl p-5 shadow-sm">
          <h3 className="text-lg font-semibold text-gray-900 pb-3 mb-3 border-b-2 border-gray-200">
            Evidence Confidence
          </h3>
          <p className="text-sm text-gray-600 mb-2">
            {evidence.confidence || 'Mixed Evidence'}
          </p>
          {evidence.sources && (
            <p className="text-sm text-gray-500">
              Sources: {evidence.sources}
            </p>
          )}
        </div>
      )}
    </div>
  );
}
