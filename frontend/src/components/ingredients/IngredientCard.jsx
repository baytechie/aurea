import React from 'react';
import { Heart } from 'lucide-react';
import ScoreBar from './ScoreBar';
import { getScoreColor, getRiskLevel } from '../../lib/scoreUtils';

/**
 * IngredientCard - Circular main score display card.
 * 
 * @param {Object} props
 * @param {string} props.name - Ingredient name
 * @param {number} props.overallScore - Overall health score (0-100)
 * @param {string} props.riskLevel - Risk level label
 * @param {string} props.description - Description text
 * @param {function} props.onSave - Callback when save button clicked
 * @param {boolean} props.isSaved - Whether ingredient is saved
 */
export default function IngredientCard({ 
  name, 
  overallScore = 0, 
  riskLevel,
  description,
  onSave,
  isSaved = false 
}) {
  const scoreColor = getScoreColor(overallScore);
  const displayRiskLevel = riskLevel || getRiskLevel(overallScore);

  return (
    <div className="flex flex-col items-center w-full">
      {/* Ingredient Title with Save Button */}
      <div className="relative w-full max-w-md text-center mb-6">
        <h1 
          className="text-3xl font-bold text-gray-900"
          style={{ fontFamily: 'Garamond, Georgia, serif' }}
        >
          {name}
        </h1>
        
        {onSave && (
          <button
            onClick={onSave}
            className="absolute right-0 top-0 w-8 h-8 border-2 border-gray-900 rounded flex items-center justify-center transition-colors"
            style={{ 
              backgroundColor: isSaved ? '#E8DCC8' : '#FFFFFF',
            }}
            aria-label={isSaved ? 'Remove from saved' : 'Save ingredient'}
          >
            <Heart 
              size={16} 
              fill={isSaved ? '#1F2937' : 'none'} 
              stroke="#1F2937"
            />
          </button>
        )}
      </div>

      {/* Main Circular Card */}
      <div 
        className="w-full max-w-md aspect-square rounded-full flex flex-col items-center justify-center text-center p-10 shadow-lg mb-6"
        style={{
          backgroundColor: '#F5F3F0',
          border: '3px solid #D4C5B0',
        }}
      >
        {/* Score Label */}
        <div 
          className="text-sm font-semibold tracking-wider mb-2"
          style={{ color: '#2D7D5E' }}
        >
          HEALTH RISK SCORE
        </div>

        {/* Score Number */}
        <div 
          className="text-7xl font-bold mb-4"
          style={{ 
            fontFamily: 'Garamond, Georgia, serif',
            color: scoreColor
          }}
        >
          {overallScore}
        </div>

        {/* Score Bar */}
        <div className="w-4/5 mb-4">
          <ScoreBar score={overallScore} showMarker={true} height="md" />
        </div>

        {/* Risk Level */}
        <div 
          className="text-lg font-semibold mb-4"
          style={{ color: scoreColor }}
        >
          {displayRiskLevel}
        </div>

        {/* Description */}
        {description && (
          <p className="text-base text-gray-600 leading-relaxed mb-4 px-4">
            {description}
          </p>
        )}

        {/* Disclaimer */}
        <p className="text-xs text-gray-500 italic leading-snug px-4">
          *This score is based on research but should not be taken as medical advice. 
          Consult medical professionals for help with personal health concerns.
        </p>
      </div>
    </div>
  );
}
