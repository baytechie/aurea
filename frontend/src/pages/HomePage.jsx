import { Link } from 'react-router-dom';
import { ArrowRight, Search, TrendingUp, Brain, Activity, Sparkles, Shield, Zap } from 'lucide-react';

function HomePage() {
  return (
    <div className="min-h-screen bg-gradient-to-b from-primary-50 via-white to-white">
      {/* Navigation */}
      <nav className="flex items-center justify-between px-6 py-4 max-w-6xl mx-auto">
        <div className="flex items-center gap-2">
          <div className="w-8 h-8 rounded-lg bg-gradient-to-br from-primary-500 to-primary-600 flex items-center justify-center">
            <Sparkles className="w-5 h-5 text-white" />
          </div>
          <span className="text-2xl font-bold text-gray-900">Aurea</span>
        </div>
        <div className="flex gap-4 items-center">
          <Link
            to="/login"
            className="px-4 py-2 text-gray-600 hover:text-gray-900 font-medium transition-colors"
          >
            Log in
          </Link>
          <Link
            to="/signup"
            className="btn-primary"
          >
            Get Started
            <ArrowRight className="w-4 h-4" />
          </Link>
        </div>
      </nav>

      {/* Hero Section */}
      <main className="max-w-6xl mx-auto px-6 pt-16 pb-24">
        <div className="text-center max-w-3xl mx-auto">
          {/* Badge */}
          <div className="inline-flex items-center gap-2 px-4 py-2 bg-primary-100 text-primary-700 rounded-full text-sm font-medium mb-6">
            <Zap className="w-4 h-4" />
            AI-Powered Health Insights
          </div>

          <h1 className="text-5xl md:text-6xl font-bold text-gray-900 mb-6 leading-tight tracking-tight">
            Discover What Your{' '}
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-primary-500 to-secondary-500">
              Ingredients
            </span>{' '}
            Really Do
          </h1>
          <p className="text-xl text-gray-600 mb-10 leading-relaxed max-w-2xl mx-auto">
            Track what you eat, understand how ingredients affect your body,
            and get personalized insights to feel your best.
          </p>
          <div className="flex gap-4 justify-center flex-wrap">
            <Link to="/signup" className="btn-primary text-base px-8 py-3">
              Start Free Trial
              <ArrowRight className="w-4 h-4" />
            </Link>
            <Link to="/login" className="btn-secondary text-base px-8 py-3">
              Log In
            </Link>
          </div>

          {/* Trust indicators */}
          <div className="flex items-center justify-center gap-6 mt-10 text-sm text-gray-500">
            <div className="flex items-center gap-2">
              <Shield className="w-4 h-4 text-primary-500" />
              <span>Privacy-first</span>
            </div>
            <div className="flex items-center gap-2">
              <Sparkles className="w-4 h-4 text-primary-500" />
              <span>AI-powered</span>
            </div>
            <div className="flex items-center gap-2">
              <Activity className="w-4 h-4 text-primary-500" />
              <span>Evidence-based</span>
            </div>
          </div>
        </div>

        {/* Features Grid */}
        <div className="grid md:grid-cols-3 gap-6 mt-24">
          <FeatureCard
            icon={<Search className="w-6 h-6" />}
            iconBg="bg-primary-100"
            iconColor="text-primary-600"
            title="Search Any Ingredient"
            description="Get instant health scores for any ingredient - blood sugar impact, inflammation potential, and more."
          />
          <FeatureCard
            icon={<Activity className="w-6 h-6" />}
            iconBg="bg-secondary-100"
            iconColor="text-secondary-600"
            title="Track Your Symptoms"
            description="Log daily energy, bloating, focus, mood, and sleep. See patterns emerge over time."
          />
          <FeatureCard
            icon={<Brain className="w-6 h-6" />}
            iconBg="bg-success-100"
            iconColor="text-success-600"
            title="AI-Powered Insights"
            description="Our ML model learns your body's responses and predicts how foods will affect you."
          />
        </div>

        {/* How it Works */}
        <div className="mt-32">
          <div className="text-center mb-12">
            <h2 className="text-3xl font-bold text-gray-900 mb-4">
              How It Works
            </h2>
            <p className="text-gray-600 max-w-xl mx-auto">
              Four simple steps to understanding your body better
            </p>
          </div>
          <div className="grid md:grid-cols-4 gap-8">
            <StepCard
              number="1"
              title="Log Your Food"
              description="Search and add ingredients you've eaten throughout the day"
            />
            <StepCard
              number="2"
              title="Rate Your Day"
              description="Quick symptom check - energy, focus, mood, and more"
            />
            <StepCard
              number="3"
              title="See Patterns"
              description="Discover which ingredients affect how you feel"
            />
            <StepCard
              number="4"
              title="Get Predictions"
              description="Know how tomorrow might feel based on what you ate"
            />
          </div>
        </div>

        {/* CTA Section */}
        <div className="mt-32">
          <div className="relative rounded-2xl bg-gradient-to-br from-primary-500 to-primary-600 p-12 text-center overflow-hidden">
            {/* Background decoration */}
            <div className="absolute inset-0 opacity-10">
              <div className="absolute top-0 left-0 w-64 h-64 bg-white rounded-full -translate-x-1/2 -translate-y-1/2" />
              <div className="absolute bottom-0 right-0 w-96 h-96 bg-white rounded-full translate-x-1/3 translate-y-1/3" />
            </div>

            <div className="relative z-10">
              <h2 className="text-3xl font-bold text-white mb-4">
                Ready to understand your body?
              </h2>
              <p className="text-primary-100 mb-8 max-w-xl mx-auto">
                Join thousands of users who are discovering how food affects their wellbeing.
                Start your free trial today.
              </p>
              <Link
                to="/signup"
                className="inline-flex items-center gap-2 px-8 py-3 bg-white text-primary-600 font-semibold rounded-lg shadow-lg hover:shadow-xl hover:bg-gray-50 transition-all"
              >
                Get Started Free
                <ArrowRight className="w-4 h-4" />
              </Link>
            </div>
          </div>
        </div>
      </main>

      {/* Footer */}
      <footer className="border-t border-gray-200 py-8 bg-gray-50">
        <div className="max-w-6xl mx-auto px-6">
          <div className="flex flex-col md:flex-row items-center justify-between gap-4">
            <div className="flex items-center gap-2">
              <div className="w-6 h-6 rounded-md bg-gradient-to-br from-primary-500 to-primary-600 flex items-center justify-center">
                <Sparkles className="w-4 h-4 text-white" />
              </div>
              <span className="font-semibold text-gray-900">Aurea</span>
            </div>
            <p className="text-gray-500 text-sm">
              2025 Aurea. Your personal health companion.
            </p>
          </div>
        </div>
      </footer>
    </div>
  );
}

function FeatureCard({ icon, iconBg, iconColor, title, description }) {
  return (
    <div className="card-hover group">
      <div className={`w-12 h-12 rounded-xl ${iconBg} ${iconColor} flex items-center justify-center mb-4 group-hover:scale-110 transition-transform`}>
        {icon}
      </div>
      <h3 className="text-lg font-semibold text-gray-900 mb-2">{title}</h3>
      <p className="text-gray-600 leading-relaxed">{description}</p>
    </div>
  );
}

function StepCard({ number, title, description }) {
  return (
    <div className="text-center group">
      <div className="w-14 h-14 rounded-full bg-gradient-to-br from-primary-100 to-primary-200 text-primary-600 font-bold text-xl flex items-center justify-center mx-auto mb-4 shadow-sm group-hover:shadow-md group-hover:scale-105 transition-all">
        {number}
      </div>
      <h3 className="font-semibold text-gray-900 mb-2">{title}</h3>
      <p className="text-sm text-gray-600 leading-relaxed">{description}</p>
    </div>
  );
}

export default HomePage;
