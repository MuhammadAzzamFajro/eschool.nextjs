"use client";

import { PageHeader } from "@/components/shared/PageHeader";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import {
    Form,
    FormControl,
    FormDescription,
    FormField,
    FormItem,
    FormLabel,
    FormMessage,
} from "@/components/ui/form";
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import * as z from "zod";
import {
    CalendarIcon,
    Upload,
    ArrowLeft,
    Clock,
    BookOpen,
    Users
} from "lucide-react";
import Link from "next/link";
import { useState } from "react";
import { toast } from "sonner";

const attendanceFormSchema = z.object({
    class_id: z.string().min(1, "Silakan pilih kelas."),
    timetable_id: z.string().min(1, "Silakan pilih jadwal."),
    date: z.string().min(1, "Tanggal wajib diisi."),
    matter: z.string().min(5, "Materi minimal 5 karakter."),
    attachments: z.any().optional(),
});

type AttendanceFormValues = z.infer<typeof attendanceFormSchema>;

export default function AddAttendancePage() {
    const [isLoading, setIsLoading] = useState(false);

    const form = useForm<AttendanceFormValues>({
        resolver: zodResolver(attendanceFormSchema),
        defaultValues: {
            date: new Date().toISOString().split('T')[0],
            matter: "",
        },
    });

    async function onSubmit(data: AttendanceFormValues) {
        setIsLoading(true);
        console.log(data);

        // Simulate API call
        await new Promise((resolve) => setTimeout(resolve, 1500));

        toast.success("Data absensi berhasil disimpan!");
        setIsLoading(false);
    }

    return (
        <div className="flex-1 space-y-6 p-4 md:p-8 pt-6 max-w-4xl mx-auto">
            <div className="flex items-center gap-2 text-sm text-muted-foreground mb-2">
                <Link href="/absensi/by-subject" className="hover:text-primary transition-colors flex items-center gap-1">
                    <ArrowLeft className="h-4 w-4" /> Kembali ke Daftar
                </Link>
            </div>

            <PageHeader
                title="Tambah Absensi"
                description="Input data kehadiran siswa untuk sesi mata pelajaran tertentu."
            />

            <Form {...form}>
                <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-6">
                    <Card className="border-none shadow-sm overflow-hidden">
                        <CardHeader className="bg-primary/5 border-b">
                            <CardTitle className="text-lg font-semibold flex items-center gap-2">
                                <BookOpen className="h-5 w-5 text-primary" />
                                Informasi Mata Pelajaran
                            </CardTitle>
                        </CardHeader>
                        <CardContent className="pt-6 space-y-6">
                            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <FormField
                                    control={form.control}
                                    name="class_id"
                                    render={({ field }) => (
                                        <FormItem>
                                            <FormLabel>Kelas</FormLabel>
                                            <Select onValueChange={field.onChange} defaultValue={field.value}>
                                                <FormControl>
                                                    <SelectTrigger>
                                                        <SelectValue placeholder="Pilih Kelas" />
                                                    </SelectTrigger>
                                                </FormControl>
                                                <SelectContent>
                                                    <SelectItem value="1">X - MIPA 1</SelectItem>
                                                    <SelectItem value="2">X - MIPA 2</SelectItem>
                                                    <SelectItem value="3">XI - IIS 1</SelectItem>
                                                </SelectContent>
                                            </Select>
                                            <FormMessage />
                                        </FormItem>
                                    )}
                                />

                                <FormField
                                    control={form.control}
                                    name="date"
                                    render={({ field }) => (
                                        <FormItem>
                                            <FormLabel>Tanggal</FormLabel>
                                            <FormControl>
                                                <div className="relative">
                                                    <CalendarIcon className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                                                    <Input type="date" className="pl-9" {...field} />
                                                </div>
                                            </FormControl>
                                            <FormMessage />
                                        </FormItem>
                                    )}
                                />
                            </div>

                            <FormField
                                control={form.control}
                                name="timetable_id"
                                render={({ field }) => (
                                    <FormItem>
                                        <FormLabel>Jadwal Pelajaran</FormLabel>
                                        <Select onValueChange={field.onChange} defaultValue={field.value}>
                                            <FormControl>
                                                <SelectTrigger>
                                                    <SelectValue placeholder="Pilih Jadwal" />
                                                </SelectTrigger>
                                            </FormControl>
                                            <SelectContent>
                                                <SelectItem value="101">
                                                    <div className="flex items-center gap-2">
                                                        <Clock className="h-3.5 w-3.5 text-muted-foreground" />
                                                        <span>07:30 - 09:00 : Matematika (MTK101)</span>
                                                    </div>
                                                </SelectItem>
                                                <SelectItem value="102">
                                                    <div className="flex items-center gap-2">
                                                        <Clock className="h-3.5 w-3.5 text-muted-foreground" />
                                                        <span>09:15 - 10:45 : Bahasa Indonesia (BIN202)</span>
                                                    </div>
                                                </SelectItem>
                                            </SelectContent>
                                        </Select>
                                        <FormDescription>
                                            Pilih sesi pelajaran yang sesuai dengan jadwal guru hari ini.
                                        </FormDescription>
                                        <FormMessage />
                                    </FormItem>
                                )}
                            />
                        </CardContent>
                    </Card>

                    <Card className="border-none shadow-sm overflow-hidden">
                        <CardHeader className="bg-primary/5 border-b">
                            <CardTitle className="text-lg font-semibold flex items-center gap-2">
                                <Upload className="h-5 w-5 text-primary" />
                                Materi & Dokumentasi
                            </CardTitle>
                        </CardHeader>
                        <CardContent className="pt-6 space-y-6">
                            <FormField
                                control={form.control}
                                name="matter"
                                render={({ field }) => (
                                    <FormItem>
                                        <FormLabel>Materi Pelajaran</FormLabel>
                                        <FormControl>
                                            <Textarea
                                                placeholder="Tuliskan ringkasan materi yang diajarkan hari ini..."
                                                className="min-h-[120px] scroll-smooth"
                                                {...field}
                                            />
                                        </FormControl>
                                        <FormMessage />
                                    </FormItem>
                                )}
                            />

                            <FormItem>
                                <FormLabel>Lampiran (Opsional)</FormLabel>
                                <FormControl>
                                    <div className="flex items-center justify-center w-full">
                                        <label className="flex flex-col items-center justify-center w-full h-32 border-2 border-dashed rounded-lg cursor-pointer bg-muted/50 hover:bg-muted transition-colors">
                                            <div className="flex flex-col items-center justify-center pt-5 pb-6">
                                                <Upload className="w-8 h-8 mb-3 text-muted-foreground" />
                                                <p className="mb-2 text-sm text-muted-foreground">
                                                    <span className="font-semibold">Klik untuk unggah</span> atau seret file
                                                </p>
                                                <p className="text-xs text-muted-foreground">
                                                    PNG, JPG atau PDF (Maks. 2MB)
                                                </p>
                                            </div>
                                            <input type="file" className="hidden" />
                                        </label>
                                    </div>
                                </FormControl>
                            </FormItem>
                        </CardContent>
                    </Card>

                    <Card className="border-none shadow-sm overflow-hidden bg-primary/5 border border-primary/10">
                        <CardContent className="p-6 flex flex-col md:flex-row items-center justify-between gap-4">
                            <div className="flex items-center gap-3">
                                <div className="h-10 w-10 rounded-full bg-primary/20 flex items-center justify-center">
                                    <Users className="h-5 w-5 text-primary" />
                                </div>
                                <div>
                                    <p className="font-medium">Siap untuk menandai kehadiran?</p>
                                    <p className="text-sm text-muted-foreground">Langkah selanjutnya adalah mengisi daftar hadir siswa.</p>
                                </div>
                            </div>
                            <Button type="submit" size="lg" disabled={isLoading} className="w-full md:w-auto shadow-lg shadow-primary/25">
                                {isLoading ? "Menyimpan..." : "Simpan & Lanjut Isi Presensi"}
                            </Button>
                        </CardContent>
                    </Card>
                </form>
            </Form>
        </div>
    );
}
