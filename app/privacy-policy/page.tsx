import type { Metadata } from "next";
import { SUPPORT_EMAIL } from "@/data/versions";

export const metadata: Metadata = {
  title: "Privacy Policy â€” QJ Quran App",
  description: "The Privacy Policy for QJ Quran App, describing what data we collect and how it is used.",
};

export default function PrivacyPolicyPage() {
  return (
    <section className="bg-cream py-16">
      <div className="mx-auto max-w-[760px] px-4 sm:px-6">
        <div className="bg-white border border-sage rounded-[14px] p-6 md:p-8">
          <h1 className="font-heading text-navy text-3xl font-bold mb-1 relative inline-block">
            Privacy Policy
            <span className="block h-[3px] w-[60px] bg-brown mt-2 rounded-full" />
          </h1>
          <p className="text-text-muted text-sm italic mt-4 mb-8">
            Last updated: [TODO â€” add date]
          </p>

          <div className="space-y-8 text-text-body text-[15px] leading-[1.7]">
            <p>
              This Privacy Policy explains how QJ Quran App (&quot;we&quot;, &quot;our&quot;, &quot;the
              App&quot;) collects, uses, and protects information when you use our mobile application
              and this website.
            </p>

            <div>
              <h2 className="font-heading text-navy text-lg md:text-xl font-semibold mb-2">
                Information We Collect
              </h2>
              <p>
                [TODO â€” list actual data collected, e.g. device information, app usage analytics,
                crash reports, bookmarks stored locally, optional account information, etc.]
              </p>
              <ul className="list-none mt-3 space-y-2">
                {[
                  "Device information (model, OS version) for compatibility and crash reporting",
                  "App usage data (e.g. screens visited) to improve the app experience",
                  "Any information you voluntarily provide via the Contact form",
                ].map((item) => (
                  <li key={item} className="pl-5 relative">
                    <span className="absolute left-0 top-[7px] h-[6px] w-[6px] bg-brown rounded-sm rotate-45" />
                    {item}
                  </li>
                ))}
              </ul>
            </div>

            <div>
              <h2 className="font-heading text-navy text-lg md:text-xl font-semibold mb-2">
                How We Use Your Data
              </h2>
              <p>
                We use collected information to operate, maintain, and improve QJ Quran App, to
                respond to support requests, and to understand how the app is used so we can make it
                better. We do not sell your personal data to third parties.
              </p>
            </div>

            <div>
              <h2 className="font-heading text-navy text-lg md:text-xl font-semibold mb-2">
                Third-Party Services
              </h2>
              <p>
                [TODO â€” list any third-party SDKs used, e.g. Firebase Analytics, Crashlytics, ad
                networks, and link to their respective privacy policies if applicable.]
              </p>
            </div>

            <div>
              <h2 className="font-heading text-navy text-lg md:text-xl font-semibold mb-2">
                Data Storage &amp; Security
              </h2>
              <p>
                [TODO â€” describe how data is stored/secured, e.g. local on-device storage for
                bookmarks/offline content, encrypted transmission for any network requests.]
              </p>
            </div>

            <div>
              <h2 className="font-heading text-navy text-lg md:text-xl font-semibold mb-2">
                Children&apos;s Privacy
              </h2>
              <p>
                QJ Quran App does not knowingly collect personal information from children under 13.
                If you believe a child has provided us with personal information, please contact us
                so we can remove it.
              </p>
            </div>

            <div>
              <h2 className="font-heading text-navy text-lg md:text-xl font-semibold mb-2">
                Changes to This Policy
              </h2>
              <p>
                We may update this Privacy Policy from time to time. Changes will be posted on this
                page with an updated &quot;Last updated&quot; date.
              </p>
            </div>

            <div>
              <h2 className="font-heading text-navy text-lg md:text-xl font-semibold mb-2">
                Contact Us
              </h2>
              <p>
                If you have any questions about this Privacy Policy, please contact us at:
              </p>
            </div>
          </div>

          <div className="bg-sage rounded-[10px] p-4 mt-8">
            <p className="text-navy font-semibold text-sm">Support Email</p>
            <a href={`mailto:${SUPPORT_EMAIL}`} className="text-brown hover:underline text-sm break-all">
              {SUPPORT_EMAIL}
            </a>
          </div>
        </div>
      </div>
    </section>
  );
}
