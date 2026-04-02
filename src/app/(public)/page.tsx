import Link from "next/link";
import { Button } from "@/components/ui/button";
import {
    GraduationCap,
    Users,
    ClipboardCheck,
    BarChart3,
    Shield,
    Zap,
    ArrowRight,
    BookOpen,
    Calendar,
    CreditCard,
} from "lucide-react";

const features = [
    {
        icon: Users,
        title: "Manajemen Siswa & Guru",
        description:
            "Kelola data siswa, guru, dan staf dengan mudah. Lengkap dengan profil, kontak, dan dokumen.",
    },
    {
        icon: ClipboardCheck,
        title: "Kehadiran Digital",
        description:
            "Sistem absensi digital yang akurat. Pantau kehadiran siswa dan guru secara real-time.",
    },
    {
        icon: BookOpen,
        title: "Akademik Terintegrasi",
        description:
            "Kelola pelajaran, jadwal, ujian, dan penugasan dalam satu platform terpadu.",
    },
    {
        icon: Calendar,
        title: "Jadwal & Kalender",
        description:
            "Atur jadwal pelajaran, hari libur, dan tahun ajaran dengan mudah dan terstruktur.",
    },
    {
        icon: CreditCard,
        title: "Keuangan Sekolah",
        description:
            "Kelola biaya sekolah, pengeluaran, dan pembayaran siswa secara transparan.",
    },
    {
        icon: BarChart3,
        title: "Laporan & Analitik",
        description:
            "Dashboard interaktif dengan grafik dan statistik untuk pengambilan keputusan.",
    },
];

const stats = [
    { value: "500+", label: "Sekolah" },
    { value: "50K+", label: "Pengguna Aktif" },
    { value: "99.9%", label: "Uptime" },
    { value: "24/7", label: "Dukungan" },
];

