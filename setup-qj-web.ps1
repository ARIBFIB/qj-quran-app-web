<#
  QJ Quran App - Website Scaffold Script
  ---------------------------------------
  Run this INSIDE the folder where you want the project created
  (e.g. D:\Rozmarrah-CUST\Najeeb Islamic Quran App\Quran App\Code\Website\qj_web)

  Usage:
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
    .\setup-qj-web.ps1
#>

$ErrorActionPreference = "Stop"
$root = Get-Location
Write-Host "Scaffolding QJ Quran App website in: $root" -ForegroundColor Cyan

# --- Create folder structure ---
New-Item -ItemType Directory -Force -Path (Join-Path $root "app\features") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $root "app\screenshots") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $root "app\downloads") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $root "app\privacy-policy") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $root "app\contact") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $root "components") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $root "data") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $root "public\screenshots") | Out-Null

# --- Write files ---
Write-Host "Writing app/globals.css" -ForegroundColor DarkGray
$content = @'
@import url("https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Lora:wght@500;600;700&display=swap");
@import "tailwindcss";

:root {
  --navy: #0A2947;
  --navy-dark: #071D33;
  --cream: #F3E4C9;
  --card: #FBF6EA;
  --sage: #D3D4C0;
  --sage-strong: #C7C8B2;
  --brown: #8B5E3C;
  --brown-dark: #74492E;
  --text-body: #33342A;
  --text-muted: #6B6C5C;
}

@theme inline {
  --color-navy: var(--navy);
  --color-navy-dark: var(--navy-dark);
  --color-cream: var(--cream);
  --color-card: var(--card);
  --color-sage: var(--sage);
  --color-sage-strong: var(--sage-strong);
  --color-brown: var(--brown);
  --color-brown-dark: var(--brown-dark);
  --color-text-body: var(--text-body);
  --color-text-muted: var(--text-muted);
  --font-heading: "Lora", Georgia, serif;
  --font-body: "Inter", system-ui, sans-serif;
}

body {
  background: var(--cream);
  color: var(--text-body);
  font-family: var(--font-body);
}

h1, h2, h3, .font-heading {
  font-family: var(--font-heading);
}

.islamic-pattern {
  background-image: radial-gradient(circle at 1px 1px, rgba(10,41,71,0.06) 1px, transparent 1px);
  background-size: 22px 22px;
}

'@
Set-Content -Path (Join-Path $root "app\globals.css") -Value $content -Encoding utf8 -NoNewline

Write-Host "Writing app/layout.tsx" -ForegroundColor DarkGray
$content = @'
import type { Metadata } from "next";
import "./globals.css";
import Header from "@/components/Header";
import Footer from "@/components/Footer";

export const metadata: Metadata = {
  title: "QJ Quran App — Read, Listen & Reflect on the Holy Quran",
  description:
    "QJ Quran App official website. Download the latest version, browse previous releases, view the app online, and read our Privacy Policy.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className="antialiased">
        <Header />
        <main>{children}</main>
        <Footer />
      </body>
    </html>
  );
}

'@
Set-Content -Path (Join-Path $root "app\layout.tsx") -Value $content -Encoding utf8 -NoNewline

Write-Host "Writing app/page.tsx" -ForegroundColor DarkGray
$content = @'
import Image from "next/image";
import Link from "next/link";
import Button from "@/components/Button";
import { LATEST_VERSION, LIVE_WEB_URL, PLAY_STORE_URL } from "@/data/versions";

