// Template untuk halaman yang belum diimplementasikan
import { Construction } from "lucide-react";
import Link from "next/link";
import { Button } from "@/components/ui/button";

interface ComingSoonPageProps {
    title: string;
    description?: string;
}

export function ComingSoonPage({ title, description }: ComingSoonPageProps) {
    return (
        <div className="flex flex-1 items-center justify-center min-h-[400px]">
            <div className="text-center space-y-4 max-w-md">
                <div className="flex justify-center">
                    <div className="h-16 w-16 rounded-2xl bg-amber-50 dark:bg-amber-950/50 flex items-center justify-center">
                        <Construction className="h-8 w-8 text-amber-600 dark:text-amber-400" />
                    </div>
                </div>
                <div>
                    <h2 className="text-xl font-bold">{title}</h2>
                    <p className="text-muted-foreground mt-1 text-sm">
                        {description || "Halaman ini sedang dalam tahap pengembangan. Segera hadir!"}
                    </p>
                </div>
                <Button asChild variant="outline" size="sm">
                    <Link href="/dashboard">← Kembali ke Dashboard</Link>
                </Button>
            </div>
        </div>
    );
}
