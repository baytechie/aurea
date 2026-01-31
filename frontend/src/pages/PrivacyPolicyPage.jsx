import { Link } from 'react-router-dom';

export default function PrivacyPolicyPage() {
  return (
    <div className="min-h-screen bg-gradient-to-b from-teal-50 to-white">
      {/* Header */}
      <header className="px-6 py-4">
        <Link to="/" className="text-xl font-bold text-teal-600">Aurea</Link>
      </header>

      {/* Content */}
      <main className="max-w-3xl mx-auto px-6 py-12">
        <h1 className="text-3xl font-bold text-gray-900 mb-8">Privacy Policy</h1>
        <p className="text-gray-600 mb-4">Last updated: January 31, 2026</p>

        <div className="prose prose-gray max-w-none">
          <section className="mb-8">
            <h2 className="text-xl font-semibold text-gray-800 mb-4">1. Introduction</h2>
            <p className="text-gray-600 mb-4">
              Aurea Health ("we," "our," or "us") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application and website (collectively, the "Service").
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-xl font-semibold text-gray-800 mb-4">2. Information We Collect</h2>
            <h3 className="text-lg font-medium text-gray-700 mb-2">Personal Information</h3>
            <p className="text-gray-600 mb-4">
              We may collect personal information that you voluntarily provide when using our Service, including:
            </p>
            <ul className="list-disc list-inside text-gray-600 mb-4 space-y-2">
              <li>Email address (for account creation and communication)</li>
              <li>Name (optional, for personalization)</li>
              <li>Health and wellness data you choose to log (food intake, symptoms, mood)</li>
            </ul>

            <h3 className="text-lg font-medium text-gray-700 mb-2">Automatically Collected Information</h3>
            <p className="text-gray-600 mb-4">
              When you use our Service, we may automatically collect certain information, including:
            </p>
            <ul className="list-disc list-inside text-gray-600 mb-4 space-y-2">
              <li>Device information (device type, operating system)</li>
              <li>Usage data (features used, time spent in app)</li>
              <li>Log data (IP address, browser type, access times)</li>
            </ul>
          </section>

          <section className="mb-8">
            <h2 className="text-xl font-semibold text-gray-800 mb-4">3. How We Use Your Information</h2>
            <p className="text-gray-600 mb-4">We use the collected information for:</p>
            <ul className="list-disc list-inside text-gray-600 mb-4 space-y-2">
              <li>Providing and maintaining our Service</li>
              <li>Personalizing your experience and providing AI-powered health insights</li>
              <li>Analyzing ingredient impacts on your wellbeing</li>
              <li>Improving our Service and developing new features</li>
              <li>Communicating with you about updates and support</li>
            </ul>
          </section>

          <section className="mb-8">
            <h2 className="text-xl font-semibold text-gray-800 mb-4">4. Data Security</h2>
            <p className="text-gray-600 mb-4">
              We implement appropriate technical and organizational security measures to protect your personal information. However, no method of transmission over the Internet or electronic storage is 100% secure, and we cannot guarantee absolute security.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-xl font-semibold text-gray-800 mb-4">5. Data Sharing</h2>
            <p className="text-gray-600 mb-4">
              We do not sell your personal information. We may share your information only in the following circumstances:
            </p>
            <ul className="list-disc list-inside text-gray-600 mb-4 space-y-2">
              <li>With your consent</li>
              <li>To comply with legal obligations</li>
              <li>To protect our rights and prevent fraud</li>
              <li>With service providers who assist in operating our Service (under strict confidentiality agreements)</li>
            </ul>
          </section>

          <section className="mb-8">
            <h2 className="text-xl font-semibold text-gray-800 mb-4">6. Your Rights</h2>
            <p className="text-gray-600 mb-4">You have the right to:</p>
            <ul className="list-disc list-inside text-gray-600 mb-4 space-y-2">
              <li>Access your personal data</li>
              <li>Correct inaccurate data</li>
              <li>Request deletion of your data</li>
              <li>Export your data</li>
              <li>Opt-out of marketing communications</li>
            </ul>
          </section>

          <section className="mb-8">
            <h2 className="text-xl font-semibold text-gray-800 mb-4">7. Children's Privacy</h2>
            <p className="text-gray-600 mb-4">
              Our Service is not intended for children under 13. We do not knowingly collect personal information from children under 13. If you are a parent or guardian and believe your child has provided us with personal information, please contact us.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-xl font-semibold text-gray-800 mb-4">8. Changes to This Policy</h2>
            <p className="text-gray-600 mb-4">
              We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "Last updated" date.
            </p>
          </section>

          <section className="mb-8">
            <h2 className="text-xl font-semibold text-gray-800 mb-4">9. Contact Us</h2>
            <p className="text-gray-600 mb-4">
              If you have questions about this Privacy Policy, please contact us at:
            </p>
            <p className="text-gray-600">
              Email: <a href="mailto:privacy@aureahealth.app" className="text-teal-600 hover:underline">privacy@aureahealth.app</a>
            </p>
          </section>
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
