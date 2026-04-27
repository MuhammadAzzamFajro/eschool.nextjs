export const siteConfig = {
  name: "SIAKAD PLUS",
  description: "Sistem Manajemen Sekolah - Platform digital untuk mengelola administrasi sekolah secara efisien",
  url: process.env.NEXT_PUBLIC_APP_URL || "http://localhost:3000",
  ogImage: "/og.png",
  creator: "SIAKAD PLUS Team",
  keywords: [
    "sekolah",
    "manajemen sekolah",
    "sistem informasi sekolah",
    "e-school",
    "administrasi sekolah",
  ],
} as const;
