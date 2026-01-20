import { useState } from 'react';
import {
  Home,
  Search,
  Calendar,
  TrendingUp,
  Settings,
  LogOut,
  Menu,
  X
} from 'lucide-react';
import useAuth from '../hooks/useAuth';
import IngredientSearch from '../components/IngredientSearch';
import DailyLogger from '../components/DailyLogger';
import Dashboard from '../components/Dashboard';

function DashboardPage() {
  const [activeTab, setActiveTab] = useState('dashboard');
  const [sidebarOpen, setSidebarOpen] = useState(false);
  const { user, logout } = useAuth();

  const navigation = [
    { id: 'dashboard', name: 'Dashboard', icon: Home },
    { id: 'search', name: 'Search Ingredients', icon: Search },
    { id: 'logger', name: 'Daily Logger', icon: Calendar },
    { id: 'insights', name: 'Insights', icon: TrendingUp },
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
      case 'settings':
        return <SettingsTab />;
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
            <span className="text-2xl font-bold text-indigo-600">Aurea</span>
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
                      ? 'bg-indigo-50 text-indigo-600'
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
              <div className="w-10 h-10 rounded-full bg-indigo-100 flex items-center justify-center">
                <span className="text-indigo-600 font-medium">
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
          <span className="text-xl font-bold text-indigo-600">Aurea</span>
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

// Placeholder components for other tabs
function InsightsTab() {
  return (
    <div className="max-w-4xl">
      <h1 className="text-2xl font-bold text-gray-900 mb-6">Your Insights</h1>
      <div className="card">
        <p className="text-gray-600">
          Your personalized insights will appear here as you log more data.
          Keep tracking your meals and symptoms to unlock patterns!
        </p>
      </div>
    </div>
  );
}

function SettingsTab() {
  return (
    <div className="max-w-4xl">
      <h1 className="text-2xl font-bold text-gray-900 mb-6">Settings</h1>
      <div className="card space-y-6">
        <div>
          <h3 className="font-medium text-gray-900 mb-2">Notifications</h3>
          <label className="flex items-center gap-3">
            <input type="checkbox" className="w-4 h-4 text-indigo-600 rounded" />
            <span className="text-gray-600">Daily reminder to log meals</span>
          </label>
        </div>
        <div>
          <h3 className="font-medium text-gray-900 mb-2">Cycle Tracking</h3>
          <label className="flex items-center gap-3">
            <input type="checkbox" className="w-4 h-4 text-indigo-600 rounded" />
            <span className="text-gray-600">Enable menstrual cycle tracking</span>
          </label>
        </div>
        <div>
          <h3 className="font-medium text-gray-900 mb-2">Data Export</h3>
          <button className="btn-secondary">Export My Data</button>
        </div>
      </div>
    </div>
  );
}

export default DashboardPage;
