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
    Building2,
    CheckSquare,
    Laptop,
    Folder,
    Bell,
    Layers,
    type LucideIcon,
} from "lucide-react";
import { type Role, type Resource } from "./roles";

export interface MenuItem {
    title: string;
    href: string;
    icon: LucideIcon;
    resource: Resource;
    badge?: string;
    children?: Omit<MenuItem, "icon" | "children">[];
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
        label: "Kurikulum",
        items: [
            {
                title: "Akademik",
                href: "/akademik",
                icon: Building2,
                resource: "akademik",
                children: [
                    { title: "Dashboard Akademik", href: "/akademik/dashboard", resource: "akademik" },
                    { title: "Medium", href: "/akademik/mediums", resource: "akademik" },
                    { title: "Section", href: "/akademik/sections", resource: "akademik" },
                    { title: "Stream", href: "/akademik/streams", resource: "akademik" },
                    { title: "Tingkat Kelas", href: "/akademik/grade-levels", resource: "kelas" },
                    { title: "Kelas", href: "/akademik/classes", resource: "kelas" },
                    { title: "Mata Pelajaran", href: "/akademik/subjects", resource: "pelajaran" },
                    { title: "Mata Pelajaran Kelas", href: "/akademik/class-subjects", resource: "pelajaran" },
                    { title: "Wali Kelas", href: "/akademik/class-teachers", resource: "guru" },
                    { title: "Pindah Kelas", href: "/akademik/promote-students", resource: "siswa" },
                    { title: "Nomor Urut", href: "/akademik/roll-numbers", resource: "siswa" },
                    { title: "Semester", href: "/akademik/semesters", resource: "tahun_ajaran" },
                    { title: "Shift", href: "/akademik/shifts", resource: "tahun_ajaran" },
                ]
            },
            {
                title: "Jadwal Pelajaran",
                href: "/jadwal",
                icon: Calendar,
                resource: "jadwal",
                children: [
                    { title: "Buat Jadwal", href: "/jadwal/create", resource: "jadwal" },
                    { title: "Jadwal Guru", href: "/jadwal/teachers", resource: "jadwal" },
                ]
            },
            {
                title: "Penugasan Siswa",
                href: "/penugasan",
                icon: ClipboardList,
                resource: "penugasan",
                children: [
                    { title: "Buat Penugasan", href: "/penugasan/create", resource: "penugasan" },
                    { title: "Pengumpulan", href: "/penugasan/submissions", resource: "penugasan" },
                ]
            },
            {
                title: "Ujian Offline",
                href: "/ujian/offline",
                icon: FileText,
                resource: "ujian",
                children: [
                    { title: "Data Ujian", href: "/ujian/offline/list", resource: "ujian" },
                    { title: "Jadwal Ujian", href: "/ujian/offline/timetable", resource: "ujian" },
                    { title: "Upload Nilai", href: "/ujian/offline/upload-marks", resource: "ujian" },
                    { title: "Hasil Ujian", href: "/ujian/offline/results", resource: "ujian" },
                    { title: "Kategori Nilai", href: "/ujian/offline/grades", resource: "ujian" },
                ]
            },
            {
                title: "Ujian Online",
                href: "/ujian/online",
                icon: Laptop,
                resource: "ujian",
                children: [
                    { title: "Dashboard Ujian", href: "/ujian/online/dashboard", resource: "ujian" },
                    { title: "Data Ujian", href: "/ujian/online/list", resource: "ujian" },
                    { title: "Bank Soal", href: "/ujian/online/question-bank", resource: "ujian" },
                ]
            },
            {
                title: "Dokumen Kurikulum",
                href: "/kurikulum/dokumen",
                icon: Folder,
                resource: "akademik",
            },
        ],
    },
    {
        label: "Kesiswaan",
        items: [
            {
                title: "Siswa",
                href: "/siswa",
                icon: GraduationCap,
                resource: "siswa",
                children: [
                    { title: "Dashboard Siswa", href: "/siswa/dashboard", resource: "siswa" },
                    { title: "Penerimaan Siswa", href: "/siswa/admission", resource: "siswa" },
                    { title: "Daftar Siswa", href: "/siswa/list", resource: "siswa" },
                    { title: "Reset Password", href: "/siswa/reset-password", resource: "siswa" },
                    { title: "Upload Foto Profile", href: "/siswa/upload-photo", resource: "siswa" },
                    { title: "Field Form Pendaftaran", href: "/siswa/form-fields", resource: "siswa" },
                    { title: "Tambah Bulk Data", href: "/siswa/bulk-data", resource: "siswa" },
                    { title: "Wali Murid", href: "/siswa/guardians", resource: "siswa" },
                ]
            },
            {
                title: "Absensi",
                href: "/absensi",
                icon: CheckSquare,
                resource: "kehadiran",
                children: [
                    { title: "Dashboard Absensi", href: "/absensi/dashboard", resource: "kehadiran" },
                    { title: "Tambah Absensi", href: "/absensi/add", resource: "kehadiran" },
                    { title: "Absensi per Pelajaran", href: "/absensi/by-subject", resource: "kehadiran" },
                    { title: "Izin Siswa", href: "/absensi/permissions", resource: "kehadiran" },
                    { title: "Peringkat Kehadiran", href: "/absensi/rank", resource: "kehadiran" },
                    { title: "Lihat Absensi", href: "/absensi/view", resource: "kehadiran" },
                    { title: "Rekap Bulanan", href: "/absensi/recap-monthly", resource: "kehadiran" },
                    { title: "Rekap SIA", href: "/absensi/recap-sia", resource: "kehadiran" },
                    { title: "Laporan Poin", href: "/absensi/points-report", resource: "kehadiran" },
                    { title: "Pengaturan Absensi", href: "/absensi/settings", resource: "kehadiran" },
                ]
            },
            {
                title: "Dokumen Kesiswaan",
                href: "/kesiswaan/dokumen",
                icon: Folder,
                resource: "siswa",
            },
        ],
    },
    {
        label: "Manajemen SDM",
        items: [
            {
                title: "Guru",
                href: "/guru",
                icon: Users,
                resource: "guru",
                children: [
                    { title: "Dashboard Guru", href: "/guru/dashboard", resource: "guru" },
                    { title: "Daftar Guru", href: "/guru/list", resource: "guru" },
                    { title: "Tambah Bulk Guru", href: "/guru/bulk-upload", resource: "guru" },
                ]
            },
            {
                title: "Staf",
                href: "/staf",
                icon: UserCog,
                resource: "staf",
            },
            {
                title: "Cuti Staf",
                href: "/cuti-staf",
                icon: CalendarMinus,
                resource: "cuti_staf",
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
                title: "Notifikasi",
                href: "/notifikasi",
                icon: Bell,
                resource: "pengumuman",
            },
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
        .map((group) => {
            const filteredItems = group.items.filter((item) => {
                const hasItemPermission = hasPermission(role, item.resource, "view");

                // If item has children, filter them as well
                if (item.children) {
                    item.children = item.children.filter(child =>
                        hasPermission(role, child.resource, "view")
                    );
                    // Return true if parent HAS permission, even if all children are filtered out
                    return hasItemPermission;
                }

                return hasItemPermission;
            });

            return {
                ...group,
                items: filteredItems,
            };
        })
        .filter((group) => group.items.length > 0);
}
