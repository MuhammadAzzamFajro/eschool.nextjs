"use client";

import { Menu, Bell, Search, ChevronRight, Home, User, Settings, LogOut, Languages } from "lucide-react";
import { Button } from "@/components/ui/button";
import { usePathname } from "next/navigation";
import { menuGroups } from "@/config/menu";
import Link from "next/link";
import { 
    DropdownMenu, 
    DropdownMenuContent, 
    DropdownMenuGroup, 
    DropdownMenuItem, 
    DropdownMenuLabel, 
    DropdownMenuSeparator, 
    DropdownMenuTrigger 
} from "@/components/ui/dropdown-menu";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { useAuth } from "@/hooks/useAuth";
import { signOut } from "@/services/auth.service";

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
        <header className="sticky top-0 z-40 flex h-16 items-center border-b bg-background px-4 lg:px-6">
            {/* Left: Mobile Toggle & Academic Year */}
            <div className="flex items-center gap-4 flex-1">
                <Button
                    variant="ghost"
                    size="icon"
                    className="lg:hidden shrink-0"
                    onClick={handleMobileMenuClick}
                >
                    <Menu className="h-5 w-5" />
                    <span className="sr-only">Menu</span>
                </Button>

                <div className="hidden md:flex items-center gap-2 text-sm text-foreground/80">
                    <span className="font-medium">Tahun Ajaran : 2025/2026, Semester Genap</span>
                </div>
            </div>

            {/* Middle/Right actions */}
            <div className="flex items-center gap-6">
                {/* Language Selector */}
                <Button variant="ghost" size="sm" className="hidden sm:flex items-center gap-2 text-muted-foreground font-normal hover:bg-transparent hover:text-foreground">
                    <div className="bg-muted p-1 rounded">
                        <Languages className="h-3.5 w-3.5" />
                    </div>
                    <span>Bahasa Indonesia</span>
                </Button>

                {/* Notifications - simplified like the image (which doesn't show it, but I'll keep it or hide it) */}
                {/* I will hide notifications for now to match the "clean" look of the image unless it's needed */}
                
                {/* User Dropdown */}
                <UserDropdown />
            </div>
        </header>
    );
}

function UserDropdown() {
    const { user, role } = useAuth();
    
    if (!user) return null;

    const initials = user.user_metadata?.full_name
        ? user.user_metadata.full_name.split(" ").map((n: string) => n[0]).join("").toUpperCase().slice(0, 2)
        : "U";

    return (
        <DropdownMenu>
            <DropdownMenuTrigger render={
                <Button variant="ghost" className="relative flex items-center gap-3 h-auto py-1.5 px-2 hover:bg-muted/50 rounded-full transition-colors group">
                    <Avatar className="h-10 w-10 border shadow-sm group-hover:border-primary/20 transition-colors">
                        <AvatarImage src={user.user_metadata?.avatar_url} />
                        <AvatarFallback className="bg-primary/10 text-primary text-xs font-bold">
                            {initials}
                        </AvatarFallback>
                    </Avatar>
                    <div className="text-left hidden sm:block">
                        <p className="text-sm font-bold leading-tight text-foreground">{user.user_metadata?.full_name || "Admin"}</p>
                        <p className="text-[11px] font-medium leading-tight text-muted-foreground mt-0.5 capitalize">
                            {role === "admin" ? "Admin Sekolah" : (role || "Staf (Default)")}
                        </p>
                    </div>
                </Button>
            } />
            <DropdownMenuContent className="w-56" align="end">
                <DropdownMenuLabel className="font-normal">
                    <div className="flex flex-col space-y-1">
                        <p className="text-sm font-medium leading-none">{user.user_metadata?.full_name || "Pengguna"}</p>
                        <p className="text-xs leading-none text-muted-foreground capitalize">
                            {role || "Staf (Default)"}
                        </p>
                    </div>
                </DropdownMenuLabel>
                <DropdownMenuSeparator />
                <DropdownMenuGroup>
                    <DropdownMenuItem render={
                        <Link href="/profile" className="cursor-pointer w-full flex items-center">
                            <User className="mr-2 h-4 w-4" />
                            <span>Profil Saya</span>
                        </Link>
                    } />
                    <DropdownMenuItem render={
                        <Link href="/pengaturan" className="cursor-pointer w-full flex items-center">
                            <Settings className="mr-2 h-4 w-4" />
                            <span>Pengaturan</span>
                        </Link>
                    } />
                </DropdownMenuGroup>
                <DropdownMenuSeparator />
                <DropdownMenuItem 
                    className="text-destructive focus:text-destructive cursor-pointer"
                    onClick={() => signOut()}
                >
                    <LogOut className="mr-2 h-4 w-4" />
                    <span>Keluar</span>
                </DropdownMenuItem>
            </DropdownMenuContent>
        </DropdownMenu>
    );
}
