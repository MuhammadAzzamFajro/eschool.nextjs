"use client";

import { PageHeader } from "@/components/shared/PageHeader";
import { DataTable } from "@/components/shared/DataTable";
import { type ColumnDef } from "@tanstack/react-table";
import {
    Plus,
    FileDown,
    CalendarSearch,
    User,
    BookOpen,
    Users,
    UsersRound,
    CheckCircle2,
    XCircle,
    Clock,
    MoreHorizontal,
    Eye,
    Edit2,
    Trash2,
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
import { Input } from "@/components/ui/input";
import { useState } from "react";

// Mock Data Structure matching Laravel source
interface AttendanceRecord {
    id: string;
    no: number;
    teacher: string;
    subject: string;
    class: string;
    date: string;
    startTime: string;
    endTime: string;
    matter: string;
    studentCount: number;
    present: number;
    sick: number;
    permission: number;
    absent: number;
}

const mockAttendance: AttendanceRecord[] = [
    {
        id: "1",
        no: 1,
        teacher: "Budi Santoso",
        subject: "Matematika",
        class: "X - MIPA 1",
        date: "11-04-2026",
        startTime: "07:30",
        endTime: "09:00",
        matter: "Trigonometri Dasar",
        studentCount: 36,
        present: 32,
        sick: 2,
        permission: 1,
        absent: 1,
    },
    {
        id: "2",
        no: 2,
        teacher: "Siti Aminah",
        subject: "Bahasa Indonesia",
        class: "XI - IIS 2",
        date: "11-04-2026",
        startTime: "09:15",
        endTime: "10:45",
        matter: "Teks Eksplanasi",
        studentCount: 34,
        present: 34,
        sick: 0,
        permission: 0,
        absent: 0,
    },
];

const columns: ColumnDef<AttendanceRecord>[] = [
    {
        accessorKey: "no",
        header: "No.",
        cell: ({ row }) => <span className="font-medium">{row.getValue("no")}</span>,
    },
    {
        accessorKey: "teacher",
        header: "Guru",
        cell: ({ row }) => (
            <div className="flex flex-col">
                <span className="font-medium">{row.getValue("teacher")}</span>
            </div>
        ),
    },
    {
        accessorKey: "subject",
        header: "Mata Pelajaran",
        cell: ({ row }) => (
            <div className="flex items-center gap-2">
                <Badge variant="outline" className="bg-primary/5 text-primary border-primary/20">
                    {row.getValue("subject")}
                </Badge>
            </div>
        ),
    },
    {
        accessorKey: "class",
        header: "Kelas",
    },
    {
        accessorKey: "date",
        header: "Tanggal",
        cell: ({ row }) => (
            <div className="flex items-center gap-1.5 text-muted-foreground">
                <Clock className="h-3.5 w-3.5" />
                <span>{row.getValue("date")}</span>
            </div>
        ),
    },
    {
        accessorKey: "studentCount",
        header: "Siswa",
        cell: ({ row }) => <span className="font-semibold text-center block">{row.getValue("studentCount")}</span>,
    },
    {
        accessorKey: "present",
        header: "Hadir",
        cell: ({ row }) => (
            <Badge className="bg-green-500/10 text-green-600 hover:bg-green-500/20 border-green-500/20">
                {row.getValue("present")}
            </Badge>
        ),
    },
    {
        accessorKey: "permission",
        header: "Izin",
        cell: ({ row }) => (
            <Badge variant="outline" className="text-blue-600 border-blue-200 bg-blue-50">
                {row.getValue("permission")}
            </Badge>
        ),
    },
    {
        accessorKey: "sick",
        header: "Sakit",
        cell: ({ row }) => (
            <Badge variant="outline" className="text-amber-600 border-amber-200 bg-amber-50">
                {row.getValue("sick")}
            </Badge>
        ),
    },
    {
        accessorKey: "absent",
        header: "Alpa",
        cell: ({ row }) => (
            <Badge variant="destructive" className="bg-red-500/10 text-red-600 hover:bg-red-500/20 border-red-500/20">
                {row.getValue("absent")}
            </Badge>
        ),
    },
    {
        id: "actions",
        header: "Aksi",
        cell: ({ row }) => (
            <DropdownMenu>
                <DropdownMenuTrigger render={
                    <Button variant="ghost" size="icon" className="h-8 w-8 hover:bg-muted">
                        <MoreHorizontal className="h-4 w-4" />
                    </Button>
                } />
                <DropdownMenuContent align="end" className="w-40">
                    <DropdownMenuItem className="cursor-pointer">
                        <Eye className="mr-2 h-4 w-4" /> Detail
                    </DropdownMenuItem>
                    <DropdownMenuItem className="cursor-pointer">
                        <Edit2 className="mr-2 h-4 w-4" /> Edit
                    </DropdownMenuItem>
                    <DropdownMenuItem className="cursor-pointer text-destructive">
                        <Trash2 className="mr-2 h-4 w-4" /> Hapus
                    </DropdownMenuItem>
                </DropdownMenuContent>
            </DropdownMenu>
        ),
    },
];

export default function AttendanceBySubjectPage() {
    const [startDate, setStartDate] = useState("");
    const [endDate, setEndDate] = useState("");

    return (
        <div className="flex-1 space-y-6 p-4 md:p-8 pt-6">
            <PageHeader
                title="Absensi per Mata Pelajaran"
                description="Pantau dan kelola kehadiran siswa berdasarkan jadwal pelajaran."
                action={
                    <div className="flex flex-wrap gap-2">
                        <Button variant="outline" size="sm" className="hidden sm:flex">
                            <FileDown className="mr-2 h-4 w-4" /> Export
                        </Button>
                        <Button size="sm" className="bg-primary shadow-lg shadow-primary/25">
                            <Plus className="mr-2 h-4 w-4" /> Tambah Absensi
                        </Button>
                    </div>
                }
            />

            {/* Stats Overview */}
            <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
                <Card className="border-none shadow-sm bg-gradient-to-br from-blue-50 to-white dark:from-blue-950/20 overflow-hidden">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">Total Sesi</CardTitle>
                        <div className="h-8 w-8 rounded-full bg-blue-100 dark:bg-blue-900/30 flex items-center justify-center">
                            <BookOpen className="h-4 w-4 text-blue-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">128</div>
                        <p className="text-xs text-muted-foreground mt-1">Minggu ini</p>
                    </CardContent>
                </Card>
                <Card className="border-none shadow-sm bg-gradient-to-br from-green-50 to-white dark:from-green-950/20 overflow-hidden">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">Tingkat Kehadiran</CardTitle>
                        <div className="h-8 w-8 rounded-full bg-green-100 dark:bg-green-900/30 flex items-center justify-center">
                            <CheckCircle2 className="h-4 w-4 text-green-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">96.4%</div>
                        <p className="text-xs text-muted-foreground mt-1">+1.2% dari bulan lalu</p>
                    </CardContent>
                </Card>
                <Card className="border-none shadow-sm bg-gradient-to-br from-amber-50 to-white dark:from-amber-950/20 overflow-hidden">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">Izin & Sakit</CardTitle>
                        <div className="h-8 w-8 rounded-full bg-amber-100 dark:bg-amber-900/30 flex items-center justify-center">
                            <UsersRound className="h-4 w-4 text-amber-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">12</div>
                        <p className="text-xs text-muted-foreground mt-1">Hari ini</p>
                    </CardContent>
                </Card>
                <Card className="border-none shadow-sm bg-gradient-to-br from-red-50 to-white dark:from-red-950/20 overflow-hidden">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">Alpa</CardTitle>
                        <div className="h-8 w-8 rounded-full bg-red-100 dark:bg-red-900/30 flex items-center justify-center">
                            <XCircle className="h-4 w-4 text-red-600" />
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">4</div>
                        <p className="text-xs text-muted-foreground mt-1">Membutuhkan perhatian</p>
                    </CardContent>
                </Card>
            </div>

            {/* Filters & Table */}
            <Card className="border-none shadow-sm">
                <CardHeader className="pb-3 border-b">
                    <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
                        <CardTitle className="text-lg font-semibold flex items-center gap-2">
                            <CalendarSearch className="h-5 w-5 text-primary" />
                            Filter & Data Kehadiran
                        </CardTitle>
                        <div className="flex flex-wrap items-center gap-2">
                            <Select defaultValue="0">
                                <SelectTrigger className="w-[180px] h-9">
                                    <SelectValue placeholder="Semua Kelas" />
                                </SelectTrigger>
                                <SelectContent>
                                    <SelectItem value="0">Semua Kelas</SelectItem>
                                    <SelectItem value="1">X - MIPA 1</SelectItem>
                                    <SelectItem value="2">X - MIPA 2</SelectItem>
                                </SelectContent>
                            </Select>
                            <div className="flex items-center gap-2">
                                <Input
                                    type="date"
                                    className="h-9 w-[140px]"
                                    placeholder="Mulai"
                                    value={startDate}
                                    onChange={(e) => setStartDate(e.target.value)}
                                />
                                <span className="text-muted-foreground">-</span>
                                <Input
                                    type="date"
                                    className="h-9 w-[140px]"
                                    placeholder="Selesai"
                                    value={endDate}
                                    onChange={(e) => setEndDate(e.target.value)}
                                />
                            </div>
                        </div>
                    </div>
                </CardHeader>
                <CardContent className="pt-6">
                    <DataTable columns={columns} data={mockAttendance} searchColumn="teacher" searchPlaceholder="Cari nama guru..." />
                </CardContent>
            </Card>
        </div>
    );
}
