import { useState } from 'react';
import {
  TrendingUp,
  AlertTriangle,
  Clock,
  Moon,
  Loader2,
  Info,
  ChevronDown,
  ChevronUp,
} from 'lucide-react';
import { useInsights, useLogs } from '../hooks/useIngredients';

/**
 * InsightsTab - Displays personalized insights from correlation analysis
 */
function InsightsTab() {
  const { data: insights, isLoading: insightsLoading, error } = useInsights();
  const { data: logs } = useLogs();
  const [expandedSection, setExpandedSection] = useState('triggers');

  const logsCount = logs?.length || 0;
  const hasEnoughData = logsCount >= 7;

  if (insightsLoading) {
    return (
      <div className="max-w-4xl">
        <h1 className="text-2xl font-bold text-gray-900 mb-6">Your Insights</h1>
        <div className="card flex items-center justify-center py-12">
          <Loader2 className="w-8 h-8 text-primary-600 animate-spin" />
          <span className="ml-3 text-gray-600">Analyzing your data...</span>
        </div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="max-w-4xl">
        <h1 className="text-2xl font-bold text-gray-900 mb-6">Your Insights</h1>
        <div className="card text-center py-12">
          <AlertTriangle className="w-12 h-12 text-danger-500 mx-auto mb-4" />
          <p className="text-gray-600">Failed to load insights. Please try again.</p>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-4xl">
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Your Insights</h1>
      <p className="text-gray-600 mb-6">
        Personal patterns discovered from your food and symptom logs
      </p>

      {/* Data Summary Banner */}
      <div className={`card mb-6 ${hasEnoughData ? 'bg-primary-50 border-primary-200' : 'bg-warning-50 border-warning-200'}`}>
        <div className="flex items-center gap-3">
          <Info className={`w-5 h-5 ${hasEnoughData ? 'text-primary-600' : 'text-warning-600'}`} />
          <div>
            <p className={`font-medium ${hasEnoughData ? 'text-primary-900' : 'text-warning-900'}`}>
              {hasEnoughData
                ? `Analyzing ${logsCount} days of data`
                : `${logsCount} logs recorded - need ${7 - logsCount} more for insights`}
            </p>
            <p className={`text-sm ${hasEnoughData ? 'text-primary-700' : 'text-warning-700'}`}>
              {insights?.confidence_assessment === 'high'
                ? 'High confidence in these patterns'
                : insights?.confidence_assessment === 'medium'
                ? 'Moderate confidence - keep logging for more accuracy'
                : 'Keep logging daily for personalized insights'}
            </p>
          </div>
        </div>
      </div>

      {/* Top Triggers Section */}
      <InsightSection
        title="Potential Triggers"
        icon={<AlertTriangle className="w-5 h-5 text-warning-600" />}
        expanded={expandedSection === 'triggers'}
        onToggle={() => setExpandedSection(expandedSection === 'triggers' ? null : 'triggers')}
      >
        {insights?.top_triggers?.length > 0 ? (
          <div className="space-y-3">
            {insights.top_triggers.map((trigger, index) => (
              <TriggerCard key={trigger.ingredient || index} trigger={trigger} />
            ))}
          </div>
        ) : (
          <EmptyState
            icon={<TrendingUp className="w-10 h-10 text-gray-300" />}
            message="No triggers identified yet"
            subtext="Keep logging to help us identify patterns"
          />
        )}
      </InsightSection>

      {/* Cycle Phase Patterns */}
      <InsightSection
        title="Cycle Phase Patterns"
        icon={<Moon className="w-5 h-5 text-secondary-600" />}
        expanded={expandedSection === 'phase'}
        onToggle={() => setExpandedSection(expandedSection === 'phase' ? null : 'phase')}
      >
        {insights?.phase_analysis ? (
          <PhaseAnalysisView analysis={insights.phase_analysis} />
        ) : (
          <EmptyState
            icon={<Moon className="w-10 h-10 text-gray-300" />}
            message="No cycle patterns found"
            subtext="Enable cycle tracking and log your phase daily"
          />
        )}
      </InsightSection>

      {/* Lag Effects */}
      <InsightSection
        title="Delayed Reactions"
        icon={<Clock className="w-5 h-5 text-primary-600" />}
        expanded={expandedSection === 'lag'}
        onToggle={() => setExpandedSection(expandedSection === 'lag' ? null : 'lag')}
      >
        {insights?.lag_analysis ? (
          <LagAnalysisView analysis={insights.lag_analysis} />
        ) : (
          <EmptyState
            icon={<Clock className="w-10 h-10 text-gray-300" />}
            message="No delayed effects found"
            subtext="Log consistently to detect delayed reactions"
          />
        )}
      </InsightSection>

      {/* Recommendations */}
      {insights?.recommendations?.length > 0 && (
        <div className="card mt-6 bg-gradient-to-r from-primary-50 to-secondary-50">
          <h3 className="font-semibold text-gray-900 mb-4 flex items-center gap-2">
            <TrendingUp className="w-5 h-5 text-primary-600" />
            Recommendations
          </h3>
          <ul className="space-y-3">
            {insights.recommendations.map((rec, index) => (
              <li key={index} className="flex items-start gap-3">
                <span className="flex-shrink-0 w-6 h-6 rounded-full bg-primary-100 text-primary-700 flex items-center justify-center text-sm font-medium">
                  {index + 1}
                </span>
                <span className="text-gray-700">{rec}</span>
              </li>
            ))}
          </ul>
        </div>
      )}
    </div>
  );
}

/**
 * Collapsible insight section wrapper
 */
function InsightSection({ title, icon, expanded, onToggle, children }) {
  return (
    <div className="card mb-4">
      <button
        onClick={onToggle}
        className="w-full flex items-center justify-between text-left"
      >
        <div className="flex items-center gap-3">
          {icon}
          <h2 className="font-semibold text-gray-900">{title}</h2>
        </div>
        {expanded ? (
          <ChevronUp className="w-5 h-5 text-gray-400" />
        ) : (
          <ChevronDown className="w-5 h-5 text-gray-400" />
        )}
      </button>
      {expanded && <div className="mt-4 pt-4 border-t border-gray-100">{children}</div>}
    </div>
  );
}

/**
 * Card showing a single trigger ingredient
 */
function TriggerCard({ trigger }) {
  const correlationPercent = Math.abs(trigger.correlation * 100).toFixed(0);
  const isPositive = trigger.correlation > 0;

  return (
    <div className="p-4 rounded-lg bg-gray-50 hover:bg-gray-100 transition-colors">
      <div className="flex items-center justify-between mb-2">
        <span className="font-medium text-gray-900 capitalize">{trigger.ingredient}</span>
        <span className={`badge ${isPositive ? 'badge-danger' : 'badge-success'}`}>
          {correlationPercent}% correlation
        </span>
      </div>
      <div className="flex flex-wrap gap-2 mb-2">
        {trigger.affected_symptoms?.map((symptom) => (
          <span key={symptom} className="badge badge-secondary">
            {symptom}
          </span>
        ))}
      </div>
      {trigger.confidence_level && (
        <p className="text-xs text-gray-500">
          Confidence: {trigger.confidence_level}
          {trigger.sample_size && ` (${trigger.sample_size} data points)`}
        </p>
      )}
      {/* Correlation bar visualization */}
      <div className="mt-3">
        <div className="h-2 bg-gray-200 rounded-full overflow-hidden">
          <div
            className={`h-full rounded-full ${isPositive ? 'bg-danger-500' : 'bg-success-500'}`}
            style={{ width: `${Math.min(correlationPercent, 100)}%` }}
          />
        </div>
      </div>
    </div>
  );
}

/**
 * Phase analysis visualization
 */
function PhaseAnalysisView({ analysis }) {
  const phases = ['menstruation', 'follicular', 'ovulation', 'luteal'];
  const phaseLabels = {
    menstruation: 'Menstruation',
    follicular: 'Follicular',
    ovulation: 'Ovulation',
    luteal: 'Luteal',
  };
  const phaseColors = {
    menstruation: 'bg-danger-200',
    follicular: 'bg-warning-200',
    ovulation: 'bg-success-200',
    luteal: 'bg-secondary-200',
  };

  return (
    <div className="space-y-4">
      <div className="grid grid-cols-4 gap-2">
        {phases.map((phase) => (
          <div key={phase} className={`p-3 rounded-lg ${phaseColors[phase]} text-center`}>
            <p className="text-xs font-medium text-gray-700">{phaseLabels[phase]}</p>
            {analysis[phase] && (
              <p className="text-lg font-bold text-gray-900 mt-1">
                {analysis[phase].avg_energy?.toFixed(1) || '-'}
              </p>
            )}
            <p className="text-xs text-gray-600">avg energy</p>
          </div>
        ))}
      </div>
      {analysis.significant_patterns && (
        <div className="mt-4">
          <p className="text-sm font-medium text-gray-700 mb-2">Notable Patterns:</p>
          <ul className="text-sm text-gray-600 space-y-1">
            {analysis.significant_patterns.map((pattern, i) => (
              <li key={i} className="flex items-center gap-2">
                <span className="w-1.5 h-1.5 rounded-full bg-secondary-500" />
                {pattern}
              </li>
            ))}
          </ul>
        </div>
      )}
    </div>
  );
}

/**
 * Lag effect analysis visualization
 */
function LagAnalysisView({ analysis }) {
  const lagEffects = analysis.ingredient_lags || {};

  return (
    <div className="space-y-3">
      {Object.entries(lagEffects).map(([ingredient, data]) => (
        <div key={ingredient} className="p-4 rounded-lg bg-gray-50">
          <div className="flex items-center justify-between mb-2">
            <span className="font-medium text-gray-900 capitalize">{ingredient}</span>
            <span className="badge badge-primary">
              {data.optimal_lag_days === 0
                ? 'Same day effect'
                : `${data.optimal_lag_days} day${data.optimal_lag_days > 1 ? 's' : ''} delay`}
            </span>
          </div>
          <p className="text-sm text-gray-600">
            Affects: {data.affected_symptoms?.join(', ') || 'multiple symptoms'}
          </p>
        </div>
      ))}
      {analysis.insights && (
        <div className="mt-4 p-4 rounded-lg bg-primary-50">
          <p className="text-sm text-primary-900">
            {analysis.insights.join(' ')}
          </p>
        </div>
      )}
    </div>
  );
}

/**
 * Empty state component
 */
function EmptyState({ icon, message, subtext }) {
  return (
    <div className="text-center py-6">
      {icon}
      <p className="text-gray-500 mt-3">{message}</p>
      {subtext && <p className="text-sm text-gray-400 mt-1">{subtext}</p>}
    </div>
  );
}

export default InsightsTab;
