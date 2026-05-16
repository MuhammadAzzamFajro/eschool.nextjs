"use client";

import { PageHeader } from "@/components/shared/PageHeader";
import { DataTable } from "@/components/shared/DataTable";
import { Calendar, Search, Filter, MoreHorizontal, Eye, FileText } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import type { ColumnDef } from "@tanstack/react-table";

interface JadwalGuru {
    id: string;
    namaGuru: string;
    mapel: string;
    hari: string;
    jam: string;
    ruangan: string;
}

const data: JadwalGuru[] = [
    { id: "1", namaGuru: "Budi Santoso, S.Kom", mapel: "Pemrograman Web", hari: "Senin", jam: "07:00 - 09:00", ruangan: "Lab RPL 1" },
    { id: "2", namaGuru: "Siti Aminah, M.Pd", mapel: "Matematika", hari: "Senin", jam: "09:15 - 11:15", ruangan: "R. 101" },
    { id: "3", namaGuru: "Andi Wijaya, S.T", mapel: "Basis Data", hari: "Selasa", jam: "07:00 - 10:00", ruangan: "Lab RPL 2" },
];

const columns: ColumnDef<JadwalGuru>[] = [
    {
        accessorKey: "namaGuru",
        header: "Nama Guru",
        cell: ({ row }) => <span className="font-medium">{row.getValue("namaGuru")}</span>,
    },
    {
        accessorKey: "mapel",
        header: "Mata Pelajaran",
    },
    {
        accessorKey: "hari",
        header: "Hari",
        cell: ({ row }) => (
            <Badge variant="secondary">{row.getValue("hari")}</Badge>
        ),
    },
    {
        accessorKey: "jam",
        header: "Jam Pelajaran",
    },
    {
        accessorKey: "ruangan",
        header: "Ruangan",
    },
    {
        id: "actions",
        header: () => <span className="sr-only">Aksi</span>,
        cell: () => (
            <Button variant="ghost" size="icon" className="h-8 w-8">
                <MoreHorizontal className="h-4 w-4" />
            </Button>
        ),
    },
];

export default function JadwalGuruPage() {
    return (
        <div className="space-y-6">
            <PageHeader
                title="Jadwal Pelajaran Guru"
                description="Lihat dan kelola jadwal mengajar seluruh guru"
            >
                <Button variant="outline" size="sm" className="gap-2">
                    <FileText className="h-4 w-4" />
                    Cetak Jadwal
                </Button>
                <Button size="sm" className="gap-2">
                    <Plus className="h-4 w-4" />
                    Tambah Jadwal
                </Button>
            </PageHeader>

            <DataTable
                columns={columns}
                data={data}
                searchPlaceholder="Cari nama guru atau mata pelajaran..."
                searchColumn="namaGuru"
            />
        </div>
    );
}

function Plus(props: any) {
    return (
        <svg
            {...props}
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            strokeWidth="2"
            strokeLinecap="round"
            strokeLinejoin="round"
        >
            <path d="M5 12h14" />
            <path d="M12 5v14" />
        </svg>
    );
}
