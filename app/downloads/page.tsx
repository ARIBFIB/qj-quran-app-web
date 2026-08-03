import type { Metadata } from "next";
import Button from "@/components/Button";
import { VERSIONS, LATEST_VERSION } from "@/data/versions";

export const metadata: Metadata = {
  title: "Download Center â€” QJ Quran App",
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
          Get the latest version of QJ Quran App, or find and try any previous release below â€”
          either as an APK download or an instant online preview.
        </p>

        {/* Latest version highlight card */}
        <div className="bg-white border border-sage rounded-[16px] p-6 md:p-8 mb-12 flex flex-col md:flex-row items-center justify-between gap-6 shadow-[0_6px_20px_rgba(10,41,71,0.14)]">
          <div>
            <p className="text-brown text-xs font-semibold uppercase tracking-wide mb-1">Latest Version</p>
            <h2 className="text-navy text-xl md:text-2xl font-heading font-bold">{LATEST_VERSION.label}</h2>
            <p className="text-text-muted text-sm mt-1">
              {LATEST_VERSION.releaseDate !== "TBD" ? `Released ${LATEST_VERSION.releaseDate}` : "Release date coming soon"}
              {LATEST_VERSION.size !== "TBD" && ` Â· ${LATEST_VERSION.size}`}
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
          Version names, dates, and file sizes above are placeholders â€” edit{" "}
          <code className="bg-sage/60 px-1 rounded">data/versions.ts</code> to plug in real values
          and APK files.
        </p>
      </div>
    </section>
  );
}
