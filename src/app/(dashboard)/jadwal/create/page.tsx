"use client";

import { PageHeader } from "@/components/shared/PageHeader";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Calendar, Save, Plus, Trash2, Clock } from "lucide-react";
import { useState } from "react";
import { toast } from "sonner";

export default function CreateJadwalPage() {
    const [loading, setLoading] = useState(false);

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        setLoading(true);
        setTimeout(() => {
            setLoading(false);
            toast.success("Jadwal berhasil disimpan secara lokal (Simulasi)");
        }, 1000);
    };

    return (
        <div className="space-y-6">
            <PageHeader
                title="Buat Jadwal Pelajaran"
                description="Atur jadwal pelajaran untuk setiap kelas dan guru"
            >
                <Button variant="outline" size="sm">Batal</Button>
                <Button size="sm" className="gap-2" onClick={handleSubmit} disabled={loading}>
                    <Save className="h-4 w-4" />
                    Simpan Jadwal
                </Button>
            </PageHeader>

            <div className="grid gap-6 lg:grid-cols-3">
                {/* Konfigurasi Dasar */}
                <Card className="lg:col-span-1">
                    <CardHeader>
                        <CardTitle className="text-base">Konfigurasi</CardTitle>
                        <CardDescription>Pilih kelas dan periode jadwal</CardDescription>
                    </CardHeader>
                    <CardContent className="space-y-4">
                        <div className="space-y-2">
                            <Label>Tingkat Kelas</Label>
                            <Select defaultValue="10">
                                <SelectTrigger>
                                    <SelectValue placeholder="Pilih Tingkat" />
                                </SelectTrigger>
                                <SelectContent>
                                    <SelectItem value="10">Kelas 10</SelectItem>
                                    <SelectItem value="11">Kelas 11</SelectItem>
                                    <SelectItem value="12">Kelas 12</SelectItem>
                                </SelectContent>
                            </Select>
                        </div>
                        <div className="space-y-2">
                            <Label>Kelas / Section</Label>
                            <Select defaultValue="rpl1">
                                <SelectTrigger>
                                    <SelectValue placeholder="Pilih Kelas" />
                                </SelectTrigger>
                                <SelectContent>
                                    <SelectItem value="rpl1">X RPL 1</SelectItem>
                                    <SelectItem value="rpl2">X RPL 2</SelectItem>
                                    <SelectItem value="tkj1">X TKJ 1</SelectItem>
                                </SelectContent>
                            </Select>
                        </div>
                        <div className="space-y-2">
                            <Label>Hari</Label>
                            <Select defaultValue="senin">
                                <SelectTrigger>
                                    <SelectValue placeholder="Pilih Hari" />
                                </SelectTrigger>
                                <SelectContent>
                                    <SelectItem value="senin">Senin</SelectItem>
                                    <SelectItem value="selasa">Selasa</SelectItem>
                                    <SelectItem value="rabu">Rabu</SelectItem>
                                    <SelectItem value="kamis">Kamis</SelectItem>
                                    <SelectItem value="jumat">Jumat</SelectItem>
                                </SelectContent>
                            </Select>
                        </div>
                    </CardContent>
                </Card>

                {/* Detail Jadwal */}
                <Card className="lg:col-span-2">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0">
                        <div>
                            <CardTitle className="text-base">Detail Mata Pelajaran</CardTitle>
                            <CardDescription>Tambahkan mata pelajaran ke dalam jadwal</CardDescription>
                        </div>
                        <Button variant="outline" size="sm" className="gap-2">
                            <Plus className="h-4 w-4" />
                            Tambah Jam
                        </Button>
                    </CardHeader>
                    <CardContent>
                        <div className="space-y-4">
                            {[1, 2, 3].map((item) => (
                                <div key={item} className="flex flex-col md:flex-row gap-4 p-4 border rounded-lg bg-muted/30">
                                    <div className="flex-1 space-y-4">
                                        <div className="grid grid-cols-2 gap-4">
                                            <div className="space-y-2">
                                                <Label className="text-xs">Mata Pelajaran</Label>
                                                <Select>
                                                    <SelectTrigger className="h-9">
                                                        <SelectValue placeholder="Pilih Mapel" />
                                                    </SelectTrigger>
                                                    <SelectContent>
                                                        <SelectItem value="mat">Matematika</SelectItem>
                                                        <SelectItem value="ind">Bahasa Indonesia</SelectItem>
                                                        <SelectItem value="ing">Bahasa Inggris</SelectItem>
                                                        <SelectItem value="pro">Pemrograman Web</SelectItem>
                                                    </SelectContent>
                                                </Select>
                                            </div>
                                            <div className="space-y-2">
                                                <Label className="text-xs">Guru Pengajar</Label>
                                                <Select>
                                                    <SelectTrigger className="h-9">
                                                        <SelectValue placeholder="Pilih Guru" />
                                                    </SelectTrigger>
                                                    <SelectContent>
                                                        <SelectItem value="g1">Budi Santoso, S.Kom</SelectItem>
                                                        <SelectItem value="g2">Siti Aminah, M.Pd</SelectItem>
                                                        <SelectItem value="g3">Andi Wijaya, S.T</SelectItem>
                                                    </SelectContent>
                                                </Select>
                                            </div>
                                        </div>
                                        <div className="grid grid-cols-3 gap-4">
                                            <div className="space-y-2">
                                                <Label className="text-xs">Jam Mulai</Label>
                                                <div className="relative">
                                                    <Clock className="absolute left-2 top-2.5 h-4 w-4 text-muted-foreground" />
                                                    <Input type="time" className="pl-8 h-9" />
                                                </div>
                                            </div>
                                            <div className="space-y-2">
                                                <Label className="text-xs">Jam Selesai</Label>
                                                <div className="relative">
                                                    <Clock className="absolute left-2 top-2.5 h-4 w-4 text-muted-foreground" />
                                                    <Input type="time" className="pl-8 h-9" />
                                                </div>
                                            </div>
                                            <div className="space-y-2">
                                                <Label className="text-xs">Ruangan</Label>
                                                <Input placeholder="Contoh: Lab 1" className="h-9" />
                                            </div>
                                        </div>
                                    </div>
                                    <div className="flex items-end pb-1">
                                        <Button variant="ghost" size="icon" className="text-destructive hover:text-destructive hover:bg-destructive/10 h-9 w-9">
                                            <Trash2 className="h-4 w-4" />
                                        </Button>
                                    </div>
                                </div>
                            ))}
                        </div>
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}
