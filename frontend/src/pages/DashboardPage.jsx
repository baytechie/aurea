import { useState } from 'react';
import {
  Home,
  Search,
  Calendar,
  TrendingUp,
  Sparkles,
  Settings,
  LogOut,
  Menu,
  X
} from 'lucide-react';
import useAuth from '../hooks/useAuth';
import { useLogs, useInsights } from '../hooks/useIngredients';
import IngredientSearch from '../components/ingredients';
import DailyLogger from '../components/DailyLogger';
import Dashboard from '../components/Dashboard';
import InsightsTab from '../components/InsightsTab';
import PredictionsTab from '../components/PredictionsTab';

function DashboardPage() {
  const [activeTab, setActiveTab] = useState('dashboard');
  const [sidebarOpen, setSidebarOpen] = useState(false);
  const { user, logout } = useAuth();

  const navigation = [
    { id: 'dashboard', name: 'Dashboard', icon: Home },
    { id: 'search', name: 'Search Ingredients', icon: Search },
    { id: 'logger', name: 'Daily Logger', icon: Calendar },
    { id: 'insights', name: 'Insights', icon: TrendingUp },
    { id: 'predictions', name: 'Predictions', icon: Sparkles },
    { id: 'settings', name: 'Settings', icon: Settings },
  ];

  const renderContent = () => {
    switch (activeTab) {
      case 'search':
        return <IngredientSearch />;
      case 'logger':
        return <DailyLogger />;
      case 'insights':
        return <InsightsTab />;
      case 'predictions':
        return <PredictionsTab />;
      case 'settings':
        return <SettingsTab user={user} />;
      default:
        return <Dashboard onNavigate={setActiveTab} />;
    }
  };

  return (
    <div className="min-h-screen bg-gray-50 flex">
      {/* Mobile sidebar backdrop */}
      {sidebarOpen && (
        <div
          className="fixed inset-0 bg-black/50 z-20 lg:hidden"
          onClick={() => setSidebarOpen(false)}
        />
      )}

      {/* Sidebar */}
      <aside className={`
        fixed lg:static inset-y-0 left-0 z-30
        w-64 bg-white border-r border-gray-200
        transform transition-transform duration-200 ease-in-out
        ${sidebarOpen ? 'translate-x-0' : '-translate-x-full lg:translate-x-0'}
      `}>
        <div className="flex flex-col h-full">
          {/* Logo */}
          <div className="flex items-center justify-between px-6 py-4 border-b border-gray-200">
            <span className="text-2xl font-bold text-primary-600">Aurea</span>
            <button
              className="lg:hidden text-gray-500"
              onClick={() => setSidebarOpen(false)}
            >
              <X className="w-6 h-6" />
            </button>
          </div>

          {/* Navigation */}
          <nav className="flex-1 px-4 py-6 space-y-1">
            {navigation.map((item) => {
              const Icon = item.icon;
              return (
                <button
                  key={item.id}
                  onClick={() => {
                    setActiveTab(item.id);
                    setSidebarOpen(false);
                  }}
                  className={`
                    w-full flex items-center gap-3 px-4 py-3 rounded-lg text-left
                    transition-colors
                    ${activeTab === item.id
                      ? 'bg-primary-50 text-primary-600'
                      : 'text-gray-600 hover:bg-gray-50'
                    }
                  `}
                >
                  <Icon className="w-5 h-5" />
                  {item.name}
                </button>
              );
            })}
          </nav>

          {/* User section */}
          <div className="p-4 border-t border-gray-200">
            <div className="flex items-center gap-3 px-4 py-2 mb-2">
              <div className="w-10 h-10 rounded-full bg-primary-100 flex items-center justify-center">
                <span className="text-primary-600 font-medium">
                  {user?.email?.[0]?.toUpperCase() || 'U'}
                </span>
              </div>
              <div className="flex-1 min-w-0">
                <p className="text-sm font-medium text-gray-900 truncate">
                  {user?.email || 'User'}
                </p>
              </div>
            </div>
            <button
              onClick={logout}
              className="w-full flex items-center gap-3 px-4 py-3 rounded-lg text-gray-600 hover:bg-gray-50 transition-colors"
            >
              <LogOut className="w-5 h-5" />
              Log Out
            </button>
          </div>
        </div>
      </aside>

      {/* Main content */}
      <div className="flex-1 flex flex-col min-w-0">
        {/* Mobile header */}
        <header className="lg:hidden flex items-center justify-between px-4 py-3 bg-white border-b border-gray-200">
          <button
            onClick={() => setSidebarOpen(true)}
            className="text-gray-500"
          >
            <Menu className="w-6 h-6" />
          </button>
          <span className="text-xl font-bold text-primary-600">Aurea</span>
          <div className="w-6" /> {/* Spacer for centering */}
        </header>

        {/* Page content */}
        <main className="flex-1 p-4 lg:p-8 overflow-auto">
          {renderContent()}
        </main>
      </div>
    </div>
  );
}

