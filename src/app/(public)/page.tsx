import Link from "next/link";
import { Button } from "@/components/ui/button";
import {
    Users,
    BookOpen,
    MonitorPlay,
    Database,
    AlertCircle,
    Trophy,
    Calendar,
    ClipboardCheck,
    FileText,
    CheckCircle2,
    Phone,
    Mail,
    MapPin,
    ArrowRight
} from "lucide-react";

const features = [
    { icon: Users, title: "Manajemen Siswa" },
    { icon: BookOpen, title: "Manajemen Akademik" },
    { icon: MonitorPlay, title: "Manajemen Kelas" },
    { icon: Database, title: "Manajemen Data" },
    { icon: AlertCircle, title: "Manajemen Pelanggaran" },
    { icon: Trophy, title: "Manajemen Ekstrakurikuler" },
    { icon: Calendar, title: "Manajemen Jadwal" },
    { icon: ClipboardCheck, title: "Manajemen Kehadiran" },
    { icon: FileText, title: "Penilaian / Nilai" },
];

const stats = [
    { value: "10+", label: "Sekolah" },
    { value: "5+", label: "Guru" },
    { value: "4+", label: "Siswa" },
];

export default function LandingPage() {
    return (
        <div className="flex flex-col">
            {/* Hero Section */}
            <section className="relative overflow-hidden bg-background">
                <div className="absolute inset-0 -z-10">
                    <div className="absolute top-0 right-0 h-[600px] w-[600px] rounded-full bg-primary/5 blur-3xl" />
                    <div className="absolute inset-0 bg-[linear-gradient(to_right,transparent_0%,transparent_49%,var(--border)_50%,transparent_51%)] bg-[size:60px_60px] opacity-[0.1]" />
                </div>

                <div className="mx-auto max-w-7xl px-4 py-16 sm:px-6 sm:py-24 lg:px-8 lg:py-32">
                    <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
                        <div className="text-left max-w-2xl">
                            <h1 className="text-4xl font-extrabold tracking-tight sm:text-5xl lg:text-6xl text-foreground">
                                Diakses sekolah, siswa<br/>dan orangtua
                            </h1>
                            <p className="mt-6 text-xl text-muted-foreground leading-relaxed">
                                Software manajemen sekolah terbaik dan termurah di Indonesia. Fitur lengkap dan sesuai kebutuhan. Tampilan menarik dan mudah digunakan. Keamanan data terjamin.
                            </p>
                            <div className="mt-8">
                                <Button
                                    size="lg"
                                    asChild
                                    className="shadow-lg shadow-primary/25 text-base px-8 bg-primary text-primary-foreground hover:bg-primary/90 rounded-full"
                                >
                                    <Link href="#harga">
                                        Uji Coba
                                    </Link>
                                </Button>
                            </div>
                        </div>

                        <div className="relative hidden lg:block">
                            <div className="relative z-10">
                                <img
                                    src="/hero-img.png"
                                    alt="eSCHOOL Hero"
                                    className="w-full max-w-md mx-auto h-auto drop-shadow-2xl"
                                />
                                
                                <div className="absolute top-10 -right-4 bg-background p-4 rounded-2xl shadow-xl border animate-bounce duration-[3000ms]">
                                    <div className="flex items-center gap-3">
                                        <div className="h-10 w-10 rounded-full bg-primary/10 flex items-center justify-center">
                                            <img src="/user-avatar.png" alt="" className="h-8 w-8 rounded-full" />
                                        </div>
                                        <div>
                                            <p className="text-xs font-bold text-foreground">Top Rated</p>
                                            <p className="text-[10px] text-muted-foreground">Sistem Terbaik</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {/* Features */}
            <section id="fitur" className="py-20 bg-background">
                <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                    <div className="text-center mb-12">
                        <div className="inline-block border-b-2 border-primary pb-2 mb-8">
                            <h2 className="text-2xl font-bold tracking-tight text-foreground">
                                Fitur & Keunggulan eSchool
                            </h2>
                        </div>
                    </div>

                    <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                        {features.map((feature) => (
                            <div
                                key={feature.title}
                                className="flex items-center gap-4 rounded-xl border bg-card p-6 transition-all hover:shadow-md hover:border-primary/50"
                            >
                                <div className="flex h-12 w-12 shrink-0 items-center justify-center rounded-lg bg-primary/10 text-primary">
                                    <feature.icon className="h-6 w-6" />
                                </div>
                                <h3 className="font-semibold text-base">{feature.title}</h3>
                            </div>
                        ))}
                    </div>
                    <div className="mt-10 text-center">
                        <Button size="lg" className="bg-primary text-primary-foreground hover:bg-primary/90 rounded-full px-8">
                            Lihat Semua Fitur
                        </Button>
                    </div>
                </div>
            </section>

            {/* Stats */}
            <section className="bg-[#f0f7fd] py-12">
                <div className="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8">
                    <div className="grid grid-cols-3 gap-8">
                        {stats.map((stat) => (
                            <div key={stat.label} className="text-center">
                                <p className="text-5xl font-extrabold text-foreground">
                                    {stat.value}
                                </p>
                                <p className="mt-2 text-base text-muted-foreground font-semibold uppercase tracking-wider">
                                    {stat.label}
                                </p>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            {/* Platform Manajemen Sekolah Terbaik */}
            <section className="py-24 bg-background overflow-hidden">
                <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                    <div className="grid lg:grid-cols-2 gap-12 items-center">
                        <div>
                            <div className="inline-block text-xs font-bold bg-muted px-3 py-1 rounded-full mb-4">
                                Platform Manajemen Sekolah
                            </div>
                            <h2 className="text-3xl font-bold tracking-tight sm:text-4xl mb-6 text-foreground">
                                Platform Manajemen Sekolah Terbaik
                            </h2>
                            <p className="text-muted-foreground leading-relaxed mb-8">
                                eSchool adalah sistem manajemen sekolah digital terdepan di Indonesia. Menawarkan fitur canggih, mudah digunakan, dan solusi personal. Menyederhanakan komunikasi, menyederhanakan tugas administratif, dan meningkatkan pengalaman pendidikan bagi semua pemangku kepentingan. Dengan eSchool, keunggulan dalam manajemen pendidikan akan terjamin secara efisien.
                            </p>
                            
                            <ul className="space-y-4">
                                {['Harga terjangkau', 'UI dan UX mudah dipahami admin', 'Keamanan data terjamin'].map((item) => (
                                    <li key={item} className="flex items-center gap-3">
                                        <CheckCircle2 className="h-5 w-5 text-primary" />
                                        <span className="font-medium text-foreground">{item}</span>
                                    </li>
                                ))}
                            </ul>
                        </div>
                        
                        <div className="relative">
                            <div className="relative rounded-2xl overflow-hidden aspect-video shadow-xl">
                                <img src="/why-best.png" alt="Platform Manajemen Sekolah Terbaik" className="object-cover w-full h-full" />
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {/* Pricing Section */}
            <section id="harga" className="py-24 bg-[#f8fafc]">
                <div className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8">
                    <div className="text-center mb-16">
                        <div className="inline-block border-b-2 border-primary pb-2">
                            <h2 className="text-2xl font-bold tracking-tight text-foreground">
                                Paket Harga Fleksibel
                            </h2>
                        </div>
                    </div>
                    
                    <div className="grid md:grid-cols-3 gap-8">
                        {/* Uji Coba */}
                        <div className="rounded-2xl border border-primary/20 bg-background overflow-hidden flex flex-col relative">
                            <div className="absolute top-0 right-0 bg-primary text-primary-foreground px-4 py-1 text-xs font-bold rounded-bl-lg">
                                Gratis
                            </div>
                            <div className="p-8 pb-4">
                                <h3 className="text-xl font-bold text-foreground">Uji Coba</h3>
                                <p className="text-sm text-muted-foreground mt-1">Gratis (14 Hari)</p>
                            </div>
                            <div className="px-8 flex-1">
                                <ul className="space-y-4 mt-6 mb-8 text-base text-muted-foreground">
                                    <li className="flex items-center gap-2"><CheckCircle2 className="h-4 w-4 text-green-500"/> Manajemen Siswa</li>
                                    <li className="flex items-center gap-2"><CheckCircle2 className="h-4 w-4 text-green-500"/> Manajemen Akademik</li>
                                    <li className="flex items-center gap-2"><CheckCircle2 className="h-4 w-4 text-green-500"/> Manajemen Kelas</li>
                                    <li className="flex items-center gap-2"><CheckCircle2 className="h-4 w-4 text-green-500"/> Manajemen Data</li>
                                    <li className="flex items-center gap-2"><CheckCircle2 className="h-4 w-4 text-green-500"/> Manajemen Pelanggaran</li>
                                    <li className="flex items-center gap-2 opacity-50"><CheckCircle2 className="h-4 w-4 text-muted-foreground"/> Manajemen Ekstrakurikuler</li>
                                    <li className="flex items-center gap-2 opacity-50"><CheckCircle2 className="h-4 w-4 text-muted-foreground"/> Manajemen Jadwal</li>
                                </ul>
                            </div>
                            <div className="p-6 pt-0 mt-auto">
                                <Button variant="outline" className="w-full rounded-full border-primary text-primary hover:bg-primary/10">Pilih</Button>
                            </div>
                        </div>

                        {/* Basic Plan */}
                        <div className="rounded-2xl border border-primary/20 bg-background overflow-hidden flex flex-col relative shadow-lg scale-105 z-10">
                            <div className="absolute top-0 right-0 bg-primary text-primary-foreground px-4 py-1 text-xs font-bold rounded-bl-lg">
                                Gratis
                            </div>
                            <div className="p-8 pb-4">
                                <h3 className="text-xl font-bold text-foreground">Basic Plan (Free Trial)</h3>
                                <p className="text-sm text-muted-foreground mt-1">Gratis (14 Hari)</p>
                            </div>
                            <div className="px-8 flex-1">
                                <ul className="space-y-4 mt-6 mb-8 text-base text-muted-foreground">
                                    <li className="flex items-center gap-2"><CheckCircle2 className="h-4 w-4 text-green-500"/> Manajemen Siswa</li>
                                    <li className="flex items-center gap-2"><CheckCircle2 className="h-4 w-4 text-green-500"/> Manajemen Akademik</li>
                                    <li className="flex items-center gap-2"><CheckCircle2 className="h-4 w-4 text-green-500"/> Manajemen Kelas</li>
                                    <li className="flex items-center gap-2"><CheckCircle2 className="h-4 w-4 text-green-500"/> Manajemen Data</li>
                                    <li className="flex items-center gap-2"><CheckCircle2 className="h-4 w-4 text-green-500"/> Manajemen Pelanggaran</li>
                                    <li className="flex items-center gap-2"><CheckCircle2 className="h-4 w-4 text-green-500"/> Manajemen Ekstrakurikuler</li>
                                    <li className="flex items-center gap-2"><CheckCircle2 className="h-4 w-4 text-green-500"/> Manajemen Jadwal</li>
                                </ul>
                            </div>
                            <div className="p-6 pt-0 mt-auto">
                                <Button variant="outline" className="w-full rounded-full border-primary text-primary hover:bg-primary/10">Pilih</Button>
                            </div>
                        </div>

                        {/* Standard Plan */}
                        <div className="rounded-2xl border border-primary/20 bg-background overflow-hidden flex flex-col relative">
                            <div className="absolute top-0 right-0 bg-primary text-primary-foreground px-4 py-1 text-xs font-bold rounded-bl-lg">
                                Berbayar
                            </div>
                            <div className="p-8 pb-4">
                                <h3 className="text-xl font-bold text-foreground">Standard Plan</h3>
                                <p className="text-sm text-muted-foreground mt-1">Berbayar (30 Hari)</p>
                            </div>
                            <div className="px-8 flex-1">
                                <ul className="space-y-4 mt-6 mb-8 text-base text-muted-foreground">
                                    <li className="flex items-center gap-2"><CheckCircle2 className="h-4 w-4 text-green-500"/> Manajemen Siswa</li>
                                    <li className="flex items-center gap-2"><CheckCircle2 className="h-4 w-4 text-green-500"/> Manajemen Akademik</li>
                                    <li className="flex items-center gap-2"><CheckCircle2 className="h-4 w-4 text-green-500"/> Manajemen Kelas</li>
                                    <li className="flex items-center gap-2"><CheckCircle2 className="h-4 w-4 text-green-500"/> Manajemen Data</li>
                                    <li className="flex items-center gap-2"><CheckCircle2 className="h-4 w-4 text-green-500"/> Manajemen Pelanggaran</li>
                                    <li className="flex items-center gap-2"><CheckCircle2 className="h-4 w-4 text-green-500"/> Manajemen Ekstrakurikuler</li>
                                    <li className="flex items-center gap-2"><CheckCircle2 className="h-4 w-4 text-green-500"/> Manajemen Jadwal</li>
                                    <li className="flex items-center gap-2"><CheckCircle2 className="h-4 w-4 text-green-500"/> Manajemen Kehadiran</li>
                                    <li className="flex items-center gap-2"><CheckCircle2 className="h-4 w-4 text-green-500"/> Penilaian / Nilai</li>
                                </ul>
                            </div>
                            <div className="p-6 pt-0 mt-auto">
                                <Button className="w-full rounded-full bg-primary text-primary-foreground hover:bg-primary/90">Pilih</Button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {/* Paket Khusus */}
            <section className="py-12 bg-background">
                <div className="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8">
                    <div className="bg-primary rounded-3xl p-8 sm:p-12 text-primary-foreground flex flex-col md:flex-row items-center justify-between gap-8 shadow-xl">
                        <div className="max-w-2xl text-center md:text-left">
                            <h2 className="text-2xl font-bold mb-4">Paket Khusus</h2>
                            <p className="opacity-90">
                                Tersedia diskon menarik jika Anda membeli paket tahunan atau untuk yayasan pendidikan dengan lebih dari 5 sekolah.
                            </p>
                        </div>
                        <Button variant="outline" className="bg-transparent border-primary-foreground text-primary-foreground hover:bg-primary-foreground hover:text-primary rounded-full px-8 py-6 h-auto whitespace-nowrap">
                            Hubungi Kami
                        </Button>
                    </div>
                </div>
            </section>

            {/* Hubungi Kami */}
            <section id="kontak" className="py-24 bg-background">
                <div className="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8">
                    <div className="text-center mb-16">
                        <h2 className="text-2xl font-bold tracking-tight text-foreground mb-2">
                            Hubungi kami
                        </h2>
                        <div className="inline-block border-b-2 border-primary pb-2">
                            <p className="text-muted-foreground">
                                Punya pertanyaan atau hanya ingin menyapa?
                            </p>
                        </div>
                    </div>
                    
                    <div className="grid md:grid-cols-2 gap-12">
                        {/* Form */}
                        <div className="bg-card p-8 rounded-2xl shadow-sm border">
                            <form className="space-y-4">
                                <div>
                                    <input type="text" placeholder="Nama Lengkap" className="w-full p-3 rounded-lg border bg-background text-sm" />
                                </div>
                                <div>
                                    <input type="email" placeholder="Email Anda" className="w-full p-3 rounded-lg border bg-background text-sm" />
                                </div>
                                <div>
                                    <textarea placeholder="Pesan" rows={4} className="w-full p-3 rounded-lg border bg-background text-sm"></textarea>
                                </div>
                                <Button className="w-full bg-primary text-primary-foreground rounded-lg">Kirim</Button>
                            </form>
                        </div>
                        
                        {/* Info */}
                        <div className="space-y-6">
                            <div className="flex items-start gap-4 p-4 rounded-xl border bg-card">
                                <div className="h-12 w-12 rounded-full bg-primary/10 flex items-center justify-center shrink-0">
                                    <Phone className="h-5 w-5 text-primary" />
                                </div>
                                <div>
                                    <h4 className="font-bold text-foreground">Telepon</h4>
                                    <p className="text-sm text-muted-foreground mt-1">+62 812-3456-7890</p>
                                </div>
                            </div>
                            
                            <div className="flex items-start gap-4 p-4 rounded-xl border bg-card">
                                <div className="h-12 w-12 rounded-full bg-primary/10 flex items-center justify-center shrink-0">
                                    <Mail className="h-5 w-5 text-primary" />
                                </div>
                                <div>
                                    <h4 className="font-bold text-foreground">Email</h4>
                                    <p className="text-sm text-muted-foreground mt-1">info@eschool.ac.id</p>
                                </div>
                            </div>
                            
                            <div className="flex items-start gap-4 p-4 rounded-xl border bg-card">
                                <div className="h-12 w-12 rounded-full bg-primary/10 flex items-center justify-center shrink-0">
                                    <MapPin className="h-5 w-5 text-primary" />
                                </div>
                                <div>
                                    <h4 className="font-bold text-foreground">Lokasi</h4>
                                    <p className="text-sm text-muted-foreground mt-1">Jl. Sudirman No. 123, Jakarta Selatan,<br/>DKI Jakarta, Indonesia 12190</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {/* CTA App */}
            <section className="py-24 bg-background border-t">
                <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                    <div className="grid md:grid-cols-2 gap-12 items-center">
                        <div className="flex justify-center relative">
                            {/* Decorative background circle */}
                            <div className="absolute inset-0 bg-primary/5 rounded-full scale-150 -z-10 border border-primary/20 blur-sm" style={{ borderStyle: 'dashed' }}></div>
                            <img
                                src="/our-app.png"
                                alt="SIAKAD PLUS Mobile App"
                                className="max-h-[500px] w-auto drop-shadow-2xl z-10"
                            />
                        </div>
                        <div className="text-center md:text-left">
                            <h2 className="text-3xl font-bold sm:text-4xl text-foreground">
                                Unduh Aplikasi Kami<br/>Sekarang!
                            </h2>
                            <p className="mt-4 max-w-lg text-muted-foreground mx-auto md:mx-0">
                                Nikmati kemudahan akses eSchool langsung dari smartphone Anda. Kelola tugas, jadwal, dan komunikasi di mana saja dan kapan saja.
                            </p>
                            <div className="mt-8 flex gap-4 justify-center md:justify-start">
                                <a href="#" className="transition-transform hover:scale-105">
                                    <img src="/google-play.png" alt="Google Play" className="h-12 w-auto" />
                                </a>
                                <a href="#" className="transition-transform hover:scale-105">
                                    <img src="/app-store.png" alt="App Store" className="h-12 w-auto" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    );
}
