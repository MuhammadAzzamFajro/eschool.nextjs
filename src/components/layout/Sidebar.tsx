"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { cn } from "@/lib/utils";
import {
    GraduationCap,
    ChevronLeft,
    ChevronRight,
    ChevronDown,
    LogOut,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { ScrollArea } from "@/components/ui/scroll-area";
import { Separator } from "@/components/ui/separator";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import {
    Tooltip,
    TooltipContent,
    TooltipTrigger,
} from "@/components/ui/tooltip";
import { Sheet, SheetContent, SheetTrigger, SheetTitle } from "@/components/ui/sheet";
import { menuGroups, getMenuForRole, type MenuGroup } from "@/config/menu";
import { useAuth } from "@/hooks/useAuth";
import { signOut } from "@/services/auth.service";
import { ROLE_LABELS } from "@/config/roles";
import { useState } from "react";

interface SidebarProps {
    className?: string;
}

function SidebarContent({
    collapsed,
    onNavigate,
}: {
    collapsed: boolean;
    onNavigate?: () => void;
}) {
    const pathname = usePathname();
    const { role } = useAuth();
    const [openItems, setOpenItems] = useState<Record<string, boolean>>({});

    // Get filtered menu based on role
    // Fallback to 'staf' role if none assigned to ensure basic access
    const effectiveRole = role || "staf";
    const filteredGroups = getMenuForRole(effectiveRole);

    const toggleItem = (title: string) => {
        setOpenItems((prev) => ({ ...prev, [title]: !prev[title] }));
    };

    return (
        <ScrollArea className="flex-1 py-2">
            <div className="space-y-1 px-3">
                {filteredGroups.map((group: MenuGroup) => (
                    <div key={group.label} className="mb-2">
                        {/* Group Header */}
                        {!collapsed && (
                            <p className="mb-1 px-3 text-[10px] font-semibold uppercase tracking-widest text-muted-foreground/50">
                                {group.label}
                            </p>
                        )}
                        {collapsed && <Separator className="my-2 mx-1 opacity-50" />}

                        {/* Group Items */}
                        <div className="space-y-0.5">
                            {group.items.map((item) => {
                                const hasChildren = item.children && item.children.length > 0;
                                const isChildActive = hasChildren && item.children?.some(child => pathname === child.href);
                                const isDirectActive = pathname === item.href;
                                const isActive = isDirectActive || isChildActive || (item.href !== "/dashboard" && pathname.startsWith(item.href) && !hasChildren);

                                const isOpen = openItems[item.title] || isChildActive;
                                const Icon = item.icon;

                                const itemContent = (
                                    <div className="flex flex-col">
                                        <button
                                            onClick={() => {
                                                if (hasChildren && !collapsed) {
                                                    toggleItem(item.title);
                                                } else if (!hasChildren) {
                                                    // Standard link behavior is handled by wrapping this in Link if no children
                                                }
                                            }}
                                            className={cn(
                                                "group flex w-full items-center gap-3 rounded-lg px-3 py-2 text-sm font-medium transition-all duration-200",
                                                isDirectActive
                                                    ? "bg-primary text-primary-foreground shadow-sm shadow-primary/20"
                                                    : isChildActive
                                                        ? "bg-sidebar-accent/50 text-sidebar-accent-foreground"
                                                        : "text-sidebar-foreground/70 hover:bg-sidebar-accent hover:text-sidebar-accent-foreground",
                                                collapsed && "justify-center px-2"
                                            )}
                                        >
                                            <Icon
                                                className={cn(
                                                    "shrink-0 transition-transform duration-200",
                                                    isActive ? "scale-110" : "group-hover:scale-105",
                                                    collapsed ? "h-5 w-5" : "h-4 w-4"
                                                )}
                                            />
                                            {!collapsed && (
                                                <>
                                                    <span className="flex-1 truncate text-left leading-tight">
                                                        {item.title}
                                                    </span>
                                                    {item.badge && (
                                                        <span
                                                            className={cn(
                                                                "rounded-full px-2 py-0.5 text-[10px] font-semibold leading-none",
                                                                isActive
                                                                    ? "bg-primary-foreground/20 text-primary-foreground"
                                                                    : "bg-primary/10 text-primary"
                                                            )}
                                                        >
                                                            {item.badge}
                                                        </span>
                                                    )}
                                                    {hasChildren && (
                                                        <ChevronDown
                                                            className={cn(
                                                                "h-3.5 w-3.5 transition-transform duration-200 opacity-50",
                                                                isOpen && "rotate-180"
                                                            )}
                                                        />
                                                    )}
                                                </>
                                            )}
                                        </button>

                                        {/* Submenu */}
                                        {!collapsed && hasChildren && isOpen && (
                                            <div className="mt-0.5 ml-4 flex flex-col gap-0.5 border-l border-sidebar-accent pl-2.5">
                                                {item.children?.map((child) => {
                                                    const isSubActive = pathname === child.href;
                                                    return (
                                                        <Link
                                                            key={child.href}
                                                            href={child.href}
                                                            onClick={onNavigate}
                                                            className={cn(
                                                                "rounded-md px-3 py-1.5 text-xs font-medium transition-colors",
                                                                isSubActive
                                                                    ? "bg-primary/10 text-primary"
                                                                    : "text-muted-foreground hover:bg-sidebar-accent hover:text-sidebar-accent-foreground"
                                                            )}
                                                        >
                                                            {child.title}
                                                        </Link>
                                                    );
                                                })}
                                            </div>
                                        )}
                                    </div>
                                );

                                if (collapsed) {
                                    return (
                                        <Tooltip key={item.href}>
                                            <TooltipTrigger render={
                                                hasChildren ? itemContent : (
                                                    <Link href={item.href} onClick={onNavigate}>
                                                        {itemContent}
                                                    </Link>
                                                )
                                            } />
                                            <TooltipContent
                                                side="right"
                                                className="font-medium"
                                            >
                                                {item.title}
                                                {item.badge && (
                                                    <span className="ml-2 rounded-full bg-primary/10 px-1.5 text-[10px] text-primary">
                                                        {item.badge}
                                                    </span>
                                                )}
                                            </TooltipContent>
                                        </Tooltip>
                                    );
                                }

                                return (
                                    <div key={item.href}>
                                        {hasChildren ? itemContent : (
                                            <Link href={item.href} onClick={onNavigate}>
                                                {itemContent}
                                            </Link>
                                        )}
                                    </div>
                                );
                            })}
                        </div>
                    </div>
                ))}
            </div>
        </ScrollArea>
    );
}

function SidebarUser({ collapsed }: { collapsed: boolean }) {
    const { user, role } = useAuth();

    const initials = user?.user_metadata?.full_name
        ? user.user_metadata.full_name
            .split(" ")
            .map((n: string) => n[0])
            .join("")
            .toUpperCase()
            .slice(0, 2)
        : "U";

    return (
        <div
            className={cn(
                "border-t p-3 transition-all duration-200",
                collapsed ? "flex justify-center" : ""
            )}
        >
            {collapsed ? (
                <Tooltip>
                    <TooltipTrigger
                        render={
                            <button
                                onClick={() => signOut()}
                                className="flex h-9 w-9 items-center justify-center rounded-lg hover:bg-sidebar-accent transition-colors"
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
                            </button>
                        }
                    />
                    <TooltipContent side="right" className="font-medium">
                        <div className="flex flex-col gap-0.5">
                            <span>{user?.user_metadata?.full_name || "Pengguna"}</span>
                            {role && (
                                <span className="text-xs text-muted-foreground">
                                    {ROLE_LABELS[role]}
                                </span>
                            )}
                        </div>
                    </TooltipContent>
                </Tooltip>
            ) : (
                <div className="flex items-center gap-3 rounded-lg p-2 hover:bg-sidebar-accent transition-colors cursor-default">
                    <Avatar className="h-8 w-8 shrink-0">
                        <AvatarImage
                            src={user?.user_metadata?.avatar_url}
                            alt={user?.user_metadata?.full_name || "User"}
                        />
                        <AvatarFallback className="bg-primary/10 text-primary text-xs font-semibold">
                            {initials}
                        </AvatarFallback>
                    </Avatar>
                    <div className="flex-1 min-w-0">
                        <p className="truncate text-sm font-medium leading-tight text-sidebar-foreground">
                            {user?.user_metadata?.full_name || "Pengguna"}
                        </p>
                        {role && (
                            <p className="truncate text-xs text-muted-foreground leading-tight">
                                {ROLE_LABELS[role]}
                            </p>
                        )}
                    </div>
                    <Button
                        variant="ghost"
                        size="icon"
                        className="h-7 w-7 shrink-0 text-muted-foreground hover:text-destructive hover:bg-destructive/10"
                        onClick={() => signOut()}
                        title="Keluar"
                    >
                        <LogOut className="h-4 w-4" />
                    </Button>
                </div>
            )}
        </div>
    );
}

export function Sidebar({ className }: SidebarProps) {
    const [collapsed, setCollapsed] = useState(false);

    return (
        <>
            {/* Desktop Sidebar */}
            <aside
                className={cn(
                    "hidden lg:flex flex-col border-r bg-sidebar transition-all duration-300 ease-in-out",
                    collapsed ? "w-[68px]" : "w-[240px]",
                    className
                )}
            >
                {/* Logo */}
                <div
                    className={cn(
                        "flex h-16 items-center border-b px-4 shrink-0",
                        collapsed && "justify-center px-2"
                    )}
                >
                    <Link
                        href="/dashboard"
                        className={cn(
                            "flex items-center gap-2.5 transition-all",
                            collapsed && "gap-0"
                        )}
                    >
                        <div className="flex h-8 w-8 shrink-0 items-center justify-center rounded-lg bg-primary text-primary-foreground shadow-md shadow-primary/25">
                            <GraduationCap className="h-4.5 w-4.5" />
                        </div>
                        {!collapsed && (
                            <span className="text-[17px] font-bold tracking-tight text-sidebar-foreground">
                                e<span className="text-primary">School</span>
                            </span>
                        )}
                    </Link>
                </div>

                {/* Menu Items */}
                <SidebarContent collapsed={collapsed} />

                {/* User Profile */}
                <SidebarUser collapsed={collapsed} />

                {/* Collapse Toggle */}
                <div
                    className={cn(
                        "border-t p-2 shrink-0",
                        collapsed && "flex justify-center"
                    )}
                >
                    <Button
                        variant="ghost"
                        size="sm"
                        className={cn(
                            "w-full text-muted-foreground hover:text-foreground",
                            collapsed ? "w-9 px-0 justify-center" : "justify-start gap-2"
                        )}
                        onClick={() => setCollapsed(!collapsed)}
                    >
                        {collapsed ? (
                            <ChevronRight className="h-4 w-4" />
                        ) : (
                            <>
                                <ChevronLeft className="h-4 w-4" />
                                <span className="text-xs">Kecilkan Sidebar</span>
                            </>
                        )}
                    </Button>
                </div>
            </aside>

            {/* Mobile Sidebar (Sheet) */}
            <MobileSidebar />
        </>
    );
}

export function MobileSidebar() {
    const [open, setOpen] = useState(false);

    return (
        <Sheet open={open} onOpenChange={setOpen}>
            <SheetTrigger
                render={
                    <Button
                        variant="ghost"
                        size="icon"
                        className="lg:hidden"
                        id="mobile-sidebar-trigger"
                    >
                        <span className="sr-only">Toggle menu</span>
                    </Button>
                }
            />
            <SheetContent side="left" className="w-[240px] p-0 bg-sidebar">
                <SheetTitle className="sr-only">Menu Navigasi</SheetTitle>
                {/* Logo */}
                <div className="flex h-16 items-center border-b px-4 shrink-0">
                    <Link
                        href="/dashboard"
                        className="flex items-center gap-2.5"
                        onClick={() => setOpen(false)}
                    >
                        <div className="flex h-8 w-8 shrink-0 items-center justify-center rounded-lg bg-primary text-primary-foreground shadow-md shadow-primary/25">
                            <GraduationCap className="h-4.5 w-4.5" />
                        </div>
                        <span className="text-[17px] font-bold tracking-tight text-sidebar-foreground">
                            e<span className="text-primary">School</span>
                        </span>
                    </Link>
                </div>
                {/* Menu */}
                <SidebarContent
                    collapsed={false}
                    onNavigate={() => setOpen(false)}
                />
                {/* User */}
                <SidebarUser collapsed={false} />
            </SheetContent>
        </Sheet>
    );
}