// Settings tab component with full Profile features
function SettingsTab({ user }) {
  const [displayName, setDisplayName] = useState(user?.email?.split('@')[0] || '');
  const [showHistoryModal, setShowHistoryModal] = useState(false);
  const [showGoalsModal, setShowGoalsModal] = useState(false);
  const [goals, setGoals] = useState(() => {
    const stored = localStorage.getItem('aurea_goals');
    return stored ? JSON.parse(stored) : [];
  });
  const [newGoalTitle, setNewGoalTitle] = useState('');
  const [newGoalTarget, setNewGoalTarget] = useState('');
  const [notifications, setNotifications] = useState(() => {
    const stored = localStorage.getItem('aurea_notifications');
    return stored ? JSON.parse(stored) : {
      dailyReminder: true,
      insightAlerts: true,
      weeklyReport: false,
    };
  });

  const { data: logs = [], isLoading: logsLoading } = useLogs();
  const { data: insights } = useInsights();

  // Calculate dynamic stats
  const totalDaysLogged = logs.length;
  const uniqueIngredients = new Set(logs.flatMap(log => log.ingredients || [])).size;
  const insightsCount = insights?.recommendations?.length || 0;

  const saveGoals = (newGoals) => {
    localStorage.setItem('aurea_goals', JSON.stringify(newGoals));
    setGoals(newGoals);
  };

  const saveNotifications = (settings) => {
    localStorage.setItem('aurea_notifications', JSON.stringify(settings));
    setNotifications(settings);
  };

  const handleAddGoal = () => {
    if (!newGoalTitle.trim() || !newGoalTarget.trim()) return;
    const newGoal = {
      id: Date.now().toString(),
      title: newGoalTitle,
      target: parseInt(newGoalTarget, 10),
      completed: false,
    };
    saveGoals([...goals, newGoal]);
    setNewGoalTitle('');
    setNewGoalTarget('');
  };

  const handleToggleGoal = (goalId) => {
    const updated = goals.map(g =>
      g.id === goalId ? { ...g, completed: !g.completed } : g
    );
    saveGoals(updated);
  };

  const handleDeleteGoal = (goalId) => {
    if (confirm('Delete this goal?')) {
      saveGoals(goals.filter(g => g.id !== goalId));
    }
  };

  const handleExportData = () => {
    const exportData = {
      exportDate: new Date().toISOString(),
      user: { email: user?.email },
      logs,
      insights,
      goals,
    };
    const blob = new Blob([JSON.stringify(exportData, null, 2)], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `aurea-data-${new Date().toISOString().split('T')[0]}.json`;
    a.click();
    URL.revokeObjectURL(url);
  };

  const handleClearHistory = () => {
    if (confirm('This will clear all local data (goals, settings, food history). Are you sure?')) {
      localStorage.removeItem('aurea_goals');
      localStorage.removeItem('aurea_notifications');
      localStorage.removeItem('food_history');
      setGoals([]);
      setNotifications({ dailyReminder: true, insightAlerts: true, weeklyReport: false });
      alert('Local data cleared successfully');
    }
  };

  const handleShare = async () => {
    const text = `I'm using Aurea Health to track my food and wellness! I've logged ${totalDaysLogged} days and tracked ${uniqueIngredients} ingredients. Check it out!`;
    if (navigator.share) {
      await navigator.share({ title: 'Aurea Health', text });
    } else {
      navigator.clipboard.writeText(text);
      alert('Share text copied to clipboard!');
    }
  };

  const formatDate = (dateString) => {
    return new Date(dateString).toLocaleDateString('en-US', {
      month: 'short', day: 'numeric', year: 'numeric'
    });
  };

  const userInitials = user?.email?.[0]?.toUpperCase() || 'U';

  return (
    <div className="max-w-4xl">
      {/* Profile Header */}
      <div className="bg-gradient-to-r from-teal-500 to-teal-600 rounded-2xl p-6 mb-6 text-white">
        <div className="flex items-center gap-4 mb-6">
          <div className="w-16 h-16 rounded-full bg-white/20 flex items-center justify-center text-2xl font-bold">
            {userInitials}
          </div>
          <div>
            <h1 className="text-xl font-bold capitalize">{displayName || 'User'}</h1>
            <p className="text-white/80 text-sm">{user?.email}</p>
          </div>
        </div>

        {/* Stats Row */}
        <div className="grid grid-cols-3 gap-4 bg-white/10 rounded-xl p-4">
          <div className="text-center">
            <p className="text-2xl font-bold">{logsLoading ? '...' : totalDaysLogged}</p>
            <p className="text-xs text-white/80">Days Logged</p>
          </div>
          <div className="text-center border-l border-r border-white/20">
            <p className="text-2xl font-bold">{logsLoading ? '...' : uniqueIngredients}</p>
            <p className="text-xs text-white/80">Ingredients</p>
          </div>
          <div className="text-center">
            <p className="text-2xl font-bold">{insightsCount}</p>
            <p className="text-xs text-white/80">Insights</p>
          </div>
        </div>
      </div>

      {/* Quick Actions */}
      <div className="grid grid-cols-3 gap-4 mb-6">
        <button
          onClick={() => setShowHistoryModal(true)}
          className="card p-4 text-center hover:shadow-md transition-shadow"
        >
          <div className="w-10 h-10 rounded-lg bg-teal-100 flex items-center justify-center mx-auto mb-2">
            <Calendar className="w-5 h-5 text-teal-600" />
          </div>
          <p className="text-sm font-medium text-gray-900">History</p>
        </button>
        <button
          onClick={() => setShowGoalsModal(true)}
          className="card p-4 text-center hover:shadow-md transition-shadow"
        >
          <div className="w-10 h-10 rounded-lg bg-yellow-100 flex items-center justify-center mx-auto mb-2">
            <TrendingUp className="w-5 h-5 text-yellow-600" />
          </div>
          <p className="text-sm font-medium text-gray-900">Goals</p>
        </button>
        <button
          onClick={handleShare}
          className="card p-4 text-center hover:shadow-md transition-shadow"
        >
          <div className="w-10 h-10 rounded-lg bg-indigo-100 flex items-center justify-center mx-auto mb-2">
            <Sparkles className="w-5 h-5 text-indigo-600" />
          </div>
          <p className="text-sm font-medium text-gray-900">Share</p>
        </button>
      </div>

      {/* Profile Section */}
      <div className="card mb-6">
        <h2 className="font-semibold text-gray-900 mb-4">Profile</h2>
        <div className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Display Name</label>
            <input
              type="text"
              value={displayName}
              onChange={(e) => setDisplayName(e.target.value)}
              placeholder="Enter your name"
              className="input-field max-w-md"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Email</label>
            <p className="text-gray-500 flex items-center gap-2">
              {user?.email || 'Not available'}
              <span className="text-xs text-gray-400">(cannot be changed)</span>
            </p>
          </div>
        </div>
      </div>

      {/* Notifications Section */}
      <div className="card mb-6">
        <h2 className="font-semibold text-gray-900 mb-4">Notifications</h2>
        <div className="space-y-4">
          <label className="flex items-center justify-between">
            <div>
              <p className="text-gray-700">Daily Reminder</p>
              <p className="text-xs text-gray-500">Get reminded to log your meals</p>
            </div>
            <input
              type="checkbox"
              checked={notifications.dailyReminder}
              onChange={(e) => saveNotifications({ ...notifications, dailyReminder: e.target.checked })}
              className="w-5 h-5 rounded border-gray-300 text-teal-600 focus:ring-teal-500"
            />
          </label>
          <label className="flex items-center justify-between">
            <div>
              <p className="text-gray-700">Insight Alerts</p>
              <p className="text-xs text-gray-500">Notifications for new insights</p>
            </div>
            <input
              type="checkbox"
              checked={notifications.insightAlerts}
              onChange={(e) => saveNotifications({ ...notifications, insightAlerts: e.target.checked })}
              className="w-5 h-5 rounded border-gray-300 text-teal-600 focus:ring-teal-500"
            />
          </label>
          <label className="flex items-center justify-between">
            <div>
              <p className="text-gray-700">Weekly Report</p>
              <p className="text-xs text-gray-500">Summary of your weekly progress</p>
            </div>
            <input
              type="checkbox"
              checked={notifications.weeklyReport}
              onChange={(e) => saveNotifications({ ...notifications, weeklyReport: e.target.checked })}
              className="w-5 h-5 rounded border-gray-300 text-teal-600 focus:ring-teal-500"
            />
          </label>
        </div>
      </div>

      {/* Data Section */}
      <div className="card mb-6">
        <h2 className="font-semibold text-gray-900 mb-4">Data Management</h2>
        <div className="space-y-4">
          <div className="flex items-center justify-between p-4 bg-gray-50 rounded-lg">
            <div>
              <h3 className="font-medium text-gray-700">Export Data</h3>
              <p className="text-sm text-gray-500">Download all your health data</p>
            </div>
            <button onClick={handleExportData} className="btn-secondary">Export</button>
          </div>
          <div className="flex items-center justify-between p-4 bg-red-50 rounded-lg">
            <div>
              <h3 className="font-medium text-red-700">Clear History</h3>
              <p className="text-sm text-red-500">Delete all local data</p>
            </div>
            <button onClick={handleClearHistory} className="btn-danger">Clear</button>
          </div>
        </div>
      </div>

      {/* Support Section */}
      <div className="card">
        <h2 className="font-semibold text-gray-900 mb-4">Support</h2>
        <div className="space-y-2">
          <a href="/support" className="flex items-center justify-between p-3 hover:bg-gray-50 rounded-lg">
            <span className="text-gray-700">Help Center</span>
            <span className="text-gray-400">→</span>
          </a>
          <a href="mailto:support@aureahealth.app" className="flex items-center justify-between p-3 hover:bg-gray-50 rounded-lg">
            <span className="text-gray-700">Contact Support</span>
            <span className="text-gray-400">→</span>
          </a>
          <a href="/privacy" className="flex items-center justify-between p-3 hover:bg-gray-50 rounded-lg">
            <span className="text-gray-700">Privacy Policy</span>
            <span className="text-gray-400">→</span>
          </a>
        </div>
      </div>

      {/* History Modal */}
      {showHistoryModal && (
        <div className="fixed inset-0 bg-black/50 z-50 flex items-center justify-center p-4">
          <div className="bg-white rounded-2xl w-full max-w-lg max-h-[80vh] overflow-hidden flex flex-col">
            <div className="flex items-center justify-between p-4 border-b">
              <h3 className="text-lg font-semibold">Log History</h3>
              <button onClick={() => setShowHistoryModal(false)} className="text-gray-500 hover:text-gray-700">
                <X className="w-5 h-5" />
              </button>
            </div>
            <div className="flex-1 overflow-auto p-4">
              {logsLoading ? (
                <div className="text-center py-8 text-gray-500">Loading...</div>
              ) : logs.length === 0 ? (
                <div className="text-center py-8 text-gray-500">No logs yet</div>
              ) : (
                <div className="space-y-3">
                  {logs.map((log) => (
                    <div key={log.id || log.date} className="p-3 bg-gray-50 rounded-lg">
                      <p className="font-medium text-gray-900">{formatDate(log.date)}</p>
                      <div className="flex flex-wrap gap-1 mt-2">
                        {(log.ingredients || []).slice(0, 5).map((ing, i) => (
                          <span key={i} className="text-xs px-2 py-1 bg-teal-100 text-teal-700 rounded-full">
                            {ing}
                          </span>
                        ))}
                        {(log.ingredients || []).length > 5 && (
                          <span className="text-xs text-gray-500">+{log.ingredients.length - 5} more</span>
                        )}
                      </div>
                    </div>
                  ))}
                </div>
              )}
            </div>
          </div>
        </div>
      )}

      {/* Goals Modal */}
      {showGoalsModal && (
        <div className="fixed inset-0 bg-black/50 z-50 flex items-center justify-center p-4">
          <div className="bg-white rounded-2xl w-full max-w-lg max-h-[80vh] overflow-hidden flex flex-col">
            <div className="flex items-center justify-between p-4 border-b">
              <h3 className="text-lg font-semibold">My Goals</h3>
              <button onClick={() => setShowGoalsModal(false)} className="text-gray-500 hover:text-gray-700">
                <X className="w-5 h-5" />
              </button>
            </div>
            <div className="p-4 border-b bg-gray-50">
              <input
                type="text"
                value={newGoalTitle}
                onChange={(e) => setNewGoalTitle(e.target.value)}
                placeholder="Goal title (e.g., Log meals daily)"
                className="input-field mb-2"
              />
              <div className="flex gap-2">
                <input
                  type="number"
                  value={newGoalTarget}
                  onChange={(e) => setNewGoalTarget(e.target.value)}
                  placeholder="Target days"
                  className="input-field flex-1"
                />
                <button onClick={handleAddGoal} className="btn-primary px-4">Add</button>
              </div>
            </div>
            <div className="flex-1 overflow-auto p-4">
              {goals.length === 0 ? (
                <div className="text-center py-8 text-gray-500">No goals yet. Add one above!</div>
              ) : (
                <div className="space-y-2">
                  {goals.map((goal) => (
                    <div key={goal.id} className="flex items-center gap-3 p-3 bg-gray-50 rounded-lg">
                      <input
                        type="checkbox"
                        checked={goal.completed}
                        onChange={() => handleToggleGoal(goal.id)}
                        className="w-5 h-5 rounded border-gray-300 text-teal-600"
                      />
                      <div className="flex-1">
                        <p className={`font-medium ${goal.completed ? 'line-through text-gray-400' : 'text-gray-900'}`}>
                          {goal.title}
                        </p>
                        <p className="text-xs text-gray-500">Target: {goal.target} days</p>
                      </div>
                      <button onClick={() => handleDeleteGoal(goal.id)} className="text-red-500 hover:text-red-700">
                        <X className="w-4 h-4" />
                      </button>
                    </div>
                  ))}
                </div>
              )}
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

export default DashboardPage;
