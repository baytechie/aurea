import { Calendar, TrendingUp, AlertTriangle, ArrowRight, Loader2 } from 'lucide-react';
import { useLogs, useInsights } from '../hooks/useIngredients';
import { formatDate, SYMPTOM_LABELS } from '../lib/utils';

function Dashboard({ onNavigate }) {
  const { data: logs, isLoading: logsLoading } = useLogs();
  const { data: insights, isLoading: insightsLoading } = useInsights();

  const recentLogs = logs?.slice(0, 5) || [];

  return (
    <div className="max-w-4xl">
      <h1 className="text-2xl font-bold text-gray-900 mb-6">Welcome Back</h1>

      <div className="grid gap-6 md:grid-cols-2">
        {/* Quick Actions */}
        <div className="card">
          <h2 className="font-semibold text-gray-900 mb-4">Quick Actions</h2>
          <div className="space-y-3">
            <button
              onClick={() => onNavigate('logger')}
              className="w-full flex items-center justify-between p-4 rounded-lg border border-gray-200 hover:border-primary-300 hover:bg-primary-50 transition-colors"
            >
              <div className="flex items-center gap-3">
                <Calendar className="w-5 h-5 text-primary-600" />
                <span className="font-medium text-gray-900">Log Today's Meals</span>
              </div>
              <ArrowRight className="w-5 h-5 text-gray-400" />
            </button>
            <button
              onClick={() => onNavigate('search')}
              className="w-full flex items-center justify-between p-4 rounded-lg border border-gray-200 hover:border-primary-300 hover:bg-primary-50 transition-colors"
            >
              <div className="flex items-center gap-3">
                <TrendingUp className="w-5 h-5 text-primary-600" />
                <span className="font-medium text-gray-900">Search Ingredients</span>
              </div>
              <ArrowRight className="w-5 h-5 text-gray-400" />
            </button>
          </div>
        </div>

        {/* Summary Stats */}
        <div className="card">
          <h2 className="font-semibold text-gray-900 mb-4">Your Stats</h2>
          {logsLoading ? (
            <div className="flex items-center justify-center py-8">
              <Loader2 className="w-6 h-6 text-primary-600 animate-spin" />
            </div>
          ) : (
            <div className="grid grid-cols-2 gap-4">
              <StatCard
                label="Total Logs"
                value={logs?.length || 0}
                color="bg-blue-100 text-blue-700"
              />
              <StatCard
                label="This Week"
                value={getThisWeekCount(logs)}
                color="bg-green-100 text-green-700"
              />
              <StatCard
                label="Avg Energy"
                value={getAverageSymptom(logs, 'energy')}
                color="bg-yellow-100 text-yellow-700"
              />
              <StatCard
                label="Streak"
                value={`${getStreak(logs)} days`}
                color="bg-purple-100 text-purple-700"
              />
            </div>
          )}
        </div>

        {/* Recent Logs */}
        <div className="card md:col-span-2">
          <div className="flex items-center justify-between mb-4">
            <h2 className="font-semibold text-gray-900">Recent Logs</h2>
            {logs?.length > 5 && (
              <button
                onClick={() => onNavigate('insights')}
                className="text-sm text-primary-600 hover:text-primary-700"
              >
                View all
              </button>
            )}
          </div>

          {logsLoading ? (
            <div className="flex items-center justify-center py-8">
              <Loader2 className="w-6 h-6 text-primary-600 animate-spin" />
            </div>
          ) : recentLogs.length > 0 ? (
            <div className="space-y-3">
              {recentLogs.map((log) => (
                <LogEntry key={log.id || log.date} log={log} />
              ))}
            </div>
          ) : (
            <div className="text-center py-8">
              <Calendar className="w-12 h-12 text-gray-300 mx-auto mb-3" />
              <p className="text-gray-500 mb-4">No logs yet. Start tracking!</p>
              <button
                onClick={() => onNavigate('logger')}
                className="btn-primary"
              >
                Create First Log
              </button>
            </div>
          )}
        </div>

        {/* Insights Preview */}
        <div className="card md:col-span-2">
          <div className="flex items-center justify-between mb-4">
            <h2 className="font-semibold text-gray-900">Personal Insights</h2>
            <button
              onClick={() => onNavigate('insights')}
              className="text-sm text-primary-600 hover:text-primary-700"
            >
              See details
            </button>
          </div>

          {insightsLoading ? (
            <div className="flex items-center justify-center py-8">
              <Loader2 className="w-6 h-6 text-primary-600 animate-spin" />
            </div>
          ) : insights?.top_triggers?.length > 0 ? (
            <div>
              <p className="text-sm text-gray-600 mb-3">
                Based on your logs, these ingredients may affect you:
              </p>
              <div className="flex flex-wrap gap-2">
                {insights.top_triggers.slice(0, 5).map((trigger) => (
                  <span
                    key={trigger.ingredient || trigger}
                    className="inline-flex items-center gap-1 px-3 py-1 bg-orange-100 text-orange-700 rounded-full text-sm"
                  >
                    <AlertTriangle className="w-3 h-3" />
                    {trigger.ingredient || trigger}
                  </span>
                ))}
              </div>
            </div>
          ) : (
            <div className="text-center py-6">
              <TrendingUp className="w-10 h-10 text-gray-300 mx-auto mb-3" />
              <p className="text-gray-500">
                Log more meals to unlock personalized insights
              </p>
              <p className="text-sm text-gray-400 mt-1">
                We need at least 7 days of data
              </p>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

function StatCard({ label, value, color }) {
  return (
    <div className={`p-4 rounded-lg ${color}`}>
      <p className="text-2xl font-bold">{value}</p>
      <p className="text-sm opacity-80">{label}</p>
    </div>
  );
}

function LogEntry({ log }) {
  const symptoms = log.symptoms || {};

  return (
    <div className="flex items-center gap-4 p-4 rounded-lg bg-gray-50">
      <div className="flex-1 min-w-0">
        <p className="font-medium text-gray-900">{formatDate(log.date)}</p>
        <p className="text-sm text-gray-500 truncate">
          {log.ingredients?.join(', ') || 'No ingredients logged'}
        </p>
      </div>
      <div className="flex gap-2">
        {['energy', 'bloating', 'mood'].map((symptom) => (
          <div
            key={symptom}
            className="text-center"
            title={SYMPTOM_LABELS[symptom]}
          >
            <div className={`text-xs font-medium ${getSymptomColor(symptoms[symptom], symptom === 'bloating')}`}>
              {symptoms[symptom] ?? '-'}
            </div>
            <div className="text-xs text-gray-400">
              {symptom.slice(0, 3)}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}

// Helper functions
function getThisWeekCount(logs) {
  if (!logs) return 0;
  const weekAgo = new Date();
  weekAgo.setDate(weekAgo.getDate() - 7);
  return logs.filter((log) => new Date(log.date) >= weekAgo).length;
}

function getAverageSymptom(logs, symptom) {
  if (!logs || logs.length === 0) return '-';
  const values = logs
    .map((log) => log.symptoms?.[symptom])
    .filter((v) => v !== undefined && v !== null);
  if (values.length === 0) return '-';
  const avg = values.reduce((a, b) => a + b, 0) / values.length;
  return avg.toFixed(1);
}

function getStreak(logs) {
  if (!logs || logs.length === 0) return 0;

  const sortedDates = logs
    .map((log) => new Date(log.date).toDateString())
    .sort((a, b) => new Date(b) - new Date(a));

  let streak = 0;
  const today = new Date();
  let checkDate = new Date(today);

  for (let i = 0; i < 30; i++) {
    const dateStr = checkDate.toDateString();
    if (sortedDates.includes(dateStr)) {
      streak++;
      checkDate.setDate(checkDate.getDate() - 1);
    } else if (i === 0) {
      // Allow today to not be logged yet
      checkDate.setDate(checkDate.getDate() - 1);
    } else {
      break;
    }
  }

  return streak;
}

function getSymptomColor(value, inverted = false) {
  if (value === undefined || value === null) return 'text-gray-400';
  const normalized = inverted ? 5 - value : value;
  if (normalized >= 4) return 'text-green-600';
  if (normalized >= 2) return 'text-yellow-600';
  return 'text-red-600';
}

export default Dashboard;
