"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { cn } from "@/lib/utils";
import { GraduationCap, ChevronLeft, ChevronRight } from "lucide-react";
import { Button } from "@/components/ui/button";
import { ScrollArea } from "@/components/ui/scroll-area";
import { Separator } from "@/components/ui/separator";
import {
    Tooltip,
    TooltipContent,
    TooltipTrigger,
} from "@/components/ui/tooltip";
import { Sheet, SheetContent, SheetTrigger, SheetTitle } from "@/components/ui/sheet";
import { menuGroups, type MenuGroup } from "@/config/menu";
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

    return (
        <ScrollArea className="flex-1 py-2">
            <div className="space-y-4 px-3">
                {menuGroups.map((group: MenuGroup) => (
                    <div key={group.label}>
                        {!collapsed && (
                            <p className="mb-2 px-3 text-xs font-semibold uppercase tracking-wider text-muted-foreground/70">
                                {group.label}
                            </p>
                        )}
                        {collapsed && <Separator className="my-2" />}
                        <div className="space-y-1">
                            {group.items.map((item) => {
                                const isActive =
                                    pathname === item.href ||
                                    (item.href !== "/dashboard" &&
                                        pathname.startsWith(item.href));
                                const Icon = item.icon;

                                const linkContent = (
                                    <Link
                                        href={item.href}
                                        onClick={onNavigate}
                                        className={cn(
                                            "flex items-center gap-3 rounded-lg px-3 py-2.5 text-sm font-medium transition-all duration-200",
                                            isActive
                                                ? "bg-primary text-primary-foreground shadow-md shadow-primary/25"
                                                : "text-muted-foreground hover:bg-accent hover:text-accent-foreground"
                                        )}
                                    >
                                        <Icon
                                            className={cn(
                                                "h-4.5 w-4.5 shrink-0",
                                                collapsed && "h-5 w-5"
                                            )}
                                        />
                                        {!collapsed && <span>{item.title}</span>}
                                        {!collapsed && item.badge && (
                                            <span className="ml-auto rounded-full bg-primary/10 px-2 py-0.5 text-xs font-medium text-primary">
                                                {item.badge}
                                            </span>
                                        )}
                                    </Link>
                                );

                                if (collapsed) {
                                    return (
                                        <Tooltip key={item.href}>
                                            <TooltipTrigger render={linkContent} />
                                            <TooltipContent side="right" className="font-medium">
                                                {item.title}
                                            </TooltipContent>
                                        </Tooltip>
                                    );
                                }

                                return <div key={item.href}>{linkContent}</div>;
                            })}
                        </div>
                    </div>
                ))}
            </div>
        </ScrollArea>
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
                    collapsed ? "w-[68px]" : "w-64",
                    className
                )}
            >
                {/* Logo */}
                <div className="flex h-16 items-center border-b px-4">
                    <Link href="/dashboard" className="flex items-center gap-2.5">
                        <div className="flex h-9 w-9 shrink-0 items-center justify-center rounded-lg bg-primary text-primary-foreground shadow-md shadow-primary/25">
                            <GraduationCap className="h-5 w-5" />
                        </div>
                        {!collapsed && (
                            <span className="text-lg font-bold tracking-tight">
                                e<span className="text-primary">School</span>
                            </span>
                        )}
                    </Link>
                </div>

                {/* Menu Items */}
                <SidebarContent collapsed={collapsed} />

                {/* Collapse Toggle */}
                <div className="border-t p-2">
                    <Button
                        variant="ghost"
                        size="sm"
                        className="w-full justify-center"
                        onClick={() => setCollapsed(!collapsed)}
                    >
                        {collapsed ? (
                            <ChevronRight className="h-4 w-4" />
                        ) : (
                            <>
                                <ChevronLeft className="h-4 w-4 mr-2" />
                                <span className="text-xs">Kecilkan</span>
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
            <SheetTrigger render={
                <Button
                    variant="ghost"
                    size="icon"
                    className="lg:hidden"
                    id="mobile-sidebar-trigger"
                >
                    <span className="sr-only">Toggle menu</span>
                </Button>
            } />
            <SheetContent side="left" className="w-64 p-0">
                <SheetTitle className="sr-only">Menu Navigasi</SheetTitle>
                <div className="flex h-16 items-center border-b px-4">
                    <Link
                        href="/dashboard"
                        className="flex items-center gap-2.5"
                        onClick={() => setOpen(false)}
                    >
                        <div className="flex h-9 w-9 shrink-0 items-center justify-center rounded-lg bg-primary text-primary-foreground shadow-md shadow-primary/25">
                            <GraduationCap className="h-5 w-5" />
                        </div>
                        <span className="text-lg font-bold tracking-tight">
                            e<span className="text-primary">School</span>
                        </span>
                    </Link>
                </div>
                <SidebarContent collapsed={false} onNavigate={() => setOpen(false)} />
            </SheetContent>
        </Sheet>
    );
}
