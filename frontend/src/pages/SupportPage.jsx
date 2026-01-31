import { Link } from 'react-router-dom';

export default function SupportPage() {
  return (
    <div className="min-h-screen bg-gradient-to-b from-teal-50 to-white">
      {/* Header */}
      <header className="px-6 py-4">
        <Link to="/" className="text-xl font-bold text-teal-600">Aurea</Link>
      </header>

      {/* Content */}
      <main className="max-w-3xl mx-auto px-6 py-12">
        <h1 className="text-3xl font-bold text-gray-900 mb-8">Support</h1>

        <div className="bg-white rounded-xl shadow-sm border border-gray-100 p-8 mb-8">
          <h2 className="text-xl font-semibold text-gray-800 mb-4">Contact Us</h2>
          <p className="text-gray-600 mb-6">
            We're here to help! If you have any questions, feedback, or need assistance with Aurea, please reach out to us.
          </p>

          <div className="space-y-4">
            <div className="flex items-start gap-4">
              <div className="w-10 h-10 bg-teal-100 rounded-full flex items-center justify-center flex-shrink-0">
                <svg className="w-5 h-5 text-teal-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                </svg>
              </div>
              <div>
                <h3 className="font-medium text-gray-800">Email Support</h3>
                <a href="mailto:support@aureahealth.app" className="text-teal-600 hover:underline">support@aureahealth.app</a>
                <p className="text-sm text-gray-500 mt-1">We typically respond within 24-48 hours</p>
              </div>
            </div>
          </div>
        </div>

        <div className="bg-white rounded-xl shadow-sm border border-gray-100 p-8 mb-8">
          <h2 className="text-xl font-semibold text-gray-800 mb-4">Frequently Asked Questions</h2>

          <div className="space-y-6">
            <div>
              <h3 className="font-medium text-gray-800 mb-2">How does Aurea work?</h3>
              <p className="text-gray-600">
                Aurea helps you understand how different ingredients affect your body. Log what you eat, track your symptoms and energy levels, and our AI will identify patterns to give you personalized insights.
              </p>
            </div>

            <div>
              <h3 className="font-medium text-gray-800 mb-2">Is my health data secure?</h3>
              <p className="text-gray-600">
                Yes, we take data security seriously. Your health data is encrypted and stored securely. We never sell your personal information. Read our <Link to="/privacy" className="text-teal-600 hover:underline">Privacy Policy</Link> for more details.
              </p>
            </div>

            <div>
              <h3 className="font-medium text-gray-800 mb-2">Can I export my data?</h3>
              <p className="text-gray-600">
                Yes, you can export all your logged data at any time from your account settings. Your data belongs to you.
              </p>
            </div>

            <div>
              <h3 className="font-medium text-gray-800 mb-2">How do I delete my account?</h3>
              <p className="text-gray-600">
                You can delete your account and all associated data from the app settings. If you need assistance, contact our support team.
              </p>
            </div>
          </div>
        </div>

        <div className="bg-teal-50 rounded-xl p-8">
          <h2 className="text-xl font-semibold text-gray-800 mb-4">Beta Feedback</h2>
          <p className="text-gray-600 mb-4">
            As a beta tester, your feedback is invaluable! Help us improve Aurea by sharing your thoughts, reporting bugs, or suggesting new features.
          </p>
          <a
            href="mailto:feedback@aureahealth.app?subject=Aurea Beta Feedback"
            className="inline-flex items-center gap-2 bg-teal-500 text-white px-6 py-3 rounded-lg font-medium hover:bg-teal-600 transition-colors"
          >
            Send Feedback
            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M14 5l7 7m0 0l-7 7m7-7H3" />
            </svg>
          </a>
        </div>

        <div className="mt-12 pt-8 border-t border-gray-200">
          <Link to="/" className="text-teal-600 hover:underline">&larr; Back to Home</Link>
        </div>
      </main>

      {/* Footer */}
      <footer className="bg-gray-50 px-6 py-8 mt-12">
        <div className="max-w-3xl mx-auto text-center text-gray-500 text-sm">
          &copy; 2026 Aurea Health. All rights reserved.
        </div>
      </footer>
    </div>
  );
}
