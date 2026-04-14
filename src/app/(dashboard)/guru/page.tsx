"use client";

import { PageHeader } from "@/components/shared/PageHeader";
import { DataTable } from "@/components/shared/DataTable";
import { Users, Plus, Download, MoreHorizontal, Eye, Pencil, Trash2 } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import type { ColumnDef } from "@tanstack/react-table";

interface Guru {
    id: string;
    nip: string;
    nama: string;
    mata_pelajaran: string;
    no_hp: string;
    status: string;
}

const dummyData: Guru[] = [
    { id: "1", nip: "198501012010011001", nama: "Budi Santoso, S.Pd", mata_pelajaran: "Matematika", no_hp: "0812-0000-0001", status: "Aktif" },
    { id: "2", nip: "198612152011012002", nama: "Sari Dewi, M.Pd", mata_pelajaran: "Bahasa Indonesia", no_hp: "0813-0000-0002", status: "Aktif" },
    { id: "3", nip: "197903202009011003", nama: "Ahmad Rizki, S.Si", mata_pelajaran: "Fisika", no_hp: "0814-0000-0003", status: "Aktif" },
    { id: "4", nip: "198811102012012004", nama: "Dewi Rahayu, M.Sc", mata_pelajaran: "Kimia", no_hp: "0815-0000-0004", status: "Aktif" },
    { id: "5", nip: "199001052015011005", nama: "Rina Wulandari, S.Pd", mata_pelajaran: "Bahasa Inggris", no_hp: "0816-0000-0005", status: "Cuti" },
];

const columns: ColumnDef<Guru>[] = [
    {
        accessorKey: "nip",
        header: "NIP",
        cell: ({ row }) => (
            <span className="font-mono text-xs text-muted-foreground">{row.getValue("nip")}</span>
        ),
    },
    {
        accessorKey: "nama",
        header: "Nama Lengkap",
        cell: ({ row }) => (
            <div className="flex items-center gap-2">
                <div className="h-8 w-8 rounded-full bg-emerald-500/10 flex items-center justify-center text-emerald-600 text-xs font-semibold shrink-0">
                    {(row.getValue("nama") as string).charAt(0)}
                </div>
                <span className="font-medium">{row.getValue("nama")}</span>
            </div>
        ),
    },
    {
        accessorKey: "mata_pelajaran",
        header: "Mata Pelajaran",
        cell: ({ row }) => (
            <Badge variant="outline" className="font-normal">
                {row.getValue("mata_pelajaran")}
            </Badge>
        ),
    },
    {
        accessorKey: "no_hp",
        header: "No. HP",
        cell: ({ row }) => (
            <span className="text-sm text-muted-foreground">{row.getValue("no_hp")}</span>
        ),
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

export default function GuruPage() {
    return (
        <div className="space-y-6">
            <PageHeader
                title="Data Guru"
                description="Kelola semua data guru dan tenaga pengajar"
            >
                <Button variant="outline" size="sm" className="gap-2">
                    <Download className="h-4 w-4" />
                    Export
                </Button>
                <Button size="sm" className="gap-2">
                    <Plus className="h-4 w-4" />
                    Tambah Guru
                </Button>
            </PageHeader>

            {/* Stats */}
            <div className="grid grid-cols-2 gap-3 sm:grid-cols-3">
                {[
                    { label: "Total Guru", value: "86", color: "bg-blue-50 text-blue-700 dark:bg-blue-950/50 dark:text-blue-300 border border-blue-100 dark:border-blue-900" },
                    { label: "Guru Aktif", value: "82", color: "bg-emerald-50 text-emerald-700 dark:bg-emerald-950/50 dark:text-emerald-300 border border-emerald-100 dark:border-emerald-900" },
                    { label: "Guru Cuti", value: "4", color: "bg-amber-50 text-amber-700 dark:bg-amber-950/50 dark:text-amber-300 border border-amber-100 dark:border-amber-900" },
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
                searchPlaceholder="Cari nama atau NIP guru..."
            />
        </div>
    );
}
