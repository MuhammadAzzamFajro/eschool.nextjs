"use client";

import { PageHeader } from "@/components/shared/PageHeader";
import { DataTable } from "@/components/shared/DataTable";
import { type ColumnDef } from "@tanstack/react-table";
import {
    Plus,
    FileDown,
    Filter,
    CreditCard,
    TrendingUp,
    Clock,
    AlertCircle,
    User,
    CheckCircle2,
    Calendar,
    Search,
    Receipt,
    Wallet,
    MoreHorizontal,
    Printer,
    ArrowUpRight
} from "lucide-react";
import { Button } from "@/components/ui/button";
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuTrigger
} from "@/components/ui/dropdown-menu";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue
} from "@/components/ui/select";
import { useState } from "react";

// Mock Data Structure matching Laravel source
interface FeeRecord {
    id: string;
    studentName: string;
    class: string;
    compulsoryFee: number;
    optionalFee: number;
    status: 'paid' | 'unpaid' | 'pending';
    paidDate: string | null;
    paidAmount: number;
}

const mockFees: FeeRecord[] = [
    {
        id: "1",
        studentName: "Ahmad Dahlan",
        class: "X - MIPA 1",
        compulsoryFee: 2500000,
        optionalFee: 500000,
        status: 'paid',
        paidDate: "10-04-2026",
        paidAmount: 3000000,
    },
    {
        id: "2",
        studentName: "Siti Fatimah",
        class: "XI - IIS 2",
        compulsoryFee: 2500000,
        optionalFee: 0,
        status: 'pending',
        paidDate: null,
        paidAmount: 0,
    },
    {
        id: "3",
        studentName: "Budi Cahyono",
        class: "XII - MIPA 3",
        compulsoryFee: 2800000,
        optionalFee: 200000,
        status: 'unpaid',
        paidDate: null,
        paidAmount: 0,
    },
];

const formatCurrency = (amount: number) => {
    return new Intl.NumberFormat('id-ID', {
        style: 'currency',
        currency: 'IDR',
        minimumFractionDigits: 0,
    }).format(amount);
};

const columns: ColumnDef<FeeRecord>[] = [
    {
        accessorKey: "studentName",
        header: "Nama Siswa",
        cell: ({ row }) => (
            <div className="flex items-center gap-2">
                <div className="h-8 w-8 rounded-full bg-primary/10 flex items-center justify-center text-primary text-xs font-bold">
                    {(row.getValue("studentName") as string)?.[0]}
                </div>
                <span className="font-medium">{row.getValue("studentName")}</span>
            </div>
        ),
    },
    {
        accessorKey: "class",
        header: "Kelas",
    },
    {
        accessorKey: "compulsoryFee",
        header: "Biaya Wajib",
        cell: ({ row }) => <span>{formatCurrency(row.getValue("compulsoryFee"))}</span>,
    },
    {
        accessorKey: "optionalFee",
        header: "Biaya Opsional",
        cell: ({ row }) => <span>{formatCurrency(row.getValue("optionalFee"))}</span>,
    },
    {
        accessorKey: "status",
        header: "Status",
        cell: ({ row }) => {
            const status = row.getValue("status") as string;
            return (
                <Badge
                    variant={status === 'paid' ? 'default' : status === 'pending' ? 'secondary' : 'destructive'}
                    className={
                        status === 'paid' ? 'bg-green-500 hover:bg-green-600' :
                            status === 'pending' ? 'bg-amber-500 text-white hover:bg-amber-600' : ''
                    }
                >
                    {status === 'paid' ? 'Lunas' : status === 'pending' ? 'Menunggu' : 'Belum Bayar'}
                </Badge>
            );
        },
    },
    {
        accessorKey: "paidDate",
        header: "Tgl Bayar",
        cell: ({ row }) => <span className="text-muted-foreground">{row.getValue("paidDate") || "-"}</span>,
    },
    {
        accessorKey: "paidAmount",
        header: "Total Bayar",
        cell: ({ row }) => <span className="font-bold">{formatCurrency(row.getValue("paidAmount"))}</span>,
    },
    {
        id: "actions",
        header: "Aksi",
        cell: ({ row }) => (
            <DropdownMenu>
                <DropdownMenuTrigger render={
                    <Button variant="ghost" size="icon" className="h-8 w-8">
                        <MoreHorizontal className="h-4 w-4" />
                    </Button>
                } />
                <DropdownMenuContent align="end">
                    <DropdownMenuItem className="cursor-pointer">
                        <Receipt className="mr-2 h-4 w-4" /> Lihat Rincian
                    </DropdownMenuItem>
                    <DropdownMenuItem className="cursor-pointer">
                        <Printer className="mr-2 h-4 w-4" /> Cetak Kwitansi
                    </DropdownMenuItem>
                    <DropdownMenuItem className="cursor-pointer text-primary">
                        <CreditCard className="mr-2 h-4 w-4" /> Bayar Sekarang
                    </DropdownMenuItem>
                </DropdownMenuContent>
            </DropdownMenu>
        ),
    },
];

