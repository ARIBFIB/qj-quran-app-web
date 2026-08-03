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
