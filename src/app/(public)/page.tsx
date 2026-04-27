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
    { value: "85+", label: "Sekolah" },
    { value: "1250+", label: "Guru" },
    { value: "50K+", label: "Siswa" },
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
                    <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
                        <div className="text-left max-w-3xl">
                            <div className="inline-flex items-center gap-2 rounded-full border bg-background/80 backdrop-blur-sm px-4 py-1.5 text-sm font-medium text-muted-foreground mb-8 shadow-sm">
                                <Zap className="h-3.5 w-3.5 text-primary" />
                                Diakses sekolah, siswa dan orangtua
                            </div>

                            <h1 className="text-4xl font-extrabold tracking-tight sm:text-5xl lg:text-6xl">
                                SIAKAD PLUS - <span className="text-primary">Software Manajemen Sekolah</span>
                            </h1>

                            <p className="mt-6 text-lg text-muted-foreground leading-relaxed max-w-2xl">
                                Software manajemen sekolah terbaik dan termurah di Indonesia. Fitur lengkap dan sesuai kebutuhan. Tampilan menarik dan mudah digunakan. Keamanan data terjamin.
                            </p>

                            <div className="mt-10 flex flex-col sm:flex-row gap-4">
                                <Button
                                    size="lg"
                                    asChild
                                    className="shadow-lg shadow-primary/25 text-base px-8"
                                >
                                    <Link href="/register">
                                        Daftarkan Sekolah Anda
                                        <ArrowRight className="ml-2 h-4 w-4" />
                                    </Link>
                                </Button>
                                <Button size="lg" variant="outline" asChild className="text-base px-8">
                                    <Link href="#fitur">Lihat Fitur</Link>
                                </Button>
                            </div>
                        </div>

                        <div className="relative hidden lg:block">
                            <div className="relative z-10 animate-in fade-in slide-in-from-right-8 duration-1000">
                                <img
                                    src="/hero-img.png"
                                    alt="SIAKAD PLUS Hero"
                                    className="w-full h-auto drop-shadow-2xl rounded-2xl"
                                />

                                {/* Floating elements like Laravel version */}
                                <div className="absolute -top-6 -left-6 bg-background p-4 rounded-2xl shadow-xl border animate-bounce duration-[3000ms]">
                                    <div className="flex items-center gap-3">
                                        <div className="h-10 w-10 rounded-full bg-primary/10 flex items-center justify-center">
                                            <img src="/user-avatar.png" alt="" className="h-8 w-8 rounded-full" />
                                        </div>
                                        <div>
                                            <p className="text-xs font-bold">Top Rated</p>
                                            <p className="text-[10px] text-muted-foreground">Sistem Terbaik</p>
                                        </div>
                                    </div>
                                </div>

                                <div className="absolute -bottom-6 right-10 bg-background p-4 rounded-xl shadow-xl border">
                                    <p className="text-sm font-bold text-primary">SIAKAD PLUS</p>
                                </div>
                            </div>

                            {/* Decorative Blur */}
                            <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 h-full w-full bg-primary/10 blur-[100px] -z-10 rounded-full" />
                        </div>
                    </div>
                </div>
            </section>

            {/* Stats */}
            <section className="border-y bg-muted/30">
                <div className="mx-auto max-w-7xl px-4 py-12 sm:px-6 lg:px-8">
                    <div className="flex justify-center items-center gap-12 md:gap-24">
                        {stats.map((stat) => (
                            <div key={stat.label} className="text-center">
                                <p className="text-4xl font-extrabold text-primary">
                                    {stat.value}
                                </p>
                                <p className="mt-2 text-base text-muted-foreground font-medium uppercase tracking-wider">
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
                            Fitur &amp; Keunggulan{" "}
                            <span className="text-primary">SIAKAD PLUS</span>
                        </h2>
                        <p className="mt-4 text-muted-foreground leading-relaxed">
                            Beragam fitur untuk mendukung ekosistem digital sekolah secara efisien.
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
                                Kenapa Pilih{" "}
                                <span className="text-primary">SIAKAD PLUS</span>?
                            </h2>
                            <p className="mt-4 text-primary font-medium text-lg">
                                Gaya modern dan unik
                            </p>
                            <p className="mt-4 text-muted-foreground leading-relaxed">
                                SIAKAD PLUS menawarkan teknologi canggih, mudah digunakan, dan solusi personal. Menyederhanakan komunikasi, menyederhanakan tugas administratif, dan meningkatkan pengalaman pendidikan bagi semua pemangku kepentingan. Dengan SIAKAD PLUS, keunggulan dalam manajemen pendidikan akan terjamin.
                            </p>

                            <div className="mt-8 space-y-4">
                                {[
                                    {
                                        icon: CreditCard,
                                        title: "Affordable price",
                                        desc: "Harga yang terjangkau untuk semua kalangan",
                                    },
                                    {
                                        icon: ClipboardCheck,
                                        title: "Easy to manage admin panel",
                                        desc: "Pengelolaan panel admin mudah dan praktis",
                                    },
                                    {
                                        icon: Shield,
                                        title: "Data Security",
                                        desc: "Tingkat keamanan data yang terjamin kuat",
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
                            <div className="aspect-square rounded-2xl bg-gradient-to-br from-primary/20 via-primary/10 to-transparent p-4 flex items-center justify-center overflow-hidden">
                                <img
                                    src="/why-best.png"
                                    alt="Why Choose SIAKAD PLUS"
                                    className="w-full h-full object-contain rounded-xl drop-shadow-xl"
                                />
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {/* CTA */}
            <section id="kontak" className="py-24 sm:py-32">
                <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                    <div className="relative rounded-3xl bg-primary px-8 py-16 overflow-hidden">
                        <div className="absolute inset-0 bg-[linear-gradient(45deg,transparent_25%,rgba(255,255,255,0.05)_50%,transparent_75%)] bg-[size:200px_200px]" />

                        <div className="relative z-10 grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
                            <div className="order-2 lg:order-1 text-center lg:text-left">
                                <h2 className="text-3xl font-bold sm:text-4xl text-primary-foreground">
                                    Download Aplikasi Sekarang
                                </h2>
                                <p className="mt-4 max-w-2xl opacity-90 text-primary-foreground">
                                    Nikmati kemudahan akses SIAKAD PLUS langsung dari smartphone Anda.
                                    Kelola tugas, jadwal, dan komunikasi di mana saja dan kapan saja.
                                </p>
                                <div className="mt-8 flex flex-col sm:flex-row gap-4 justify-center lg:justify-start">
                                    <a href="#" className="transition-transform hover:scale-105 active:scale-95">
                                        <img src="/google-play.png" alt="Google Play" className="h-12 w-auto" />
                                    </a>
                                    <a href="#" className="transition-transform hover:scale-105 active:scale-95">
                                        <img src="/app-store.png" alt="App Store" className="h-12 w-auto" />
                                    </a>
                                </div>
                            </div>

                            <div className="order-1 lg:order-2 flex justify-center">
                                <img
                                    src="/our-app.png"
                                    alt="SIAKAD PLUS Mobile App"
                                    className="max-h-[400px] w-auto drop-shadow-2xl"
                                />
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    );
}
