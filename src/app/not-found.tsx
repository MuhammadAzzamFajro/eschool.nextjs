import Link from "next/link";
import { Button } from "@/components/ui/button";
import { GraduationCap } from "lucide-react";

export default function NotFound() {
    return (
        <div className="flex min-h-screen flex-col items-center justify-center px-4 text-center">
            <div className="flex h-16 w-16 items-center justify-center rounded-2xl bg-primary/10 text-primary mb-6">
                <GraduationCap className="h-8 w-8" />
            </div>
            <h1 className="text-7xl font-extrabold text-primary">404</h1>
            <h2 className="mt-4 text-xl font-semibold">Halaman Tidak Ditemukan</h2>
            <p className="mt-2 text-muted-foreground max-w-md">
                Maaf, halaman yang Anda cari tidak tersedia. Mungkin halaman telah
                dipindahkan atau dihapus.
            </p>
            <div className="mt-8 flex gap-4">
                <Button asChild>
                    <Link href="/">Kembali ke Beranda</Link>
                </Button>
                <Button variant="outline" asChild>
                    <Link href="/dashboard">Dashboard</Link>
                </Button>
            </div>
        </div>
    );
}
