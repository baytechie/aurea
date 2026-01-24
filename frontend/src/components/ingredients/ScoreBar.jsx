import React from 'react';
import { SCORE_BAR_GRADIENT } from '../../lib/scoreUtils';

/**
 * ScoreBar - Gradient progress bar for health scores.
 */
export default function ScoreBar({ 
  score = 0, 
  showMarker = true, 
  height = 'md',
  animated = true 
}) {
  const heightPx = height === 'sm' ? '8px' : '12px';
  
  return (
    <div className="relative w-full" style={{ height: heightPx }}>
      {/* Background gradient bar */}
      <div 
        className="w-full h-full rounded-full overflow-hidden"
        style={{ background: SCORE_BAR_GRADIENT }}
      >
        {/* Overlay to show unfilled portion */}
        <div 
          className="absolute top-0 right-0 h-full bg-gray-200 transition-all duration-500 ease-out"
          style={{ 
            width: `${100 - score}%`,
            transitionDelay: animated ? '200ms' : '0ms'
          }}
        />
      </div>
      
      {/* Score marker */}
      {showMarker && (
        <div 
          className="absolute top-1/2 -translate-y-1/2 w-0.5 bg-gray-900 transition-all duration-500 ease-out"
          style={{ 
            left: `${score}%`,
            height: '24px',
            transform: 'translateX(-50%) translateY(-50%)',
            transitionDelay: animated ? '400ms' : '0ms'
          }}
        />
      )}
    </div>
  );
}
