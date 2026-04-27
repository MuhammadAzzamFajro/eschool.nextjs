import Link from "next/link";
import { GraduationCap } from "lucide-react";

export function Footer() {
    return (
        <footer className="border-t bg-muted/30">
            <div className="mx-auto max-w-7xl px-4 py-12 sm:px-6 lg:px-8">
                <div className="grid grid-cols-1 gap-8 md:grid-cols-4">
                    {/* Brand */}
                    <div className="col-span-1 md:col-span-2">
                        <Link href="/" className="flex items-center gap-2.5 mb-4 group">
                            <img
                                src="/logo.svg"
                                alt="SIAKAD PLUS Logo"
                                className="h-8 w-auto transition-transform group-hover:scale-105"
                            />
                        </Link>
                        <p className="text-sm text-muted-foreground max-w-md">
                            Sistem Manajemen Sekolah digital yang membantu mengelola
                            administrasi sekolah secara efisien, modern, dan terintegrasi.
                        </p>
                    </div>

                    {/* Links */}
                    <div>
                        <h3 className="text-sm font-semibold mb-3">Tautan</h3>
                        <ul className="space-y-2">
                            <li>
                                <Link
                                    href="#fitur"
                                    className="text-sm text-muted-foreground hover:text-foreground transition-colors"
                                >
                                    Fitur
                                </Link>
                            </li>
                            <li>
                                <Link
                                    href="#tentang"
                                    className="text-sm text-muted-foreground hover:text-foreground transition-colors"
                                >
                                    Tentang
                                </Link>
                            </li>
                            <li>
                                <Link
                                    href="#kontak"
                                    className="text-sm text-muted-foreground hover:text-foreground transition-colors"
                                >
                                    Kontak
                                </Link>
                            </li>
                        </ul>
                    </div>

                    {/* Support */}
                    <div>
                        <h3 className="text-sm font-semibold mb-3">Dukungan</h3>
                        <ul className="space-y-2">
                            <li>
                                <Link
                                    href="/login"
                                    className="text-sm text-muted-foreground hover:text-foreground transition-colors"
                                >
                                    Masuk
                                </Link>
                            </li>
                            <li>
                                <Link
                                    href="/register"
                                    className="text-sm text-muted-foreground hover:text-foreground transition-colors"
                                >
                                    Daftar
                                </Link>
                            </li>
                        </ul>
                    </div>
                </div>

                <div className="mt-8 border-t pt-8 flex flex-col sm:flex-row justify-between items-center gap-4">
                    <p className="text-xs text-muted-foreground">
                        &copy; {new Date().getFullYear()} SIAKAD PLUS. Hak cipta dilindungi.
                    </p>
                    <p className="text-xs text-muted-foreground">
                        Dibuat dengan ❤️ untuk pendidikan Indonesia
                    </p>
                </div>
            </div>
        </footer>
    );
}
