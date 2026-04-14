import { PageHeader } from "@/components/shared/PageHeader";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { School, Plus, Users, BookOpen } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";

const kelasData = [
    { id: "1", nama: "X IPA 1", wali_kelas: "Budi Santoso, S.Pd", jumlah_siswa: 32, kapasitas: 35, tahun_ajaran: "2024/2025" },
    { id: "2", nama: "X IPA 2", wali_kelas: "Sari Dewi, M.Pd", jumlah_siswa: 30, kapasitas: 35, tahun_ajaran: "2024/2025" },
    { id: "3", nama: "X IPS 1", wali_kelas: "Ahmad Rizki, S.Si", jumlah_siswa: 28, kapasitas: 35, tahun_ajaran: "2024/2025" },
    { id: "4", nama: "XI IPA 1", wali_kelas: "Dewi Rahayu, M.Sc", jumlah_siswa: 31, kapasitas: 35, tahun_ajaran: "2024/2025" },
    { id: "5", nama: "XI IPS 2", wali_kelas: "Rina Wulandari, S.Pd", jumlah_siswa: 29, kapasitas: 35, tahun_ajaran: "2024/2025" },
    { id: "6", nama: "XII IPA 3", wali_kelas: "Budi Santoso, S.Pd", jumlah_siswa: 27, kapasitas: 35, tahun_ajaran: "2024/2025" },
];

export default function KelasPage() {
    return (
        <div className="space-y-6">
            <PageHeader
                title="Data Kelas"
                description="Kelola semua kelas yang ada di sekolah"
            >
                <Button size="sm" className="gap-2">
                    <Plus className="h-4 w-4" />
                    Tambah Kelas
                </Button>
            </PageHeader>

            {/* Stats */}
            <div className="grid grid-cols-2 gap-3 sm:grid-cols-3">
                {[
                    { label: "Total Kelas", value: "42", icon: School, color: "bg-blue-50 text-blue-700 dark:bg-blue-950/50 dark:text-blue-300 border border-blue-100 dark:border-blue-900" },
                    { label: "Total Siswa", value: "1,245", icon: Users, color: "bg-emerald-50 text-emerald-700 dark:bg-emerald-950/50 dark:text-emerald-300 border border-emerald-100 dark:border-emerald-900" },
                    { label: "Mata Pelajaran", value: "18", icon: BookOpen, color: "bg-purple-50 text-purple-700 dark:bg-purple-950/50 dark:text-purple-300 border border-purple-100 dark:border-purple-900" },
                ].map((s) => (
                    <div key={s.label} className={`rounded-xl p-4 ${s.color} flex items-center gap-3`}>
                        <s.icon className="h-6 w-6 opacity-70 shrink-0" />
                        <div>
                            <div className="text-2xl font-bold tracking-tight">{s.value}</div>
                            <div className="text-xs font-medium opacity-80">{s.label}</div>
                        </div>
                    </div>
                ))}
            </div>

            {/* Kelas Grid */}
            <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                {kelasData.map((kelas) => {
                    const persen = Math.round((kelas.jumlah_siswa / kelas.kapasitas) * 100);
                    return (
                        <Card key={kelas.id} className="border-0 shadow-sm hover:shadow-md transition-shadow">
                            <CardHeader className="pb-3">
                                <div className="flex items-center justify-between">
                                    <CardTitle className="text-base">{kelas.nama}</CardTitle>
                                    <Badge variant="outline" className="text-xs">{kelas.tahun_ajaran}</Badge>
                                </div>
                            </CardHeader>
                            <CardContent className="space-y-3">
                                <div className="text-sm text-muted-foreground">
                                    <span className="font-medium text-foreground">Wali Kelas:</span> {kelas.wali_kelas}
                                </div>
                                <div className="space-y-1.5">
                                    <div className="flex justify-between text-sm">
                                        <span className="text-muted-foreground">Siswa</span>
                                        <span className="font-medium">{kelas.jumlah_siswa}/{kelas.kapasitas}</span>
                                    </div>
                                    <div className="h-2 rounded-full bg-muted overflow-hidden">
                                        <div
                                            className="h-full rounded-full bg-primary transition-all"
                                            style={{ width: `${persen}%` }}
                                        />
                                    </div>
                                    <div className="text-xs text-muted-foreground text-right">{persen}% terisi</div>
                                </div>
                                <div className="flex gap-2 pt-1">
                                    <Button variant="outline" size="sm" className="flex-1 text-xs">Detail</Button>
                                    <Button variant="outline" size="sm" className="flex-1 text-xs">Edit</Button>
                                </div>
                            </CardContent>
                        </Card>
                    );
                })}
            </div>
        </div>
    );
}
