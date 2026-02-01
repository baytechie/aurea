import React from 'react';
import { ExternalLink, BookOpen } from 'lucide-react';

/**
 * SourcesList - Display clickable research source links.
 *
 * @param {Object} props
 * @param {Array} props.sources - Array of source objects with name, url, type
 * @param {string} props.className - Additional CSS classes
 */
export default function SourcesList({ sources = [], className = '' }) {
  if (!sources || sources.length === 0) {
    return null;
  }

  // Group sources by type if available
  const groupedSources = sources.reduce((acc, source) => {
    const type = source.type || 'general';
    if (!acc[type]) {
      acc[type] = [];
    }
    acc[type].push(source);
    return acc;
  }, {});

  const getSourceTypeLabel = (type) => {
    const labels = {
      peer_reviewed: 'Peer-Reviewed Studies',
      clinical_trial: 'Clinical Trials',
      meta_analysis: 'Meta-Analyses',
      government: 'Government Sources',
      database: 'Scientific Databases',
      general: 'Additional Sources',
    };
    return labels[type] || 'Sources';
  };

  const getSourceIcon = () => {
    return <BookOpen size={14} className="text-gray-400" />;
  };

  return (
    <div className={`bg-white border border-gray-200 rounded-xl p-5 shadow-sm ${className}`}>
      <h3 className="text-lg font-semibold text-gray-900 pb-3 mb-3 border-b-2 border-gray-200">
        Research Sources
      </h3>

      <div className="space-y-4">
        {Object.entries(groupedSources).map(([type, typeSources]) => (
          <div key={type}>
            {Object.keys(groupedSources).length > 1 && (
              <h4 className="text-sm font-medium text-gray-700 mb-2">
                {getSourceTypeLabel(type)}
              </h4>
            )}
            <ul className="space-y-2">
              {typeSources.map((source, idx) => (
                <li key={idx}>
                  {source.url ? (
                    <a
                      href={source.url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="flex items-center gap-2 text-sm text-blue-600 hover:text-blue-800 hover:underline transition-colors group"
                    >
                      {getSourceIcon(type)}
                      <span className="flex-1">{source.name || source.title || source.url}</span>
                      <ExternalLink
                        size={12}
                        className="opacity-0 group-hover:opacity-100 transition-opacity"
                      />
                    </a>
                  ) : (
                    <span className="flex items-center gap-2 text-sm text-gray-600">
                      {getSourceIcon(type)}
                      <span>{source.name || source.title || 'Unknown source'}</span>
                    </span>
                  )}
                  {source.description && (
                    <p className="text-xs text-gray-500 mt-1 ml-6">
                      {source.description}
                    </p>
                  )}
                </li>
              ))}
            </ul>
          </div>
        ))}
      </div>

      <p className="text-xs text-gray-400 mt-4 pt-3 border-t border-gray-100">
        Sources are provided for educational purposes. Always consult healthcare professionals for medical advice.
      </p>
    </div>
  );
}
