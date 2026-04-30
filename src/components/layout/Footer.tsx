import Link from "next/link";

export function Footer() {
    return (
        <footer className="border-t bg-background">
            <div className="mx-auto max-w-7xl px-4 py-12 sm:px-6 lg:px-8">
                <div className="grid grid-cols-1 gap-8 md:grid-cols-5">
                    {/* Brand */}
                    <div className="col-span-1 md:col-span-2">
                        <Link href="/" className="flex items-center gap-2.5 mb-4 group">
                            <img
                                src="/logo.svg"
                                alt="eSCHOOL Logo"
                                className="h-8 w-auto transition-transform group-hover:scale-105"
                            />
                        </Link>
                        <p className="text-sm text-muted-foreground max-w-md mt-4">
                            eSchool adalah sistem manajemen sekolah digital terdepan di Indonesia. Menawarkan fitur lengkap untuk manajemen sekolah, mempermudah administrasi sekolah, dan membantu dalam komunikasi antara sekolah, siswa, dan orang tua.
                        </p>
                    </div>

                    {/* Tautan */}
                    <div>
                        <h3 className="text-sm font-bold mb-4 text-primary">Tautan</h3>
                        <ul className="space-y-3">
                            <li>
                                <Link
                                    href="/"
                                    className="text-sm text-muted-foreground hover:text-primary transition-colors"
                                >
                                    Beranda
                                </Link>
                            </li>
                            <li>
                                <Link
                                    href="#fitur"
                                    className="text-sm text-muted-foreground hover:text-primary transition-colors"
                                >
                                    Fitur
                                </Link>
                            </li>
                            <li>
                                <Link
                                    href="#harga"
                                    className="text-sm text-muted-foreground hover:text-primary transition-colors"
                                >
                                    Harga
                                </Link>
                            </li>
                            <li>
                                <Link
                                    href="#bantuan"
                                    className="text-sm text-muted-foreground hover:text-primary transition-colors"
                                >
                                    FAQ
                                </Link>
                            </li>
                        </ul>
                    </div>

                    {/* Informasi */}
                    <div>
                        <h3 className="text-sm font-bold mb-4 text-primary">Informasi</h3>
                        <ul className="space-y-3">
                            <li>
                                <Link
                                    href="#tentang"
                                    className="text-sm text-muted-foreground hover:text-primary transition-colors"
                                >
                                    Tentang Kami
                                </Link>
                            </li>
                            <li>
                                <Link
                                    href="#kontak"
                                    className="text-sm text-muted-foreground hover:text-primary transition-colors"
                                >
                                    Kontak
                                </Link>
                            </li>
                            <li>
                                <Link
                                    href="#"
                                    className="text-sm text-muted-foreground hover:text-primary transition-colors"
                                >
                                    Kebijakan Privasi
                                </Link>
                            </li>
                            <li>
                                <Link
                                    href="#"
                                    className="text-sm text-muted-foreground hover:text-primary transition-colors"
                                >
                                    Syarat & Ketentuan
                                </Link>
                            </li>
                            <li>
                                <Link
                                    href="#"
                                    className="text-sm text-muted-foreground hover:text-primary transition-colors"
                                >
                                    Pengembalian Dana
                                </Link>
                            </li>
                        </ul>
                    </div>

                    {/* Mengikuti */}
                    <div>
                        <h3 className="text-sm font-bold mb-4 text-primary">Mengikuti</h3>
                        <ul className="space-y-3">
                            <li>
                                <a
                                    href="#"
                                    className="text-sm text-muted-foreground hover:text-primary transition-colors flex items-center gap-2"
                                >
                                    Facebook
                                </a>
                            </li>
                            <li>
                                <a
                                    href="#"
                                    className="text-sm text-muted-foreground hover:text-primary transition-colors flex items-center gap-2"
                                >
                                    Instagram
                                </a>
                            </li>
                            <li>
                                <a
                                    href="#"
                                    className="text-sm text-muted-foreground hover:text-primary transition-colors flex items-center gap-2"
                                >
                                    LinkedIn
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div className="mt-12 pt-8 flex justify-center items-center">
                    <p className="text-xs text-muted-foreground">
                        &copy; {new Date().getFullYear()} UBIG. All rights reserved.
                    </p>
                </div>
            </div>
        </footer>
    );
}
