"use client";

import { Menu, Bell, LogOut, User, Settings } from "lucide-react";
import { Button } from "@/components/ui/button";
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { Badge } from "@/components/ui/badge";
import { useAuth } from "@/hooks/useAuth";
import { signOut } from "@/services/auth.service";
import { ROLE_LABELS } from "@/config/roles";

export function Header() {
    const { user, role } = useAuth();

    const initials = user?.user_metadata?.full_name
        ? user.user_metadata.full_name
            .split(" ")
            .map((n: string) => n[0])
            .join("")
            .toUpperCase()
            .slice(0, 2)
        : "U";

    const handleMobileMenuClick = () => {
        const trigger = document.getElementById("mobile-sidebar-trigger");
        trigger?.click();
    };

    return (
        <header className="sticky top-0 z-40 flex h-16 items-center border-b bg-background/80 backdrop-blur-xl px-4 lg:px-6">
            {/* Mobile menu toggle */}
            <Button
                variant="ghost"
                size="icon"
                className="lg:hidden mr-2"
                onClick={handleMobileMenuClick}
            >
                <Menu className="h-5 w-5" />
                <span className="sr-only">Menu</span>
            </Button>

            {/* Spacer */}
            <div className="flex-1" />

            {/* Right side actions */}
            <div className="flex items-center gap-2">
                {/* Notifications */}
                <Button variant="ghost" size="icon" className="relative">
                    <Bell className="h-4.5 w-4.5" />
                    <span className="absolute -top-0.5 -right-0.5 flex h-4 w-4 items-center justify-center rounded-full bg-destructive text-[10px] font-bold text-white">
                        3
                    </span>
                    <span className="sr-only">Notifikasi</span>
                </Button>

                {/* User Menu */}
                <DropdownMenu>
                    <DropdownMenuTrigger render={
                        <Button
                            variant="ghost"
                            className="relative flex items-center gap-2 px-2 hover:bg-accent"
                        >
                            <Avatar className="h-8 w-8">
                                <AvatarImage
                                    src={user?.user_metadata?.avatar_url}
                                    alt={user?.user_metadata?.full_name || "User"}
                                />
                                <AvatarFallback className="bg-primary/10 text-primary text-xs font-semibold">
                                    {initials}
                                </AvatarFallback>
                            </Avatar>
                            <div className="hidden sm:flex flex-col items-start">
                                <span className="text-sm font-medium leading-tight">
                                    {user?.user_metadata?.full_name || "Pengguna"}
                                </span>
                                {role && (
                                    <span className="text-xs text-muted-foreground leading-tight">
                                        {ROLE_LABELS[role]}
                                    </span>
                                )}
                            </div>
                        </Button>
                    } />
                    <DropdownMenuContent align="end" className="w-56">
                        <DropdownMenuLabel>
                            <div className="flex flex-col space-y-1">
                                <span className="text-sm font-medium">
                                    {user?.user_metadata?.full_name || "Pengguna"}
                                </span>
                                <span className="text-xs text-muted-foreground">
                                    {user?.email}
                                </span>
                                {role && (
                                    <Badge variant="secondary" className="w-fit mt-1 text-xs">
                                        {ROLE_LABELS[role]}
                                    </Badge>
                                )}
                            </div>
                        </DropdownMenuLabel>
                        <DropdownMenuSeparator />
                        <DropdownMenuItem render={
                            <a href="/pengaturan" className="cursor-pointer">
                                <User className="mr-2 h-4 w-4" />
                                Profil Saya
                            </a>
                        } />
                        <DropdownMenuItem render={
                            <a href="/pengaturan" className="cursor-pointer">
                                <Settings className="mr-2 h-4 w-4" />
                                Pengaturan
                            </a>
                        } />
                        <DropdownMenuSeparator />
                        <DropdownMenuItem
                            onClick={() => signOut()}
                            className="text-destructive cursor-pointer focus:text-destructive"
                        >
                            <LogOut className="mr-2 h-4 w-4" />
                            Keluar
                        </DropdownMenuItem>
                    </DropdownMenuContent>
                </DropdownMenu>
            </div>
        </header>
    );
}
