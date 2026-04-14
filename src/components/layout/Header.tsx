"use client";

import { Menu, Bell, Search, ChevronRight, Home } from "lucide-react";
import { Button } from "@/components/ui/button";
import { usePathname } from "next/navigation";
import { menuGroups } from "@/config/menu";
import Link from "next/link";

// Build page title from pathname using menu config
function usePageTitle(pathname: string) {
    for (const group of menuGroups) {
        for (const item of group.items) {
            if (pathname === item.href || (item.href !== "/dashboard" && pathname.startsWith(item.href))) {
                return item.title;
            }
        }
    }
    return "Halaman";
}

// Generate breadcrumb segments from pathname
function useBreadcrumbs(pathname: string) {
    const segments = pathname.split("/").filter(Boolean);
    const crumbs: { label: string; href: string }[] = [
        { label: "Dashboard", href: "/dashboard" },
    ];

    if (segments.length > 1) {
        // Try to match from menu config
        for (const group of menuGroups) {
            for (const item of group.items) {
                const itemSegments = item.href.split("/").filter(Boolean);
                if (itemSegments[0] === segments[1]) {
                    crumbs.push({ label: item.title, href: item.href });
                    break;
                }
            }
        }
        // If sub-page detected
        if (segments.length > 2) {
            const current = decodeURIComponent(segments[segments.length - 1]);
            const label =
                current === "tambah" ? "Tambah Baru"
                    : current === "edit" ? "Edit"
                        : current.charAt(0).toUpperCase() + current.slice(1);
            crumbs.push({ label, href: pathname });
        }
    }

    return crumbs;
}

export function Header() {
    const pathname = usePathname();
    const pageTitle = usePageTitle(pathname);
    const breadcrumbs = useBreadcrumbs(pathname);

    const handleMobileMenuClick = () => {
        const trigger = document.getElementById("mobile-sidebar-trigger");
        trigger?.click();
    };

    return (
        <header className="sticky top-0 z-40 flex h-16 items-center gap-4 border-b bg-background/95 backdrop-blur-sm px-4 lg:px-6">
            {/* Mobile menu toggle */}
            <Button
                variant="ghost"
                size="icon"
                className="lg:hidden shrink-0"
                onClick={handleMobileMenuClick}
            >
                <Menu className="h-5 w-5" />
                <span className="sr-only">Menu</span>
            </Button>

            {/* Breadcrumb + Page Title */}
            <div className="flex-1 min-w-0">
                {/* Breadcrumb - hidden on mobile */}
                <nav className="hidden sm:flex items-center gap-1 text-xs text-muted-foreground mb-0.5">
                    <Home className="h-3 w-3" />
                    {breadcrumbs.map((crumb, i) => (
                        <span key={crumb.href} className="flex items-center gap-1">
                            <ChevronRight className="h-3 w-3 opacity-50" />
                            {i === breadcrumbs.length - 1 ? (
                                <span className="text-foreground font-medium">
                                    {crumb.label}
                                </span>
                            ) : (
                                <Link
                                    href={crumb.href}
                                    className="hover:text-foreground transition-colors"
                                >
                                    {crumb.label}
                                </Link>
                            )}
                        </span>
                    ))}
                </nav>

                {/* Page Title on mobile */}
                <h1 className="sm:hidden text-base font-semibold truncate">
                    {pageTitle}
                </h1>
            </div>

            {/* Right side actions */}
            <div className="flex items-center gap-1 shrink-0">
                {/* Notifications */}
                <Button
                    variant="ghost"
                    size="icon"
                    className="relative"
                    title="Notifikasi"
                >
                    <Bell className="h-4.5 w-4.5" />
                    <span className="absolute -top-0.5 -right-0.5 flex h-4 w-4 items-center justify-center rounded-full bg-destructive text-[10px] font-bold text-white leading-none">
                        3
                    </span>
                    <span className="sr-only">Notifikasi</span>
                </Button>
            </div>
        </header>
    );
}
