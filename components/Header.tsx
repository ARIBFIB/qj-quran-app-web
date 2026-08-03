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
