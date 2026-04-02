export const siteConfig = {
  name: "eSchool",
  description: "Sistem Manajemen Sekolah - Platform digital untuk mengelola administrasi sekolah secara efisien",
  url: process.env.NEXT_PUBLIC_APP_URL || "http://localhost:3000",
  ogImage: "/og.png",
  creator: "eSchool Team",
  keywords: [
    "sekolah",
    "manajemen sekolah",
    "sistem informasi sekolah",
    "e-school",
    "administrasi sekolah",
  ],
} as const;
