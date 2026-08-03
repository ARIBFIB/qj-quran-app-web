import type { Metadata } from "next";
import Button from "@/components/Button";
import { PLAY_STORE_URL, LIVE_WEB_URL } from "@/data/versions";

export const metadata: Metadata = {
  title: "Features â€” QJ Quran App",
  description: "Explore every feature of the QJ Quran App: reading, audio recitation, translations, bookmarks, offline mode and more.",
};

const FEATURES = [
  { title: "Full Quran Text", desc: "Clean Arabic text (Uthmani script) with adjustable font size, line spacing, and night mode for comfortable reading at any time of day.", icon: "ðŸ“–" },
  { title: "Audio Recitation", desc: "Listen to renowned reciters verse by verse, with synced highlighting so you can follow along while listening.", icon: "ðŸŽ§" },
  { title: "Multiple Translations", desc: "Read alongside translations in several languages, switchable at any time, to better understand the meaning of each verse.", icon: "ðŸŒ" },
  { title: "Bookmarks", desc: "Save your place on any verse or surah and jump straight back to it next time you open the app.", icon: "ðŸ”–" },
  { title: "Offline Mode", desc: "Download content once and keep reading and listening even without an internet connection.", icon: "ðŸ“´" },
  { title: "Daily Reminders", desc: "Gentle notifications to help you build a consistent daily reading habit.", icon: "â°" },
  { title: "Search", desc: "Quickly search for any surah, verse, or keyword across the entire Quran.", icon: "ðŸ”" },
  { title: "Tafsir (Commentary)", desc: "Access scholarly commentary for deeper understanding of selected verses.", icon: "ðŸ“" },
];

export default function FeaturesPage() {
  return (
    <section className="bg-cream">
      <div className="mx-auto max-w-[1140px] px-4 sm:px-6 py-16">
        <h1 className="font-heading text-navy text-3xl md:text-4xl font-bold text-center mb-3">
          Why QJ Quran
        </h1>
        <p className="text-text-body text-center max-w-xl mx-auto mb-12">
          Everything you need for a calm, focused, and consistent Quran reading experience â€”
          designed to be simple and distraction-free.
        </p>

        <div className="grid sm:grid-cols-2 md:grid-cols-3 gap-6">
          {FEATURES.map((f) => (
            <div
              key={f.title}
              className="bg-white border border-sage rounded-[14px] p-6 hover:shadow-[0_6px_20px_rgba(10,41,71,0.14)] transition-shadow duration-200"
            >
              <div className="h-11 w-11 rounded-full bg-brown/10 flex items-center justify-center text-xl mb-4">
                {f.icon}
              </div>
              <h3 className="text-navy font-semibold text-base mb-1">{f.title}</h3>
              <p className="text-text-body text-sm">{f.desc}</p>
            </div>
          ))}
        </div>

        <div className="text-center mt-14">
          <div className="flex flex-wrap gap-4 justify-center">
            <Button href={PLAY_STORE_URL} variant="primary" external>
              Download Now
            </Button>
            <Button href={LIVE_WEB_URL} variant="outline" external>
              View Online
            </Button>
          </div>
        </div>
      </div>
    </section>
  );
}