const FEATURES = [
  {
    title: "Full Quran Text",
    desc: "Clean, easy-to-read Arabic text with adjustable font size for comfortable reading.",
    icon: "📖",
  },
  {
    title: "Audio Recitation",
    desc: "Listen to beautiful recitations from renowned reciters, verse by verse.",
    icon: "🎧",
  },
  {
    title: "Translations",
    desc: "Read alongside translations in multiple languages to understand the meaning.",
    icon: "🌐",
  },
  {
    title: "Bookmarks & Offline Mode",
    desc: "Save your place and keep reading even without an internet connection.",
    icon: "🔖",
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
              QJ Quran App brings the Quran to your pocket — clean reading experience, audio
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
                Browse previous versions →
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
            {LATEST_VERSION.releaseDate !== "TBD" && ` — released ${LATEST_VERSION.releaseDate}`}
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
              See all features →
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
              See all screenshots →
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

'@
Set-Content -Path (Join-Path $root "app\page.tsx") -Value $content -Encoding utf8 -NoNewline

Write-Host "Writing app/features/page.tsx" -ForegroundColor DarkGray
$content = @'
import type { Metadata } from "next";
import Button from "@/components/Button";
import { PLAY_STORE_URL, LIVE_WEB_URL } from "@/data/versions";

export const metadata: Metadata = {
  title: "Features — QJ Quran App",
  description: "Explore every feature of the QJ Quran App: reading, audio recitation, translations, bookmarks, offline mode and more.",
};

const FEATURES = [
  { title: "Full Quran Text", desc: "Clean Arabic text (Uthmani script) with adjustable font size, line spacing, and night mode for comfortable reading at any time of day.", icon: "📖" },
  { title: "Audio Recitation", desc: "Listen to renowned reciters verse by verse, with synced highlighting so you can follow along while listening.", icon: "🎧" },
  { title: "Multiple Translations", desc: "Read alongside translations in several languages, switchable at any time, to better understand the meaning of each verse.", icon: "🌐" },
  { title: "Bookmarks", desc: "Save your place on any verse or surah and jump straight back to it next time you open the app.", icon: "🔖" },
  { title: "Offline Mode", desc: "Download content once and keep reading and listening even without an internet connection.", icon: "📴" },
  { title: "Daily Reminders", desc: "Gentle notifications to help you build a consistent daily reading habit.", icon: "⏰" },
  { title: "Search", desc: "Quickly search for any surah, verse, or keyword across the entire Quran.", icon: "🔍" },
  { title: "Tafsir (Commentary)", desc: "Access scholarly commentary for deeper understanding of selected verses.", icon: "📝" },
];

export default function FeaturesPage() {
  return (
    <section className="bg-cream">
      <div className="mx-auto max-w-[1140px] px-4 sm:px-6 py-16">
        <h1 className="font-heading text-navy text-3xl md:text-4xl font-bold text-center mb-3">
          Why QJ Quran
        </h1>
        <p className="text-text-body text-center max-w-xl mx-auto mb-12">
          Everything you need for a calm, focused, and consistent Quran reading experience —
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

'@
Set-Content -Path (Join-Path $root "app\features\page.tsx") -Value $content -Encoding utf8 -NoNewline

Write-Host "Writing app/screenshots/page.tsx" -ForegroundColor DarkGray
$content = @'
import type { Metadata } from "next";
import Image from "next/image";

export const metadata: Metadata = {
  title: "Screenshots — QJ Quran App",
  description: "Browse screenshots of the QJ Quran App interface — reading view, audio player, translations and more.",
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

'@
Set-Content -Path (Join-Path $root "app\screenshots\page.tsx") -Value $content -Encoding utf8 -NoNewline

Write-Host "Writing app/downloads/page.tsx" -ForegroundColor DarkGray
$content = @'
import type { Metadata } from "next";
import Button from "@/components/Button";
import { VERSIONS, LATEST_VERSION } from "@/data/versions";

export const metadata: Metadata = {
  title: "Download Center — QJ Quran App",
  description: "Download the latest QJ Quran App APK, browse previous versions, or view any release online in your browser.",
};

export default function DownloadsPage() {
  const previousVersions = VERSIONS.filter((v) => !v.isLatest);

  return (
    <section className="bg-cream">
      <div className="mx-auto max-w-[1140px] px-4 sm:px-6 py-16">
        <h1 className="font-heading text-navy text-3xl md:text-4xl font-bold text-center mb-3">
          Download Center
        </h1>
        <p className="text-text-body text-center max-w-xl mx-auto mb-10">
          Get the latest version of QJ Quran App, or find and try any previous release below —
          either as an APK download or an instant online preview.
        </p>

        {/* Latest version highlight card */}
        <div className="bg-white border border-sage rounded-[16px] p-6 md:p-8 mb-12 flex flex-col md:flex-row items-center justify-between gap-6 shadow-[0_6px_20px_rgba(10,41,71,0.14)]">
          <div>
            <p className="text-brown text-xs font-semibold uppercase tracking-wide mb-1">Latest Version</p>
            <h2 className="text-navy text-xl md:text-2xl font-heading font-bold">{LATEST_VERSION.label}</h2>
            <p className="text-text-muted text-sm mt-1">
              {LATEST_VERSION.releaseDate !== "TBD" ? `Released ${LATEST_VERSION.releaseDate}` : "Release date coming soon"}
              {LATEST_VERSION.size !== "TBD" && ` · ${LATEST_VERSION.size}`}
            </p>
          </div>
          <div className="flex flex-wrap gap-3">
            <Button href={LATEST_VERSION.apkUrl} variant="primary">
              Download APK
            </Button>
            {LATEST_VERSION.onlineViewUrl && (
              <Button href={LATEST_VERSION.onlineViewUrl} variant="outline" external>
                View Online
              </Button>
            )}
          </div>
        </div>

        {/* Previous versions table */}
        <h2 className="font-heading text-navy text-xl md:text-2xl font-semibold mb-5">
          Previous Versions
        </h2>

        <div className="overflow-x-auto rounded-[14px] border border-sage">
          <table className="w-full text-sm bg-white">
            <thead>
              <tr className="bg-navy text-cream text-left">
                <th className="px-4 py-3 font-semibold">Version</th>
                <th className="px-4 py-3 font-semibold">Release Date</th>
                <th className="px-4 py-3 font-semibold">Size</th>
                <th className="px-4 py-3 font-semibold">Download</th>
                <th className="px-4 py-3 font-semibold">Online View</th>
                <th className="px-4 py-3 font-semibold">Notes</th>
              </tr>
            </thead>
            <tbody>
              {previousVersions.map((v, i) => (
                <tr
                  key={v.version}
                  className={i % 2 === 0 ? "bg-white" : "bg-cream"}
                >
                  <td className="px-4 py-3 font-medium text-navy border-t border-sage">{v.label}</td>
                  <td className="px-4 py-3 border-t border-sage">{v.releaseDate}</td>
                  <td className="px-4 py-3 border-t border-sage">{v.size}</td>
                  <td className="px-4 py-3 border-t border-sage">
                    <a href={v.apkUrl} className="text-brown font-medium hover:underline">
                      Download
                    </a>
                  </td>
                  <td className="px-4 py-3 border-t border-sage">
                    {v.onlineViewUrl ? (
                      <a
                        href={v.onlineViewUrl}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="text-brown font-medium hover:underline"
                      >
                        View Online
                      </a>
                    ) : (
                      <span className="text-text-muted">Not available</span>
                    )}
                  </td>
                  <td className="px-4 py-3 border-t border-sage text-text-muted">{v.notes}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>

        <p className="text-text-muted text-xs mt-4">
          Version names, dates, and file sizes above are placeholders — edit{" "}
          <code className="bg-sage/60 px-1 rounded">data/versions.ts</code> to plug in real values
          and APK files.
        </p>
      </div>
    </section>
  );
}

'@
Set-Content -Path (Join-Path $root "app\downloads\page.tsx") -Value $content -Encoding utf8 -NoNewline

Write-Host "Writing app/privacy-policy/page.tsx" -ForegroundColor DarkGray
$content = @'
import type { Metadata } from "next";
import { SUPPORT_EMAIL } from "@/data/versions";

export const metadata: Metadata = {
  title: "Privacy Policy — QJ Quran App",
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
            Last updated: [TODO — add date]
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
                [TODO — list actual data collected, e.g. device information, app usage analytics,
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
                [TODO — list any third-party SDKs used, e.g. Firebase Analytics, Crashlytics, ad
                networks, and link to their respective privacy policies if applicable.]
              </p>
            </div>

            <div>
              <h2 className="font-heading text-navy text-lg md:text-xl font-semibold mb-2">
                Data Storage &amp; Security
              </h2>
              <p>
                [TODO — describe how data is stored/secured, e.g. local on-device storage for
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

'@
Set-Content -Path (Join-Path $root "app\privacy-policy\page.tsx") -Value $content -Encoding utf8 -NoNewline

Write-Host "Writing app/contact/page.tsx" -ForegroundColor DarkGray
$content = @'
import type { Metadata } from "next";
import { SUPPORT_EMAIL } from "@/data/versions";

export const metadata: Metadata = {
  title: "Contact & Support — QJ Quran App",
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
    a: "Yes — visit the Download Center page to find and download any previous release.",
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
            [TODO: optional contact form can be added here later — Name, Email, Message — sending to
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

'@
Set-Content -Path (Join-Path $root "app\contact\page.tsx") -Value $content -Encoding utf8 -NoNewline

Write-Host "Writing components/Button.tsx" -ForegroundColor DarkGray
$content = @'
import Link from "next/link";
import { ReactNode } from "react";

type Variant = "primary" | "accent" | "outline";

interface ButtonProps {
  href: string;
  children: ReactNode;
  variant?: Variant;
  external?: boolean;
  className?: string;
}

const base =
  "inline-flex items-center justify-center gap-2 h-11 px-5 rounded-[10px] text-[15px] font-semibold transition-all duration-200";

const variants: Record<Variant, string> = {
  primary: "bg-navy text-cream hover:bg-navy-dark",
  accent: "bg-brown text-cream hover:bg-brown-dark hover:shadow-[0_4px_12px_rgba(139,94,60,0.25)]",
  outline: "border-[1.5px] border-brown text-brown bg-transparent hover:bg-brown/10",
};

export default function Button({
  href,
  children,
  variant = "primary",
  external = false,
  className = "",
}: ButtonProps) {
  const classes = `${base} ${variants[variant]} ${className}`;

  if (external) {
    return (
      <a href={href} target="_blank" rel="noopener noreferrer" className={classes}>
        {children}
      </a>
    );
  }

  return (
    <Link href={href} className={classes}>
      {children}
    </Link>
  );
}

'@
Set-Content -Path (Join-Path $root "components\Button.tsx") -Value $content -Encoding utf8 -NoNewline

Write-Host "Writing components/Header.tsx" -ForegroundColor DarkGray
$content = @'
"use client";

import Link from "next/link";
import { useState } from "react";
import Button from "./Button";
import { LATEST_VERSION } from "@/data/versions";

const NAV_LINKS = [
  { label: "Home", href: "/" },
  { label: "Features", href: "/features" },
  { label: "Screenshots", href: "/screenshots" },
  { label: "Downloads", href: "/downloads" },
  { label: "Privacy Policy", href: "/privacy-policy" },
  { label: "Contact", href: "/contact" },
];

export default function Header() {
  const [open, setOpen] = useState(false);

  return (
    <header className="sticky top-0 z-50 bg-navy">
      <div className="mx-auto max-w-[1140px] px-4 sm:px-6 h-[60px] md:h-[72px] flex items-center justify-between">
        <Link href="/" className="flex items-center gap-2 text-cream font-heading text-lg md:text-xl font-bold">
          <span className="inline-flex h-8 w-8 items-center justify-center rounded-full bg-brown text-cream text-sm">
            QJ
          </span>
          QJ Quran App
        </Link>

        <nav className="hidden md:flex items-center gap-7">
          {NAV_LINKS.map((link) => (
            <Link
              key={link.href}
              href={link.href}
              className="text-sage hover:text-cream text-sm font-medium transition-colors duration-200 border-b-2 border-transparent hover:border-brown pb-1"
            >
              {link.label}
            </Link>
          ))}
        </nav>

        <div className="hidden md:block">
          <Button href={LATEST_VERSION.apkUrl} variant="accent">
            Download App
          </Button>
        </div>

        <button
          aria-label="Toggle menu"
          className="md:hidden text-cream"
          onClick={() => setOpen((v) => !v)}
        >
          <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
            {open ? (
              <path d="M6 6l12 12M18 6L6 18" strokeLinecap="round" />
            ) : (
              <path d="M4 7h16M4 12h16M4 17h16" strokeLinecap="round" />
            )}
          </svg>
        </button>
      </div>

      {open && (
        <div className="md:hidden bg-navy border-t border-cream/10 px-4 py-4 flex flex-col gap-4">
          {NAV_LINKS.map((link) => (
            <Link
              key={link.href}
              href={link.href}
              onClick={() => setOpen(false)}
              className="text-sage hover:text-cream text-sm font-medium"
            >
              {link.label}
            </Link>
          ))}
          <Button href={LATEST_VERSION.apkUrl} variant="accent" className="w-full">
            Download App
          </Button>
        </div>
      )}
    </header>
  );
}

'@
Set-Content -Path (Join-Path $root "components\Header.tsx") -Value $content -Encoding utf8 -NoNewline

Write-Host "Writing components/Footer.tsx" -ForegroundColor DarkGray
$content = @'
import Link from "next/link";
import { SUPPORT_EMAIL } from "@/data/versions";

export default function Footer() {
  return (
    <footer className="bg-navy text-sage">
      <div className="mx-auto max-w-[1140px] px-4 sm:px-6 py-12 grid grid-cols-1 md:grid-cols-4 gap-10">
        <div>
          <p className="font-heading text-cream text-lg font-bold mb-3">QJ Quran App</p>
          <p className="text-sm leading-relaxed">
            A simple, distraction-free way to read, listen, and reflect on the Holy Quran — anywhere,
            anytime.
          </p>
        </div>

        <div>
          <h4 className="text-cream font-semibold mb-3 text-sm">Quick Links</h4>
          <ul className="space-y-2 text-sm">
            <li><Link href="/" className="hover:text-cream">Home</Link></li>
            <li><Link href="/features" className="hover:text-cream">Features</Link></li>
            <li><Link href="/screenshots" className="hover:text-cream">Screenshots</Link></li>
            <li><Link href="/downloads" className="hover:text-cream">Downloads</Link></li>
          </ul>
        </div>

        <div>
          <h4 className="text-cream font-semibold mb-3 text-sm">Legal</h4>
          <ul className="space-y-2 text-sm">
            <li><Link href="/privacy-policy" className="hover:text-cream">Privacy Policy</Link></li>
            <li><Link href="/contact" className="hover:text-cream">Contact / Support</Link></li>
          </ul>
        </div>

        <div>
          <h4 className="text-cream font-semibold mb-3 text-sm">Contact</h4>
          <p className="text-sm">
            <a href={`mailto:${SUPPORT_EMAIL}`} className="hover:text-cream break-all">
              {SUPPORT_EMAIL}
            </a>
          </p>
        </div>
      </div>

      <div className="border-t border-cream/15">
        <p className="text-center text-xs py-4 text-sage">
          © {new Date().getFullYear()} QJ Quran App. All rights reserved.
        </p>
      </div>
    </footer>
  );
}

'@
Set-Content -Path (Join-Path $root "components\Footer.tsx") -Value $content -Encoding utf8 -NoNewline

Write-Host "Writing data/versions.ts" -ForegroundColor DarkGray
$content = @'
// ---------------------------------------------------------------------------
// EDIT THIS FILE to plug in real APK links, version numbers, and dates.
// This is the ONLY file you need to touch to update Downloads/Home version info.
// ---------------------------------------------------------------------------

export const SUPPORT_EMAIL = "support@qjquranapp.com"; // TODO: replace with real support email
export const PLAY_STORE_URL = "https://play.google.com/store/apps/details?id=com.qj.quranapp"; // TODO: replace with real Play Store link
export const LIVE_WEB_URL = "https://qj-quran-app.web.app/"; // latest version, online view

export interface AppVersion {
  version: string; // e.g. "v1.1.0"
  label: string; // display label, e.g. "v1.1.0 (Build 14)"
  releaseDate: string; // e.g. "2026-05-10"
  size: string; // e.g. "24 MB"
  apkUrl: string; // direct APK download link
  onlineViewUrl: string | null; // hosted web build for this version, or null if discontinued
  notes: string;
  isLatest?: boolean;
}

// TODO: replace with the real release history from Play Console.
export const VERSIONS: AppVersion[] = [
  {
    version: "v2.0.0",
    label: "v2.0.0 (Latest)",
    releaseDate: "TBD",
    size: "TBD",
    apkUrl: "/downloads/apk/QJ-Quran-App-v2.0.0.apk",
    onlineViewUrl: LIVE_WEB_URL,
    notes: "Current live build.",
    isLatest: true,
  },
  {
    version: "v1.2.0",
    label: "v1.2.0",
    releaseDate: "TBD",
    size: "TBD",
    apkUrl: "/downloads/apk/QJ-Quran-App-v1.2.0.apk",
    onlineViewUrl: `${LIVE_WEB_URL}versions/v1.2.0/`,
    notes: "Previous stable build.",
  },
  {
    version: "v1.1.0",
    label: "v1.1.0",
    releaseDate: "TBD",
    size: "TBD",
    apkUrl: "/downloads/apk/QJ-Quran-App-v1.1.0.apk",
    onlineViewUrl: `${LIVE_WEB_URL}versions/v1.1.0/`,
    notes: "Older build.",
  },
  {
    version: "v1.0.0",
    label: "v1.0.0",
    releaseDate: "TBD",
    size: "TBD",
    apkUrl: "/downloads/apk/QJ-Quran-App-v1.0.0.apk",
    onlineViewUrl: null,
    notes: "First public release. Online view discontinued.",
  },
];

export const LATEST_VERSION = VERSIONS.find((v) => v.isLatest) ?? VERSIONS[0];

'@
Set-Content -Path (Join-Path $root "data\versions.ts") -Value $content -Encoding utf8 -NoNewline

Write-Host "Writing package.json" -ForegroundColor DarkGray
$content = @'
{
  "name": "qj_web",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "eslint"
  },
  "dependencies": {
    "next": "16.2.12",
    "react": "19.2.4",
    "react-dom": "19.2.4"
  },
  "devDependencies": {
    "@tailwindcss/postcss": "^4",
    "@types/node": "^20",
    "@types/react": "^19",
    "@types/react-dom": "^19",
    "eslint": "^9",
    "eslint-config-next": "16.2.12",
    "tailwindcss": "^4",
    "typescript": "^5"
  }
}

'@
Set-Content -Path (Join-Path $root "package.json") -Value $content -Encoding utf8 -NoNewline

Write-Host "Writing next.config.ts" -ForegroundColor DarkGray
$content = @'
import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  /* config options here */
};

export default nextConfig;

'@
Set-Content -Path (Join-Path $root "next.config.ts") -Value $content -Encoding utf8 -NoNewline

Write-Host "Writing tsconfig.json" -ForegroundColor DarkGray
$content = @'
{
  "compilerOptions": {
    "target": "ES2017",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "react-jsx",
    "incremental": true,
    "plugins": [
      {
        "name": "next"
      }
    ],
    "paths": {
      "@/*": ["./*"]
    }
  },
  "include": [
    "next-env.d.ts",
    "**/*.ts",
    "**/*.tsx",
    ".next/types/**/*.ts",
    ".next/dev/types/**/*.ts",
    "**/*.mts"
  ],
  "exclude": ["node_modules"]
}

'@
Set-Content -Path (Join-Path $root "tsconfig.json") -Value $content -Encoding utf8 -NoNewline

Write-Host "Writing postcss.config.mjs" -ForegroundColor DarkGray
$content = @'
const config = {
  plugins: {
    "@tailwindcss/postcss": {},
  },
};

export default config;

'@
Set-Content -Path (Join-Path $root "postcss.config.mjs") -Value $content -Encoding utf8 -NoNewline

Write-Host "Writing eslint.config.mjs" -ForegroundColor DarkGray
$content = @'
import { defineConfig, globalIgnores } from "eslint/config";
import nextVitals from "eslint-config-next/core-web-vitals";
import nextTs from "eslint-config-next/typescript";

const eslintConfig = defineConfig([
  ...nextVitals,
  ...nextTs,
  // Override default ignores of eslint-config-next.
  globalIgnores([
    // Default ignores of eslint-config-next:
    ".next/**",
    "out/**",
    "build/**",
    "next-env.d.ts",
  ]),
]);

export default eslintConfig;

'@
Set-Content -Path (Join-Path $root "eslint.config.mjs") -Value $content -Encoding utf8 -NoNewline

# --- Generate placeholder screenshot images (solid color PNGs) ---
Add-Type -AssemblyName System.Drawing
$colors = @("#0A2947","#8B5E3C","#D3D4C0","#F3E4C9","#0A2947","#8B5E3C")
for ($i = 0; $i -lt $colors.Length; $i++) {
    $bmp = New-Object System.Drawing.Bitmap(1080, 2340)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $c = [System.Drawing.ColorTranslator]::FromHtml($colors[$i])
    $g.Clear($c)
    $font = New-Object System.Drawing.Font("Arial", 48)
    $brush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#F3E4C9"))
    $g.DrawString("QJ Quran`nScreenshot $($i+1)`n(placeholder)", $font, $brush, 80, 1100)
    $path = Join-Path $root ("public\screenshots\screenshot-$($i+1).png")
    $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose(); $bmp.Dispose()
}
Write-Host "Placeholder screenshots created in public\screenshots\ - replace with real exports anytime." -ForegroundColor DarkGray

# --- Install dependencies ---
Write-Host "Installing npm dependencies (this may take a minute)..." -ForegroundColor Cyan
npm install

Write-Host ""
Write-Host "Done! Project scaffolded successfully." -ForegroundColor Green
Write-Host "Next steps:" -ForegroundColor Green
Write-Host "  1. Edit data\versions.ts  -> plug in real APK links, versions, dates, support email, Play Store URL"
Write-Host "  2. Replace files in public\screenshots\ with real screenshots"
Write-Host "  3. Run:  npm run dev   -> open http://localhost:3000"
Write-Host "  4. Run:  npm run build -> production build"