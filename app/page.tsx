import Image from "next/image";
import Link from "next/link";
import Button from "@/components/Button";
import { LATEST_VERSION, LIVE_WEB_URL, PLAY_STORE_URL } from "@/data/versions";

const FEATURES = [
  {
    title: "Full Quran Text",
    desc: "Clean, easy-to-read Arabic text with adjustable font size for comfortable reading.",
    icon: "ðŸ“–",
  },
  {
    title: "Audio Recitation",
    desc: "Listen to beautiful recitations from renowned reciters, verse by verse.",
    icon: "ðŸŽ§",
  },
  {
    title: "Translations",
    desc: "Read alongside translations in multiple languages to understand the meaning.",
    icon: "ðŸŒ",
  },
  {
    title: "Bookmarks & Offline Mode",
    desc: "Save your place and keep reading even without an internet connection.",
    icon: "ðŸ”–",
  },
];

const SCREENSHOT_PLACEHOLDERS = [
  "/screenshots/screenshot-1.png",
  "/screenshots/screenshot-2.png",
  "/screenshots/screenshot-3.png",
  "/screenshots/screenshot-4.png",
];

export default function HomePage() {
  return (
    <>
      {/* HERO */}
      <section className="islamic-pattern relative overflow-hidden">
        <div className="mx-auto max-w-[1140px] px-4 sm:px-6 py-16 md:py-24 grid md:grid-cols-2 gap-12 items-center">
          <div>
            <h1 className="font-heading text-navy text-4xl md:text-5xl font-bold leading-tight mb-4">
              Read, Listen & Reflect on the Holy Quran
            </h1>
            <p className="text-text-body text-base md:text-lg mb-8 max-w-md">
              QJ Quran App brings the Quran to your pocket â€” clean reading experience, audio
              recitation, translations, and offline access, completely free.
            </p>
            <div className="flex flex-wrap gap-4">
              <Button href={PLAY_STORE_URL} variant="primary" external>
                Get it on Play Store
              </Button>
              <Button href={LIVE_WEB_URL} variant="outline" external>
                View Online
              </Button>
            </div>
            <p className="text-text-muted text-sm mt-4">
              Looking for an older release?{" "}
              <Link href="/downloads" className="text-brown font-medium hover:underline">
                Browse previous versions â†’
              </Link>
            </p>
          </div>

          <div className="flex justify-center">
            <div className="relative w-[240px] h-[500px] rounded-[24px] shadow-[0_8px_24px_rgba(10,41,71,0.12)] bg-card border border-sage overflow-hidden">
              <Image
                src={SCREENSHOT_PLACEHOLDERS[0]}
                alt="QJ Quran App screenshot"
                fill
                sizes="240px"
                className="object-cover"
              />
            </div>
          </div>
        </div>
      </section>

      {/* LATEST VERSION STRIP */}
      <section className="bg-navy">
        <div className="mx-auto max-w-[1140px] px-4 sm:px-6 py-5 flex flex-col sm:flex-row items-center justify-between gap-4">
          <p className="text-cream text-sm">
            Latest version: <span className="font-semibold">{LATEST_VERSION.label}</span>
            {LATEST_VERSION.releaseDate !== "TBD" && ` â€” released ${LATEST_VERSION.releaseDate}`}
          </p>
          <Button href={LATEST_VERSION.apkUrl} variant="accent">
            Download Latest APK
          </Button>
        </div>
      </section>

      {/* FEATURES PREVIEW */}
      <section className="bg-cream">
        <div className="mx-auto max-w-[1140px] px-4 sm:px-6 py-16">
          <h2 className="font-heading text-navy text-2xl md:text-3xl font-semibold text-center mb-10">
            Why QJ Quran
          </h2>
          <div className="grid sm:grid-cols-2 md:grid-cols-4 gap-5">
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
          <div className="text-center mt-8">
            <Link href="/features" className="text-brown font-medium hover:underline text-sm">
              See all features â†’
            </Link>
          </div>
        </div>
      </section>

      {/* SCREENSHOTS PREVIEW */}
      <section className="bg-sage">
        <div className="mx-auto max-w-[1140px] px-4 sm:px-6 py-16">
          <h2 className="font-heading text-navy text-2xl md:text-3xl font-semibold text-center mb-10">
            App Screenshots
          </h2>
          <div className="flex gap-5 overflow-x-auto pb-2 md:grid md:grid-cols-4 md:overflow-visible">
            {SCREENSHOT_PLACEHOLDERS.map((src, i) => (
              <div
                key={src}
                className="min-w-[160px] md:min-w-0 bg-card rounded-[16px] p-3 border border-sage-strong shadow-[0_4px_16px_rgba(10,41,71,0.10)]"
              >
                <div className="relative w-full aspect-[9/19.5] rounded-[10px] overflow-hidden bg-sage">
                  <Image
                    src={src}
                    alt={`QJ Quran App screenshot ${i + 1}`}
                    fill
                    sizes="200px"
                    className="object-cover"
                  />
                </div>
              </div>
            ))}
          </div>
          <div className="text-center mt-8">
            <Link href="/screenshots" className="text-brown font-medium hover:underline text-sm">
              See all screenshots â†’
            </Link>
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="bg-cream">
        <div className="mx-auto max-w-[1140px] px-4 sm:px-6 py-16 text-center">
          <h2 className="font-heading text-navy text-2xl md:text-3xl font-semibold mb-4">
            Start reading today
          </h2>
          <p className="text-text-body mb-8 max-w-lg mx-auto">
            Download QJ Quran App for free, or try it right in your browser before installing.
          </p>
          <div className="flex flex-wrap gap-4 justify-center">
            <Button href={PLAY_STORE_URL} variant="primary" external>
              Get it on Play Store
            </Button>
            <Button href={LIVE_WEB_URL} variant="outline" external>
              View Online
            </Button>
          </div>
        </div>
      </section>
    </>
  );
}
