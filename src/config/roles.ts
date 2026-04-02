export const ROLES = {
    SUPER_ADMIN: "super_admin",
    ADMIN: "admin",
    GURU: "guru",
    STAF: "staf",
} as const;

export type Role = (typeof ROLES)[keyof typeof ROLES];

export const ROLE_LABELS: Record<Role, string> = {
    super_admin: "Super Admin",
    admin: "Admin Sekolah",
    guru: "Guru",
    staf: "Staf",
};

// Permission resources
export type Resource =
    | "dashboard"
    | "siswa"
    | "guru"
    | "staf"
    | "kelas"
    | "pelajaran"
    | "jadwal"
    | "kehadiran"
    | "ujian"
    | "penugasan"
    | "pengumuman"
    | "tahun_ajaran"
    | "hari_libur"
    | "pengeluaran"
    | "cuti_staf"
    | "biaya"
    | "galeri"
    | "kartu_id"
    | "sertifikat"
    | "pengaturan"
    | "akademik";

export type Action = "view" | "create" | "edit" | "delete";

// Permission matrix: role -> resource -> allowed actions
const permissions: Record<Role, Partial<Record<Resource, Action[]>>> = {
    super_admin: {
        dashboard: ["view"],
        siswa: ["view", "create", "edit", "delete"],
        guru: ["view", "create", "edit", "delete"],
        staf: ["view", "create", "edit", "delete"],
        kelas: ["view", "create", "edit", "delete"],
        pelajaran: ["view", "create", "edit", "delete"],
        jadwal: ["view", "create", "edit", "delete"],
        kehadiran: ["view", "create", "edit", "delete"],
        ujian: ["view", "create", "edit", "delete"],
        penugasan: ["view", "create", "edit", "delete"],
        pengumuman: ["view", "create", "edit", "delete"],
        tahun_ajaran: ["view", "create", "edit", "delete"],
        hari_libur: ["view", "create", "edit", "delete"],
        pengeluaran: ["view", "create", "edit", "delete"],
        cuti_staf: ["view", "create", "edit", "delete"],
        biaya: ["view", "create", "edit", "delete"],
        galeri: ["view", "create", "edit", "delete"],
        kartu_id: ["view", "create", "edit", "delete"],
        sertifikat: ["view", "create", "edit", "delete"],
        pengaturan: ["view", "create", "edit", "delete"],
        akademik: ["view", "create", "edit", "delete"],
    },
    admin: {
        dashboard: ["view"],
        siswa: ["view", "create", "edit", "delete"],
        guru: ["view", "create", "edit", "delete"],
        staf: ["view", "create", "edit", "delete"],
        kelas: ["view", "create", "edit", "delete"],
        pelajaran: ["view", "create", "edit", "delete"],
        jadwal: ["view", "create", "edit", "delete"],
        kehadiran: ["view", "create", "edit", "delete"],
        ujian: ["view", "create", "edit", "delete"],
        penugasan: ["view", "create", "edit", "delete"],
        pengumuman: ["view", "create", "edit", "delete"],
        tahun_ajaran: ["view", "create", "edit", "delete"],
        hari_libur: ["view", "create", "edit", "delete"],
        pengeluaran: ["view", "create", "edit", "delete"],
        cuti_staf: ["view", "create", "edit", "delete"],
        biaya: ["view", "create", "edit", "delete"],
        galeri: ["view", "create", "edit", "delete"],
        kartu_id: ["view", "create", "edit", "delete"],
        sertifikat: ["view", "create", "edit", "delete"],
        pengaturan: ["view", "edit"],
        akademik: ["view", "create", "edit", "delete"],
    },
    guru: {
        dashboard: ["view"],
        siswa: ["view"],
        kelas: ["view"],
        pelajaran: ["view"],
        jadwal: ["view"],
        kehadiran: ["view", "create", "edit"],
        ujian: ["view", "create", "edit"],
        penugasan: ["view", "create", "edit", "delete"],
        pengumuman: ["view"],
        akademik: ["view", "create", "edit"],
    },
    staf: {
        dashboard: ["view"],
        siswa: ["view"],
        pengumuman: ["view"],
        galeri: ["view", "create"],
    },
};

export function hasPermission(
    role: Role,
    resource: Resource,
    action: Action
): boolean {
    const rolePermissions = permissions[role];
    if (!rolePermissions) return false;

    const resourceActions = rolePermissions[resource];
    if (!resourceActions) return false;

    return resourceActions.includes(action);
}

// Role hierarchy for comparison
const roleHierarchy: Record<Role, number> = {
    super_admin: 4,
    admin: 3,
    guru: 2,
    staf: 1,
};

export function isRoleHigherOrEqual(userRole: Role, requiredRole: Role): boolean {
    return roleHierarchy[userRole] >= roleHierarchy[requiredRole];
}
