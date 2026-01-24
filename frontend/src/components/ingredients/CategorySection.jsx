import React from 'react';
import ScoreBar from './ScoreBar';
import { getScoreColor } from '../../lib/scoreUtils';

/**
 * CategorySection - Individual health category display.
 * 
 * @param {Object} props
 * @param {string} props.title - Category title (e.g., "Blood Sugar Impact")
 * @param {string} props.description - Category description
 * @param {string[]} props.details - List of detail points
 * @param {number} props.score - Score from 0-100
 * @param {boolean} props.showScore - Whether to show score bar (false for Evidence)
 */
export default function CategorySection({ 
  title, 
  description, 
  details = [], 
  score,
  showScore = true 
}) {
  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5 shadow-sm">
      {/* Title with bottom border */}
      <h3 
        className="text-lg font-semibold text-gray-900 pb-3 mb-3 border-b-2 border-gray-200"
        style={{ fontFamily: 'Inter, sans-serif' }}
      >
        {title}
      </h3>
      
      {/* Description */}
      <p className="text-sm text-gray-500 mb-3 leading-relaxed">
        {description}
      </p>
      
      {/* Details list */}
      {details.length > 0 && (
        <ul className="space-y-2 mb-4">
          {details.map((detail, idx) => (
            <li key={idx} className="flex items-start gap-2 text-sm text-gray-600">
              <span className="text-[#2D7D5E] font-bold mt-0.5">•</span>
              <span>{detail}</span>
            </li>
          ))}
        </ul>
      )}
      
      {/* Score bar with label */}
      {showScore && typeof score === 'number' && (
        <div className="flex items-center gap-3 mt-3">
          <div className="flex-1">
            <ScoreBar score={score} showMarker={false} height="sm" />
          </div>
          <span 
            className="text-sm font-semibold min-w-[60px] text-right"
            style={{ color: getScoreColor(score) }}
          >
            {score}/100
          </span>
        </div>
      )}
    </div>
  );
}