export default function FeesPage() {
    return (
        <div className="flex-1 space-y-6 p-4 md:p-8 pt-6">
            <PageHeader
                title="Manajemen Biaya Siswa"
                description="Kelola pembayaran SPP, biaya wajib, dan tagihan lainnya dalam satu tempat."
                action={
                    <div className="flex flex-wrap gap-2">
                        <Button variant="outline" size="sm">
                            <FileDown className="mr-2 h-4 w-4" /> Export Lap.
                        </Button>
                        <Button size="sm" className="bg-primary shadow-lg shadow-primary/25">
                            <Plus className="mr-2 h-4 w-4" /> Buat Tagihan
                        </Button>
                    </div>
                }
            />

            {/* Stats Cards */}
            <div className="grid gap-4 md:grid-cols-3">
                <Card className="border-none shadow-sm relative overflow-hidden group">
                    <div className="absolute top-0 right-0 p-4 opacity-10 group-hover:opacity-20 transition-opacity">
                        <Wallet className="h-24 w-24 -mr-8 -mt-8" />
                    </div>
                    <CardHeader className="pb-2">
                        <CardTitle className="text-sm font-medium text-muted-foreground">Total Tagihan</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">{formatCurrency(450000000)}</div>
                        <div className="flex items-center gap-1 text-xs text-muted-foreground mt-1">
                            <span className="font-medium text-primary">245</span> Siswa Terdaftar
                        </div>
                    </CardContent>
                </Card>
                <Card className="border-none shadow-sm relative overflow-hidden group">
                    <div className="absolute top-0 right-0 p-4 opacity-10 group-hover:opacity-20 transition-opacity">
                        <TrendingUp className="h-24 w-24 -mr-8 -mt-8 text-green-600" />
                    </div>
                    <CardHeader className="pb-2">
                        <CardTitle className="text-sm font-medium text-muted-foreground">Total Terkumpul</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold text-green-600">{formatCurrency(385000000)}</div>
                        <div className="flex items-center gap-1 text-xs text-muted-foreground mt-1">
                            <ArrowUpRight className="h-3 w-3" />
                            <span className="font-medium text-green-600">85.5%</span> dari total target
                        </div>
                    </CardContent>
                </Card>
                <Card className="border-none shadow-sm relative overflow-hidden group">
                    <div className="absolute top-0 right-0 p-4 opacity-10 group-hover:opacity-20 transition-opacity">
                        <Clock className="h-24 w-24 -mr-8 -mt-8 text-amber-600" />
                    </div>
                    <CardHeader className="pb-2">
                        <CardTitle className="text-sm font-medium text-muted-foreground">Belum Dibayar</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold text-amber-600">{formatCurrency(65000000)}</div>
                        <div className="flex items-center gap-1 text-xs text-muted-foreground mt-1">
                            <AlertCircle className="h-3 w-3" />
                            <span className="font-medium text-amber-600">42</span> Siswa menunggak
                        </div>
                    </CardContent>
                </Card>
            </div>

            {/* Filter Section */}
            <Card className="border-none shadow-sm">
                <CardHeader className="border-b pb-4">
                    <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
                        <div className="flex items-center gap-2">
                            <Filter className="h-5 w-5 text-primary" />
                            <CardTitle className="text-lg font-semibold">Filter Pembayaran</CardTitle>
                        </div>
                        <div className="flex flex-wrap items-center gap-3">
                            <Select defaultValue="2025-2026">
                                <SelectTrigger className="w-[160px] h-9">
                                    <SelectValue placeholder="Tahun Ajaran" />
                                </SelectTrigger>
                                <SelectContent>
                                    <SelectItem value="2025-2026">2025-2026</SelectItem>
                                    <SelectItem value="2024-2025">2024-2025</SelectItem>
                                </SelectContent>
                            </Select>
                            <Select defaultValue="all">
                                <SelectTrigger className="w-[160px] h-9">
                                    <SelectValue placeholder="Jenis Biaya" />
                                </SelectTrigger>
                                <SelectContent>
                                    <SelectItem value="all">Semua Biaya</SelectItem>
                                    <SelectItem value="spp">SPP Bulanan</SelectItem>
                                    <SelectItem value="gedung">Uang Gedung</SelectItem>
                                </SelectContent>
                            </Select>
                            <Select defaultValue="all">
                                <SelectTrigger className="w-[140px] h-9">
                                    <SelectValue placeholder="Status" />
                                </SelectTrigger>
                                <SelectContent>
                                    <SelectItem value="all">Semua Status</SelectItem>
                                    <SelectItem value="paid">Lunas</SelectItem>
                                    <SelectItem value="unpaid">Belum Lunas</SelectItem>
                                </SelectContent>
                            </Select>
                        </div>
                    </div>
                </CardHeader>
                <CardContent className="pt-6">
                    <DataTable
                        columns={columns}
                        data={mockFees}
                        searchColumn="studentName"
                        searchPlaceholder="Cari nama siswa..."
                    />
                </CardContent>
            </Card>
        </div>
    );
}
