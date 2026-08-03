import Link from "next/link";
import { SUPPORT_EMAIL } from "@/data/versions";

export default function Footer() {
  return (
    <footer className="bg-navy text-sage">
      <div className="mx-auto max-w-[1140px] px-4 sm:px-6 py-12 grid grid-cols-1 md:grid-cols-4 gap-10">
        <div>
          <p className="font-heading text-cream text-lg font-bold mb-3">QJ Quran App</p>
          <p className="text-sm leading-relaxed">
            A simple, distraction-free way to read, listen, and reflect on the Holy Quran â€” anywhere,
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
          Â© {new Date().getFullYear()} QJ Quran App. All rights reserved.
        </p>
      </div>
    </footer>
  );
}
