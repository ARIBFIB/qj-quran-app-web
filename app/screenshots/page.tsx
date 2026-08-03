import type { Metadata } from "next";
import Image from "next/image";

export const metadata: Metadata = {
  title: "Screenshots â€” QJ Quran App",
  description: "Browse screenshots of the QJ Quran App interface â€” reading view, audio player, translations and more.",
};

// TODO: replace these placeholder files in /public/screenshots/ with real exports.
const SCREENSHOTS = [
  "/screenshots/screenshot-1.png",
  "/screenshots/screenshot-2.png",
  "/screenshots/screenshot-3.png",
  "/screenshots/screenshot-4.png",
  "/screenshots/screenshot-5.png",
  "/screenshots/screenshot-6.png",
];

export default function ScreenshotsPage() {
  return (
    <section className="bg-sage">
      <div className="mx-auto max-w-[1140px] px-4 sm:px-6 py-16">
        <h1 className="font-heading text-navy text-3xl md:text-4xl font-bold text-center mb-3">
          App Screenshots
        </h1>
        <p className="text-text-body text-center max-w-xl mx-auto mb-12">
          A closer look at the QJ Quran App experience.
        </p>

        <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-6">
          {SCREENSHOTS.map((src, i) => (
            <div
              key={src}
              className="bg-card rounded-[16px] p-3 border border-sage-strong shadow-[0_4px_16px_rgba(10,41,71,0.10)]"
            >
              <div className="relative w-full aspect-[9/19.5] rounded-[10px] overflow-hidden bg-sage">
                <Image
                  src={src}
                  alt={`QJ Quran App screenshot ${i + 1}`}
                  fill
                  sizes="240px"
                  className="object-cover"
                />
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