export default function LandingPage() {
    return (
        <div className="flex flex-col">
            {/* Hero Section */}
            <section className="relative overflow-hidden">
                {/* Background */}
                <div className="absolute inset-0 -z-10">
                    <div className="absolute top-0 left-1/2 -translate-x-1/2 h-[600px] w-[600px] rounded-full bg-primary/8 blur-3xl" />
                    <div className="absolute bottom-0 right-0 h-[400px] w-[400px] rounded-full bg-primary/5 blur-3xl" />
                    <div className="absolute inset-0 bg-[linear-gradient(to_right,transparent_0%,transparent_49%,var(--border)_50%,transparent_51%)] bg-[size:60px_60px] opacity-[0.15]" />
                </div>

                <div className="mx-auto max-w-7xl px-4 py-24 sm:px-6 sm:py-32 lg:px-8 lg:py-40">
                    <div className="text-center max-w-3xl mx-auto">
                        <div className="inline-flex items-center gap-2 rounded-full border bg-background/80 backdrop-blur-sm px-4 py-1.5 text-sm font-medium text-muted-foreground mb-8 shadow-sm">
                            <Zap className="h-3.5 w-3.5 text-primary" />
                            Platform Manajemen Sekolah Modern
                        </div>

                        <h1 className="text-4xl font-extrabold tracking-tight sm:text-5xl lg:text-6xl">
                            Kelola Sekolah Anda{" "}
                            <span className="relative">
                                <span className="relative z-10 text-primary">Lebih Mudah</span>
                                <span className="absolute bottom-1 left-0 right-0 h-3 bg-primary/15 rounded-sm -z-0" />
                            </span>{" "}
                            dengan eSchool
                        </h1>

                        <p className="mt-6 text-lg text-muted-foreground leading-relaxed max-w-2xl mx-auto">
                            Sistem manajemen sekolah digital yang terintegrasi untuk
                            mengelola administrasi, akademik, keuangan, dan komunikasi —
                            semua dalam satu platform.
                        </p>

                        <div className="mt-10 flex flex-col sm:flex-row gap-4 justify-center">
                            <Button
                                size="lg"
                                asChild
                                className="shadow-lg shadow-primary/25 text-base px-8"
                            >
                                <Link href="/register">
                                    Mulai Gratis
                                    <ArrowRight className="ml-2 h-4 w-4" />
                                </Link>
                            </Button>
                            <Button size="lg" variant="outline" asChild className="text-base px-8">
                                <Link href="#fitur">Lihat Fitur</Link>
                            </Button>
                        </div>
                    </div>
                </div>
            </section>

            {/* Stats */}
            <section className="border-y bg-muted/30">
                <div className="mx-auto max-w-7xl px-4 py-12 sm:px-6 lg:px-8">
                    <div className="grid grid-cols-2 gap-8 md:grid-cols-4">
                        {stats.map((stat) => (
                            <div key={stat.label} className="text-center">
                                <p className="text-3xl font-extrabold text-primary">
                                    {stat.value}
                                </p>
                                <p className="mt-1 text-sm text-muted-foreground font-medium">
                                    {stat.label}
                                </p>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Features */}
            <section id="fitur" className="py-24 sm:py-32">
                <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                    <div className="text-center max-w-2xl mx-auto mb-16">
                        <h2 className="text-3xl font-bold tracking-tight sm:text-4xl">
                            Fitur Lengkap untuk{" "}
                            <span className="text-primary">Sekolah Modern</span>
                        </h2>
                        <p className="mt-4 text-muted-foreground leading-relaxed">
                            Semua yang Anda butuhkan untuk mengelola sekolah secara efisien,
                            dari manajemen data hingga laporan analitik.
                        </p>
                    </div>

                    <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
                        {features.map((feature) => (
                            <div
                                key={feature.title}
                                className="group relative rounded-2xl border bg-card p-6 transition-all hover:shadow-lg hover:shadow-primary/5 hover:-translate-y-0.5"
                            >
                                <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-primary/10 text-primary mb-4 transition-colors group-hover:bg-primary group-hover:text-primary-foreground">
                                    <feature.icon className="h-6 w-6" />
                                </div>
                                <h3 className="text-lg font-semibold">{feature.title}</h3>
                                <p className="mt-2 text-sm text-muted-foreground leading-relaxed">
                                    {feature.description}
                                </p>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* About */}
            <section
                id="tentang"
                className="py-24 sm:py-32 bg-muted/30 border-y"
            >
                <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                    <div className="grid gap-12 lg:grid-cols-2 items-center">
                        <div>
                            <h2 className="text-3xl font-bold tracking-tight sm:text-4xl">
                                Mengapa Memilih{" "}
                                <span className="text-primary">eSchool</span>?
                            </h2>
                            <p className="mt-4 text-muted-foreground leading-relaxed">
                                eSchool dirancang khusus untuk kebutuhan sekolah di Indonesia.
                                Dengan antarmuka yang mudah digunakan dan fitur yang lengkap,
                                eSchool membantu sekolah bertransformasi digital.
                            </p>

                            <div className="mt-8 space-y-4">
                                {[
                                    {
                                        icon: Shield,
                                        title: "Aman & Terpercaya",
                                        desc: "Data terenkripsi dengan standar keamanan enterprise",
                                    },
                                    {
                                        icon: Zap,
                                        title: "Cepat & Responsif",
                                        desc: "Performa optimal di semua perangkat dan jaringan",
                                    },
                                    {
                                        icon: GraduationCap,
                                        title: "Khusus Pendidikan",
                                        desc: "Dirancang sesuai kebutuhan dan kurikulum Indonesia",
                                    },
                                ].map((item) => (
                                    <div
                                        key={item.title}
                                        className="flex items-start gap-4 rounded-xl border bg-card p-4"
                                    >
                                        <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-primary/10 text-primary">
                                            <item.icon className="h-5 w-5" />
                                        </div>
                                        <div>
                                            <h3 className="font-semibold">{item.title}</h3>
                                            <p className="text-sm text-muted-foreground">
                                                {item.desc}
                                            </p>
                                        </div>
                                    </div>
                                ))}
                            </div>
                        </div>

                        <div className="relative">
                            <div className="aspect-square rounded-2xl bg-gradient-to-br from-primary/20 via-primary/10 to-transparent p-8 flex items-center justify-center">
                                <div className="text-center space-y-4">
                                    <div className="flex h-24 w-24 mx-auto items-center justify-center rounded-3xl bg-primary text-primary-foreground shadow-2xl shadow-primary/30">
                                        <GraduationCap className="h-12 w-12" />
                                    </div>
                                    <h3 className="text-2xl font-bold">eSchool</h3>
                                    <p className="text-muted-foreground text-sm">
                                        Sistem Manajemen Sekolah Digital
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {/* CTA */}
            <section id="kontak" className="py-24 sm:py-32">
                <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                    <div className="relative rounded-3xl bg-primary px-8 py-16 text-center text-primary-foreground overflow-hidden">
                        <div className="absolute inset-0 bg-[linear-gradient(45deg,transparent_25%,rgba(255,255,255,0.05)_50%,transparent_75%)] bg-[size:200px_200px]" />
                        <div className="relative z-10">
                            <h2 className="text-3xl font-bold sm:text-4xl">
                                Siap Memulai Transformasi Digital?
                            </h2>
                            <p className="mt-4 max-w-2xl mx-auto opacity-90">
                                Bergabung dengan ratusan sekolah yang sudah menggunakan eSchool
                                untuk mengelola administrasi mereka secara efisien.
                            </p>
                            <div className="mt-8 flex flex-col sm:flex-row gap-4 justify-center">
                                <Button
                                    size="lg"
                                    variant="secondary"
                                    asChild
                                    className="text-base px-8"
                                >
                                    <Link href="/register">
                                        Daftar Sekarang
                                        <ArrowRight className="ml-2 h-4 w-4" />
                                    </Link>
                                </Button>
                                <Button
                                    size="lg"
                                    variant="outline"
                                    asChild
                                    className="text-base px-8 border-primary-foreground/30 text-primary-foreground hover:bg-primary-foreground/10"
                                >
                                    <Link href="/login">Sudah Punya Akun</Link>
                                </Button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    );
}
