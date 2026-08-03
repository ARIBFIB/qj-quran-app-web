import type { Metadata } from "next";
import { SUPPORT_EMAIL } from "@/data/versions";

export const metadata: Metadata = {
  title: "Contact & Support â€” QJ Quran App",
  description: "Get in touch with the QJ Quran App team for support, feedback, or questions.",
};

const FAQS = [
  {
    q: "The app isn't opening on my device.",
    a: "Make sure you're running the latest version from the Download Center, and that your device meets the minimum Android version required. Reinstalling the latest APK usually resolves this.",
  },
  {
    q: "How do I download Quran content for offline use?",
    a: "Open the app, go to Settings > Offline Content, and download the sections you'd like to access without an internet connection.",
  },
  {
    q: "Can I use an older version of the app?",
    a: "Yes â€” visit the Download Center page to find and download any previous release.",
  },
];

export default function ContactPage() {
  return (
    <section className="bg-cream py-16">
      <div className="mx-auto max-w-[760px] px-4 sm:px-6">
        <h1 className="font-heading text-navy text-3xl font-bold text-center mb-3">
          Contact &amp; Support
        </h1>
        <p className="text-text-body text-center mb-10">
          Have a question or ran into an issue? We&apos;re happy to help.
        </p>

        <div className="bg-white border border-sage rounded-[14px] p-6 md:p-8 mb-10">
          <p className="text-navy font-semibold text-sm mb-1">Email us directly</p>
          <a href={`mailto:${SUPPORT_EMAIL}`} className="text-brown hover:underline text-lg font-medium break-all">
            {SUPPORT_EMAIL}
          </a>
          <p className="text-text-muted text-sm mt-4">
            [TODO: optional contact form can be added here later â€” Name, Email, Message â€” sending to
            the support email above.]
          </p>
        </div>

        <h2 className="font-heading text-navy text-xl font-semibold mb-5">Frequently Asked Questions</h2>
        <div className="space-y-4">
          {FAQS.map((f) => (
            <div key={f.q} className="bg-white border border-sage rounded-[14px] p-5">
              <p className="text-navy font-semibold text-sm mb-1">{f.q}</p>
              <p className="text-text-body text-sm">{f.a}</p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
