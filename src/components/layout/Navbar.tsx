"use client";

import Link from "next/link";
import { GraduationCap, LogIn, Menu, X } from "lucide-react";
import { Button } from "@/components/ui/button";
import { useState } from "react";

export function Navbar() {
    const [mobileOpen, setMobileOpen] = useState(false);

    return (
        <header className="sticky top-0 z-50 w-full border-b border-border/40 bg-background/80 backdrop-blur-xl">
            <div className="mx-auto flex h-16 max-w-7xl items-center justify-between px-4 sm:px-6 lg:px-8">
                {/* Logo */}
                <Link href="/" className="flex items-center gap-2.5 group">
                    <img
                        src="/logo.svg"
                        alt="eSCHOOL Logo"
                        className="h-9 w-auto transition-transform group-hover:scale-105"
                    />
                </Link>

                {/* Desktop Nav */}
                <nav className="hidden md:flex items-center gap-8">
                    <Link
                        href="/"
                        className="text-sm font-medium text-muted-foreground hover:text-foreground transition-colors"
                    >
                        Beranda
                    </Link>
                    <Link
                        href="#fitur"
                        className="text-sm font-medium text-muted-foreground hover:text-foreground transition-colors"
                    >
                        Fitur
                    </Link>
                    <Link
                        href="#tentang"
                        className="text-sm font-medium text-muted-foreground hover:text-foreground transition-colors"
                    >
                        Tentang Kami
                    </Link>
                    <Link
                        href="#harga"
                        className="text-sm font-medium text-muted-foreground hover:text-foreground transition-colors"
                    >
                        Harga
                    </Link>
                    <Link
                        href="#kontak"
                        className="text-sm font-medium text-muted-foreground hover:text-foreground transition-colors"
                    >
                        Kontak
                    </Link>
                    <Link
                        href="#bantuan"
                        className="text-sm font-medium text-muted-foreground hover:text-foreground transition-colors"
                    >
                        Bantuan
                    </Link>
                </nav>

                {/* Desktop CTA */}
                <div className="hidden md:flex items-center gap-3">
                    <Button size="sm" asChild className="shadow-md shadow-primary/25 bg-primary text-primary-foreground hover:bg-primary/90">
                        <Link href="/login">
                            Login
                        </Link>
                    </Button>
                    <Button size="sm" asChild className="shadow-md shadow-primary/25 bg-primary text-primary-foreground hover:bg-primary/90">
                        <Link href="#harga">Uji Coba</Link>
                    </Button>
                </div>

                {/* Mobile Toggle */}
                <Button
                    variant="ghost"
                    size="icon"
                    className="md:hidden"
                    onClick={() => setMobileOpen(!mobileOpen)}
                >
                    {mobileOpen ? (
                        <X className="h-5 w-5" />
                    ) : (
                        <Menu className="h-5 w-5" />
                    )}
                </Button>
            </div>

            {/* Mobile Menu */}
            {mobileOpen && (
                <div className="md:hidden border-t bg-background/95 backdrop-blur-xl animate-in slide-in-from-top-2">
                    <div className="p-4 space-y-3">
                        <Link
                            href="/"
                            className="block py-2 text-sm font-medium"
                            onClick={() => setMobileOpen(false)}
                        >
                            Beranda
                        </Link>
                        <Link
                            href="#fitur"
                            className="block py-2 text-sm font-medium text-muted-foreground"
                            onClick={() => setMobileOpen(false)}
                        >
                            Fitur
                        </Link>
                        <Link
                            href="#tentang"
                            className="block py-2 text-sm font-medium text-muted-foreground"
                            onClick={() => setMobileOpen(false)}
                        >
                            Tentang Kami
                        </Link>
                        <Link
                            href="#harga"
                            className="block py-2 text-sm font-medium text-muted-foreground"
                            onClick={() => setMobileOpen(false)}
                        >
                            Harga
                        </Link>
                        <Link
                            href="#kontak"
                            className="block py-2 text-sm font-medium text-muted-foreground"
                            onClick={() => setMobileOpen(false)}
                        >
                            Kontak
                        </Link>
                        <Link
                            href="#bantuan"
                            className="block py-2 text-sm font-medium text-muted-foreground"
                            onClick={() => setMobileOpen(false)}
                        >
                            Bantuan
                        </Link>
                        <div className="pt-3 border-t space-y-2">
                            <Button className="w-full bg-primary text-primary-foreground" asChild>
                                <Link href="/login">Login</Link>
                            </Button>
                            <Button className="w-full bg-primary text-primary-foreground" asChild>
                                <Link href="#harga">Uji Coba</Link>
                            </Button>
                        </div>
                    </div>
                </div>
            )}
        </header>
    );
}
