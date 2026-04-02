import {
    LayoutDashboard,
    Users,
    GraduationCap,
    UserCog,
    School,
    BookOpen,
    Calendar,
    ClipboardCheck,
    FileText,
    ClipboardList,
    Megaphone,
    CalendarDays,
    CalendarOff,
    Wallet,
    CalendarMinus,
    CreditCard,
    Image,
    IdCard,
    Award,
    Settings,
    type LucideIcon,
} from "lucide-react";
import { type Role, type Resource } from "./roles";

export interface MenuItem {
    title: string;
    href: string;
    icon: LucideIcon;
    resource: Resource;
    badge?: string;
}

export interface MenuGroup {
    label: string;
    items: MenuItem[];
}

export const menuGroups: MenuGroup[] = [
    {
        label: "Utama",
        items: [
            {
                title: "Dashboard",
                href: "/dashboard",
                icon: LayoutDashboard,
                resource: "dashboard",
            },
        ],
    },
    {
        label: "Manajemen Pengguna",
        items: [
            {
                title: "Siswa",
                href: "/siswa",
                icon: GraduationCap,
                resource: "siswa",
            },
            {
                title: "Guru",
                href: "/guru",
                icon: Users,
                resource: "guru",
            },
            {
                title: "Staf",
                href: "/staf",
                icon: UserCog,
                resource: "staf",
            },
        ],
    },
    {
        label: "Akademik",
        items: [
            {
                title: "Akademik",
                href: "/akademik",
                icon: BookOpen,
                resource: "akademik",
            },
            {
                title: "Kelas",
                href: "/kelas",
                icon: School,
                resource: "kelas",
            },
            {
                title: "Pelajaran",
                href: "/pelajaran",
                icon: BookOpen,
                resource: "pelajaran",
            },
            {
                title: "Jadwal",
                href: "/jadwal",
                icon: Calendar,
                resource: "jadwal",
            },
            {
                title: "Kehadiran",
                href: "/kehadiran",
                icon: ClipboardCheck,
                resource: "kehadiran",
            },
            {
                title: "Ujian",
                href: "/ujian",
                icon: FileText,
                resource: "ujian",
            },
            {
                title: "Penugasan",
                href: "/penugasan",
                icon: ClipboardList,
                resource: "penugasan",
            },
        ],
    },
    {
        label: "Administrasi",
        items: [
            {
                title: "Pengumuman",
                href: "/pengumuman",
                icon: Megaphone,
                resource: "pengumuman",
            },
            {
                title: "Tahun Ajaran",
                href: "/tahun-ajaran",
                icon: CalendarDays,
                resource: "tahun_ajaran",
            },
            {
                title: "Hari Libur",
                href: "/hari-libur",
                icon: CalendarOff,
                resource: "hari_libur",
            },
            {
                title: "Pengeluaran",
                href: "/pengeluaran",
                icon: Wallet,
                resource: "pengeluaran",
            },
            {
                title: "Cuti Staf",
                href: "/cuti-staf",
                icon: CalendarMinus,
                resource: "cuti_staf",
            },
            {
                title: "Biaya",
                href: "/biaya",
                icon: CreditCard,
                resource: "biaya",
            },
        ],
    },
    {
        label: "Lainnya",
        items: [
            {
                title: "Galeri",
                href: "/galeri",
                icon: Image,
                resource: "galeri",
            },
            {
                title: "Kartu ID",
                href: "/kartu-id",
                icon: IdCard,
                resource: "kartu_id",
            },
            {
                title: "Sertifikat",
                href: "/sertifikat",
                icon: Award,
                resource: "sertifikat",
            },
            {
                title: "Pengaturan",
                href: "/pengaturan",
                icon: Settings,
                resource: "pengaturan",
            },
        ],
    },
];

/**
 * Filter menu groups based on user role.
 * Only shows items the user has "view" permission for.
 */
export function getMenuForRole(role: Role): MenuGroup[] {
    // Import dynamically to avoid circular dependency
    const { hasPermission } = require("./roles");

    return menuGroups
        .map((group) => ({
            ...group,
            items: group.items.filter((item) =>
                hasPermission(role, item.resource, "view")
            ),
        }))
        .filter((group) => group.items.length > 0);
}
