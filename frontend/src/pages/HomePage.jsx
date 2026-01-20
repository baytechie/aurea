import { Link } from 'react-router-dom';
import { ArrowRight, Search, TrendingUp, Brain, Activity } from 'lucide-react';

function HomePage() {
  return (
    <div className="min-h-screen bg-gradient-to-b from-indigo-50 to-white">
      {/* Navigation */}
      <nav className="flex items-center justify-between px-6 py-4 max-w-6xl mx-auto">
        <div className="text-2xl font-bold text-indigo-600">Aurea</div>
        <div className="flex gap-4">
          <Link
            to="/login"
            className="px-4 py-2 text-gray-600 hover:text-gray-900 transition-colors"
          >
            Log in
          </Link>
          <Link
            to="/signup"
            className="btn-primary flex items-center gap-2"
          >
            Get Started
            <ArrowRight className="w-4 h-4" />
          </Link>
        </div>
      </nav>

      {/* Hero Section */}
      <main className="max-w-6xl mx-auto px-6 pt-20 pb-32">
        <div className="text-center max-w-3xl mx-auto">
          <h1 className="text-5xl font-bold text-gray-900 mb-6 leading-tight">
            Discover What Your{' '}
            <span className="text-indigo-600">Ingredients</span>{' '}
            Really Do
          </h1>
          <p className="text-xl text-gray-600 mb-10">
            Track what you eat, understand how ingredients affect your body,
            and get personalized insights to feel your best.
          </p>
          <div className="flex gap-4 justify-center">
            <Link to="/signup" className="btn-primary text-lg px-8 py-3">
              Start Free Trial
            </Link>
            <Link to="/login" className="btn-secondary text-lg px-8 py-3">
              Log In
            </Link>
          </div>
        </div>

        {/* Features Grid */}
        <div className="grid md:grid-cols-3 gap-8 mt-24">
          <FeatureCard
            icon={<Search className="w-8 h-8 text-indigo-600" />}
            title="Search Any Ingredient"
            description="Get instant health scores for any ingredient - blood sugar impact, inflammation potential, and more."
          />
          <FeatureCard
            icon={<Activity className="w-8 h-8 text-indigo-600" />}
            title="Track Your Symptoms"
            description="Log daily energy, bloating, focus, mood, and sleep. See patterns over time."
          />
          <FeatureCard
            icon={<Brain className="w-8 h-8 text-indigo-600" />}
            title="AI-Powered Insights"
            description="Our ML model learns your body's responses and predicts how foods will affect you."
          />
        </div>

        {/* How it Works */}
        <div className="mt-32">
          <h2 className="text-3xl font-bold text-center text-gray-900 mb-12">
            How It Works
          </h2>
          <div className="grid md:grid-cols-4 gap-6">
            <StepCard number="1" title="Log Your Food" description="Search and add ingredients you've eaten" />
            <StepCard number="2" title="Rate Your Day" description="Quick symptom check - energy, focus, mood" />
            <StepCard number="3" title="See Patterns" description="Discover which ingredients affect you" />
            <StepCard number="4" title="Get Predictions" description="Know how tomorrow might feel" />
          </div>
        </div>
      </main>

      {/* Footer */}
      <footer className="border-t border-gray-200 py-8">
        <div className="max-w-6xl mx-auto px-6 text-center text-gray-500">
          <p>&copy; 2025 Aurea. Your personal health companion.</p>
        </div>
      </footer>
    </div>
  );
}

function FeatureCard({ icon, title, description }) {
  return (
    <div className="card text-center">
      <div className="flex justify-center mb-4">{icon}</div>
      <h3 className="text-xl font-semibold text-gray-900 mb-2">{title}</h3>
      <p className="text-gray-600">{description}</p>
    </div>
  );
}

function StepCard({ number, title, description }) {
  return (
    <div className="text-center">
      <div className="w-12 h-12 rounded-full bg-indigo-100 text-indigo-600 font-bold text-xl flex items-center justify-center mx-auto mb-4">
        {number}
      </div>
      <h3 className="font-semibold text-gray-900 mb-1">{title}</h3>
      <p className="text-sm text-gray-600">{description}</p>
    </div>
  );
}

export default HomePage;
