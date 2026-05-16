"use client";

import { useEffect, useState } from "react";
import { PageHeader } from "@/components/shared/PageHeader";
import { DataTable } from "@/components/shared/DataTable";
import { Users, Plus, Download, MoreHorizontal, Eye, Pencil, Trash2, Loader2 } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import type { ColumnDef } from "@tanstack/react-table";
import { getAllProfiles, type Profile } from "@/services/profile.service";

const columns: ColumnDef<Profile>[] = [
    {
        accessorKey: "full_name",
        header: "Nama Lengkap",
        cell: ({ row }) => (
            <div className="flex items-center gap-2">
                <div className="h-8 w-8 rounded-full bg-emerald-500/10 flex items-center justify-center text-emerald-600 text-xs font-semibold shrink-0">
                    {(row.getValue("full_name") as string).charAt(0)}
                </div>
                <span className="font-medium">{row.getValue("full_name")}</span>
            </div>
        ),
    },
    {
        accessorKey: "email",
        header: "Email",
        cell: ({ row }) => (
            <span className="text-sm text-muted-foreground">{row.getValue("email")}</span>
        ),
    },
    {
        accessorKey: "phone",
        header: "No. HP",
        cell: ({ row }) => (
            <span className="text-sm text-muted-foreground">{row.getValue("phone") || "-"}</span>
        ),
    },
    {
        accessorKey: "role",
        header: "Role",
        cell: ({ row }) => (
            <Badge variant="outline" className="capitalize">
                {row.getValue("role")}
            </Badge>
        ),
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
    const [data, setData] = useState<Profile[]>([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchData = async () => {
            try {
                const profiles = await getAllProfiles();
                // Filter by guru role (or just show all for now if no guru exists yet)
                const gurus = profiles.filter(p => p.role === "guru");
                setData(gurus.length > 0 ? gurus : profiles); 
            } catch (error) {
                console.error("Error fetching guru:", error);
            } finally {
                setLoading(false);
            }
        };

        fetchData();
    }, []);

    return (
        <div className="space-y-6">
            <PageHeader
                title="Data Guru"
                description="Kelola semua data guru dan tenaga pengajar dari database"
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

            {loading ? (
                <div className="flex h-64 items-center justify-center">
                    <Loader2 className="h-8 w-8 animate-spin text-primary" />
                </div>
            ) : (
                <DataTable
                    columns={columns}
                    data={data}
                    searchPlaceholder="Cari nama atau email..."
                    searchColumn="full_name"
                />
            )}
        </div>
    );
}
