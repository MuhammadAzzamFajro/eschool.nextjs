"use client";

import { PageHeader } from "@/components/shared/PageHeader";
import { DataTable } from "@/components/shared/DataTable";
import { GraduationCap, Plus, Download, MoreHorizontal, Eye, Pencil, Trash2 } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import type { ColumnDef } from "@tanstack/react-table";

interface Siswa {
    id: string;
    nis: string;
    nama: string;
    kelas: string;
    jenis_kelamin: string;
    status: string;
}

const dummyData: Siswa[] = [
    { id: "1", nis: "2024001", nama: "Ahmad Fauzi", kelas: "X IPA 1", jenis_kelamin: "Laki-laki", status: "Aktif" },
    { id: "2", nis: "2024002", nama: "Siti Rahayu", kelas: "X IPA 1", jenis_kelamin: "Perempuan", status: "Aktif" },
    { id: "3", nis: "2024003", nama: "Budi Santoso", kelas: "XI IPS 2", jenis_kelamin: "Laki-laki", status: "Aktif" },
    { id: "4", nis: "2024004", nama: "Dewi Lestari", kelas: "XI IPS 2", jenis_kelamin: "Perempuan", status: "Aktif" },
    { id: "5", nis: "2024005", nama: "Rizky Pratama", kelas: "XII IPA 3", jenis_kelamin: "Laki-laki", status: "Aktif" },
    { id: "6", nis: "2024006", nama: "Anisa Putri", kelas: "XII IPA 3", jenis_kelamin: "Perempuan", status: "Tidak Aktif" },
    { id: "7", nis: "2024007", nama: "Dafa Nugraha", kelas: "X IPS 1", jenis_kelamin: "Laki-laki", status: "Aktif" },
    { id: "8", nis: "2024008", nama: "Zahra Amelia", kelas: "X IPS 1", jenis_kelamin: "Perempuan", status: "Aktif" },
];

const columns: ColumnDef<Siswa>[] = [
    {
        accessorKey: "nis",
        header: "NIS",
        cell: ({ row }) => (
            <span className="font-mono text-sm text-muted-foreground">{row.getValue("nis")}</span>
        ),
    },
    {
        accessorKey: "nama",
        header: "Nama Lengkap",
        cell: ({ row }) => (
            <div className="flex items-center gap-2">
                <div className="h-8 w-8 rounded-full bg-primary/10 flex items-center justify-center text-primary text-xs font-semibold shrink-0">
                    {(row.getValue("nama") as string).charAt(0)}
                </div>
                <span className="font-medium">{row.getValue("nama")}</span>
            </div>
        ),
    },
    {
        accessorKey: "kelas",
        header: "Kelas",
        cell: ({ row }) => (
            <Badge variant="outline" className="font-normal">
                {row.getValue("kelas")}
            </Badge>
        ),
    },
    {
        accessorKey: "jenis_kelamin",
        header: "Jenis Kelamin",
        cell: ({ row }) => {
            const jk = row.getValue("jenis_kelamin") as string;
            return (
                <span className={jk === "Laki-laki" ? "text-blue-600 dark:text-blue-400" : "text-pink-600 dark:text-pink-400"}>
                    {jk}
                </span>
            );
        },
    },
    {
        accessorKey: "status",
        header: "Status",
        cell: ({ row }) => {
            const status = row.getValue("status") as string;
            return (
                <Badge variant={status === "Aktif" ? "default" : "secondary"}>
                    {status}
                </Badge>
            );
        },
    },
    {
        id: "actions",
        header: () => <span className="sr-only">Aksi</span>,
        cell: () => (
            <DropdownMenu>
                <DropdownMenuTrigger render={
                    <Button variant="ghost" size="icon" className="h-8 w-8">
                        <MoreHorizontal className="h-4 w-4" />
                    </Button>
                } />
                <DropdownMenuContent align="end">
                    <DropdownMenuItem className="gap-2 cursor-pointer">
                        <Eye className="h-4 w-4" /> Lihat Detail
                    </DropdownMenuItem>
                    <DropdownMenuItem className="gap-2 cursor-pointer">
                        <Pencil className="h-4 w-4" /> Edit
                    </DropdownMenuItem>
                    <DropdownMenuItem className="gap-2 cursor-pointer text-destructive focus:text-destructive">
                        <Trash2 className="h-4 w-4" /> Hapus
                    </DropdownMenuItem>
                </DropdownMenuContent>
            </DropdownMenu>
        ),
    },
];

export default function SiswaPage() {
    return (
        <div className="space-y-6">
            <PageHeader
                title="Data Siswa"
                description="Kelola semua data siswa yang terdaftar di sekolah"
            >
                <Button variant="outline" size="sm" className="gap-2">
                    <Download className="h-4 w-4" />
                    Export
                </Button>
                <Button size="sm" className="gap-2">
                    <Plus className="h-4 w-4" />
                    Tambah Siswa
                </Button>
            </PageHeader>

            {/* Stats */}
            <div className="grid grid-cols-2 gap-3 sm:grid-cols-4">
                {[
                    { label: "Total Siswa", value: "1,245", color: "bg-blue-50 text-blue-700 dark:bg-blue-950/50 dark:text-blue-300 border border-blue-100 dark:border-blue-900" },
                    { label: "Siswa Aktif", value: "1,198", color: "bg-emerald-50 text-emerald-700 dark:bg-emerald-950/50 dark:text-emerald-300 border border-emerald-100 dark:border-emerald-900" },
                    { label: "Siswa Baru", value: "47", color: "bg-amber-50 text-amber-700 dark:bg-amber-950/50 dark:text-amber-300 border border-amber-100 dark:border-amber-900" },
                    { label: "Tidak Aktif", value: "47", color: "bg-red-50 text-red-700 dark:bg-red-950/50 dark:text-red-300 border border-red-100 dark:border-red-900" },
                ].map((s) => (
                    <div key={s.label} className={`rounded-xl p-4 ${s.color}`}>
                        <div className="text-2xl font-bold tracking-tight">{s.value}</div>
                        <div className="text-xs font-medium mt-0.5 opacity-80">{s.label}</div>
                    </div>
                ))}
            </div>

            <DataTable
                columns={columns}
                data={dummyData}
                searchPlaceholder="Cari nama atau NIS siswa..."
            />
        </div>
    );
}
