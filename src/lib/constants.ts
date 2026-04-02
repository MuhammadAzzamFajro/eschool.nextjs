export const PAGINATION = {
    DEFAULT_PAGE: 1,
    DEFAULT_PAGE_SIZE: 10,
    PAGE_SIZE_OPTIONS: [10, 25, 50, 100],
} as const;

export const STATUS = {
    AKTIF: "aktif",
    NONAKTIF: "nonaktif",
    PENDING: "pending",
    LULUS: "lulus",
    PINDAH: "pindah",
    DIKELUARKAN: "dikeluarkan",
} as const;

export type StatusType = (typeof STATUS)[keyof typeof STATUS];

export const STATUS_LABELS: Record<StatusType, string> = {
    aktif: "Aktif",
    nonaktif: "Nonaktif",
    pending: "Pending",
    lulus: "Lulus",
    pindah: "Pindah",
    dikeluarkan: "Dikeluarkan",
};

export const STATUS_COLORS: Record<StatusType, string> = {
    aktif: "bg-emerald-100 text-emerald-700 dark:bg-emerald-900/30 dark:text-emerald-400",
    nonaktif: "bg-gray-100 text-gray-700 dark:bg-gray-800 dark:text-gray-400",
    pending: "bg-amber-100 text-amber-700 dark:bg-amber-900/30 dark:text-amber-400",
    lulus: "bg-blue-100 text-blue-700 dark:bg-blue-900/30 dark:text-blue-400",
    pindah: "bg-purple-100 text-purple-700 dark:bg-purple-900/30 dark:text-purple-400",
    dikeluarkan: "bg-red-100 text-red-700 dark:bg-red-900/30 dark:text-red-400",
};

export const JENIS_KELAMIN = {
    L: "Laki-laki",
    P: "Perempuan",
} as const;

export const AGAMA = [
    "Islam",
    "Kristen",
    "Katolik",
    "Hindu",
    "Buddha",
    "Konghucu",
] as const;

export const HARI = [
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu",
] as const;

export const IMAGE = {
    MAX_SIZE_MB: 5,
    MAX_SIZE_BYTES: 5 * 1024 * 1024,
    ACCEPTED_TYPES: ["image/jpeg", "image/png", "image/webp"],
    COMPRESS_QUALITY: 0.8,
    MAX_WIDTH: 1920,
    MAX_HEIGHT: 1080,
} as const;
