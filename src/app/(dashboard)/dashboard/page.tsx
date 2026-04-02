import {
    Card,
    CardContent,
    CardHeader,
    CardTitle,
} from "@/components/ui/card";
import {
    GraduationCap,
    Users,
    UserCog,
    BookOpen,
    TrendingUp,
    Calendar,
    ClipboardCheck,
    CreditCard,
} from "lucide-react";

const statsCards = [
    {
        title: "Total Siswa",
        value: "1,245",
        change: "+12%",
        icon: GraduationCap,
        color: "text-blue-600 bg-blue-100 dark:bg-blue-900/30 dark:text-blue-400",
    },
    {
        title: "Total Guru",
        value: "86",
        change: "+3%",
        icon: Users,
        color:
            "text-emerald-600 bg-emerald-100 dark:bg-emerald-900/30 dark:text-emerald-400",
    },
    {
        title: "Total Staf",
        value: "32",
        change: "+5%",
        icon: UserCog,
        color:
            "text-purple-600 bg-purple-100 dark:bg-purple-900/30 dark:text-purple-400",
    },
    {
        title: "Kelas Aktif",
        value: "42",
        change: "0%",
        icon: BookOpen,
        color:
            "text-amber-600 bg-amber-100 dark:bg-amber-900/30 dark:text-amber-400",
    },
];

const quickActions = [
    { title: "Tambah Siswa", icon: GraduationCap, href: "/siswa/create" },
    { title: "Kehadiran Hari Ini", icon: ClipboardCheck, href: "/kehadiran" },
    { title: "Jadwal Pelajaran", icon: Calendar, href: "/jadwal" },
    { title: "Kelola Biaya", icon: CreditCard, href: "/biaya" },
];

export default function DashboardPage() {
    return (
        <div className="space-y-6">
            {/* Header */}
            <div>
                <h1 className="text-2xl font-bold tracking-tight lg:text-3xl">
                    Dashboard
                </h1>
                <p className="text-muted-foreground mt-1">
                    Selamat datang kembali! Berikut ringkasan data sekolah Anda.
                </p>
            </div>

            {/* Stats Cards */}
            <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
                {statsCards.map((stat) => (
                    <Card
                        key={stat.title}
                        className="border-0 shadow-sm hover:shadow-md transition-shadow"
                    >
                        <CardHeader className="flex flex-row items-center justify-between pb-2">
                            <CardTitle className="text-sm font-medium text-muted-foreground">
                                {stat.title}
                            </CardTitle>
                            <div
                                className={`flex h-9 w-9 items-center justify-center rounded-lg ${stat.color}`}
                            >
                                <stat.icon className="h-4.5 w-4.5" />
                            </div>
                        </CardHeader>
                        <CardContent>
                            <div className="text-2xl font-bold">{stat.value}</div>
                            <div className="flex items-center gap-1 mt-1">
                                <TrendingUp className="h-3 w-3 text-emerald-500" />
                                <span className="text-xs text-emerald-600 font-medium">
                                    {stat.change}
                                </span>
                                <span className="text-xs text-muted-foreground">
                                    dari bulan lalu
                                </span>
                            </div>
                        </CardContent>
                    </Card>
                ))}
            </div>

            {/* Quick Actions */}
            <div>
                <h2 className="text-lg font-semibold mb-4">Aksi Cepat</h2>
                <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
                    {quickActions.map((action) => (
                        <a key={action.title} href={action.href}>
                            <Card className="border-0 shadow-sm hover:shadow-md hover:-translate-y-0.5 transition-all cursor-pointer group">
                                <CardContent className="flex items-center gap-3 p-4">
                                    <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-primary/10 text-primary group-hover:bg-primary group-hover:text-primary-foreground transition-colors">
                                        <action.icon className="h-5 w-5" />
                                    </div>
                                    <span className="text-sm font-medium">{action.title}</span>
                                </CardContent>
                            </Card>
                        </a>
                    ))}
                </div>
            </div>

            {/* Content Grid */}
            <div className="grid gap-6 lg:grid-cols-2">
                {/* Recent Activity */}
                <Card className="border-0 shadow-sm">
                    <CardHeader>
                        <CardTitle className="text-lg">Aktivitas Terbaru</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="space-y-4">
                            {[
                                {
                                    action: "menambahkan siswa baru",
                                    user: "Admin",
                                    time: "5 menit lalu",
                                },
                                {
                                    action: "mengupdate jadwal pelajaran",
                                    user: "Bu Sari",
                                    time: "30 menit lalu",
                                },
                                {
                                    action: "mencatat kehadiran kelas 10A",
                                    user: "Pak Budi",
                                    time: "1 jam lalu",
                                },
                                {
                                    action: "menambahkan pengumuman baru",
                                    user: "Admin",
                                    time: "2 jam lalu",
                                },
                                {
                                    action: "mengupload nilai ujian",
                                    user: "Bu Dewi",
                                    time: "3 jam lalu",
                                },
                            ].map((item, i) => (
                                <div
                                    key={i}
                                    className="flex items-center gap-3 text-sm"
                                >
                                    <div className="flex h-8 w-8 shrink-0 items-center justify-center rounded-full bg-primary/10 text-primary text-xs font-semibold">
                                        {item.user[0]}
                                    </div>
                                    <div className="flex-1 min-w-0">
                                        <p>
                                            <span className="font-medium">{item.user}</span>{" "}
                                            <span className="text-muted-foreground">
                                                {item.action}
                                            </span>
                                        </p>
                                    </div>
                                    <span className="text-xs text-muted-foreground whitespace-nowrap">
                                        {item.time}
                                    </span>
                                </div>
                            ))}
                        </div>
                    </CardContent>
                </Card>

                {/* Upcoming Schedule */}
                <Card className="border-0 shadow-sm">
                    <CardHeader>
                        <CardTitle className="text-lg">Jadwal Hari Ini</CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="space-y-3">
                            {[
                                {
                                    time: "07:30 - 08:30",
                                    subject: "Matematika",
                                    class: "Kelas 10A",
                                    teacher: "Pak Budi",
                                },
                                {
                                    time: "08:30 - 09:30",
                                    subject: "Bahasa Indonesia",
                                    class: "Kelas 10A",
                                    teacher: "Bu Sari",
                                },
                                {
                                    time: "10:00 - 11:00",
                                    subject: "Fisika",
                                    class: "Kelas 11B",
                                    teacher: "Pak Ahmad",
                                },
                                {
                                    time: "11:00 - 12:00",
                                    subject: "Bahasa Inggris",
                                    class: "Kelas 11B",
                                    teacher: "Bu Dewi",
                                },
                                {
                                    time: "13:00 - 14:00",
                                    subject: "Kimia",
                                    class: "Kelas 12A",
                                    teacher: "Bu Rina",
                                },
                            ].map((item, i) => (
                                <div
                                    key={i}
                                    className="flex items-center gap-4 rounded-lg border p-3"
                                >
                                    <div className="text-xs font-mono text-primary font-medium whitespace-nowrap">
                                        {item.time}
                                    </div>
                                    <div className="flex-1 min-w-0">
                                        <p className="text-sm font-medium">{item.subject}</p>
                                        <p className="text-xs text-muted-foreground">
                                            {item.class} • {item.teacher}
                                        </p>
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
