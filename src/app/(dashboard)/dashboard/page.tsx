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
    UserCheck,
} from "lucide-react";
import { getDashboardStats } from "@/services/profile.service";

export default async function DashboardPage() {
    const stats = await getDashboardStats();

    const statsCards = [
        {
            title: "Total Pengguna",
            value: stats.totalUsers.toLocaleString(),
            change: `+${stats.newThisMonth}`,
            icon: Users,
            color: "text-blue-600 bg-blue-100 dark:bg-blue-900/30 dark:text-blue-400",
            description: "Baru bulan ini"
        },
        {
            title: "Total Guru",
            value: stats.totalGuru.toLocaleString(),
            change: "Aktif",
            icon: UserCheck,
            color:
                "text-emerald-600 bg-emerald-100 dark:bg-emerald-900/30 dark:text-emerald-400",
            description: "Tenaga Pengajar"
        },
        {
            title: "Total Staf",
            value: stats.totalStaf.toLocaleString(),
            change: "Aktif",
            icon: UserCog,
            color:
                "text-purple-600 bg-purple-100 dark:bg-purple-900/30 dark:text-purple-400",
            description: "Administrasi"
        },
        {
            title: "Total Admin",
            value: stats.totalAdmin.toLocaleString(),
            change: "Aktif",
            icon: BookOpen,
            color:
                "text-amber-600 bg-amber-100 dark:bg-amber-900/30 dark:text-amber-400",
            description: "Pengelola"
        },
    ];

    const quickActions = [
        { title: "Profil Saya", icon: UserCog, href: "/profile" },
        { title: "Kehadiran Hari Ini", icon: ClipboardCheck, href: "/absensi/add" },
        { title: "Jadwal Pelajaran", icon: Calendar, href: "/jadwal" },
        { title: "Data Guru", icon: Users, href: "/guru" },
    ];

    return (
        <div className="space-y-6">
            {/* Header */}
            <div>
                <h1 className="text-2xl font-bold tracking-tight lg:text-3xl">
                    Dashboard
                </h1>
                <p className="text-muted-foreground mt-1">
                    Selamat datang kembali! Berikut ringkasan data sekolah Anda secara real-time.
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
                                    {stat.description}
                                </span>
                            </div>
                        </CardContent>
                    </Card>
                ))}
            </div>

            {/* Main Data Content */}
            <div className="grid gap-6 lg:grid-cols-3">
                {/* Attendance Chart Mockup */}
                <Card className="lg:col-span-2 border-0 shadow-sm">
                    <CardHeader className="flex flex-row items-center justify-between">
                        <div>
                            <CardTitle className="text-lg">Tren Kehadiran Siswa</CardTitle>
                            <p className="text-xs text-muted-foreground">Persentase kehadiran dalam 7 hari terakhir</p>
                        </div>
                        <div className="flex items-center gap-2">
                            <div className="flex items-center gap-1">
                                <div className="h-2 w-2 rounded-full bg-primary" />
                                <span className="text-[10px] text-muted-foreground">Hadir</span>
                            </div>
                            <div className="flex items-center gap-1">
                                <div className="h-2 w-2 rounded-full bg-destructive" />
                                <span className="text-[10px] text-muted-foreground">Absen</span>
                            </div>
                        </div>
                    </CardHeader>
                    <CardContent>
                        <div className="h-[240px] w-full flex items-end justify-between gap-2 px-2 pt-4">
                            {[95, 92, 88, 94, 91, 96, 98].map((val, i) => (
                                <div key={i} className="flex-1 flex flex-col items-center gap-2 group">
                                    <div className="w-full relative bg-muted rounded-t-sm overflow-hidden h-full">
                                        <div 
                                            className="absolute bottom-0 left-0 w-full bg-primary/80 group-hover:bg-primary transition-all duration-500" 
                                            style={{ height: `${val}%` }} 
                                        />
                                    </div>
                                    <span className="text-[10px] text-muted-foreground">
                                        {["Sen", "Sel", "Rab", "Kam", "Jum", "Sab", "Min"][i]}
                                    </span>
                                </div>
                            ))}
                        </div>
                    </CardContent>
                </Card>

                {/* System & Activity Feed */}
                <div className="space-y-6">
                    <Card className="border-0 shadow-sm">
                        <CardHeader className="pb-3">
                            <CardTitle className="text-lg">Aktivitas Terkini</CardTitle>
                        </CardHeader>
                        <CardContent className="px-0">
                            <div className="space-y-4 px-6">
                                {[
                                    { user: "Admin", action: "Input nilai Matematika", time: "5 menit lalu", icon: BookOpen },
                                    { user: "Sistem", action: "Sinkronisasi data", time: "1 jam lalu", icon: TrendingUp },
                                    { user: "Budi", action: "Update profil", time: "2 jam lalu", icon: UserCog },
                                ].map((item, i) => (
                                    <div key={i} className="flex items-start gap-3 text-sm">
                                        <div className="h-8 w-8 rounded-full bg-muted flex items-center justify-center shrink-0">
                                            <item.icon className="h-4 w-4 text-muted-foreground" />
                                        </div>
                                        <div>
                                            <p className="font-medium">{item.user}</p>
                                            <p className="text-xs text-muted-foreground">{item.action}</p>
                                            <p className="text-[10px] text-muted-foreground/60 mt-0.5">{item.time}</p>
                                        </div>
                                    </div>
                                ))}
                            </div>
                        </CardContent>
                    </Card>

                    <Card className="border-0 shadow-sm bg-primary/5 border-primary/10">
                        <CardHeader className="pb-2">
                            <CardTitle className="text-sm font-semibold flex items-center gap-2">
                                <ClipboardCheck className="h-4 w-4 text-primary" />
                                Status Sistem
                            </CardTitle>
                        </CardHeader>
                        <CardContent className="text-xs space-y-2">
                            <div className="flex justify-between items-center">
                                <span className="text-muted-foreground">Database</span>
                                <span className="text-emerald-600 font-medium">Online</span>
                            </div>
                            <div className="flex justify-between items-center">
                                <span className="text-muted-foreground">Sesi Terakhir</span>
                                <span>{new Date().toLocaleTimeString()}</span>
                            </div>
                        </CardContent>
                    </Card>
                </div>
            </div>
        </div>
    );
}
