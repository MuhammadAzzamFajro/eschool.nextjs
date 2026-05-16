"use client";

import { useAuth } from "@/hooks/useAuth";
import { usePathname, useRouter } from "next/navigation";
import { useEffect } from "react";
import { hasPermission } from "@/config/roles";
import { getResourceForPath } from "@/config/menu";
import { Loader2 } from "lucide-react";

export function RoleGuard({ children }: { children: React.ReactNode }) {
    const { user, role, loading } = useAuth();
    const pathname = usePathname();
    const router = useRouter();

    useEffect(() => {
        if (!loading && !user) {
            router.push("/login");
            return;
        }

        if (!loading) {
            const resource = getResourceForPath(pathname);
            
            // If the path is mapped to a resource, check permissions
            if (resource) {
                // If no role, fallback to 'staf' permissions
                const effectiveRole = role || "staf";

                // Check permission
                if (!hasPermission(effectiveRole, resource, "view")) {
                    router.push("/dashboard");
                }
            }
        }
    }, [user, role, loading, pathname, router]);

    if (loading) {
        return (
            <div className="flex h-[calc(100vh-4rem)] items-center justify-center">
                <Loader2 className="h-8 w-8 animate-spin text-primary" />
            </div>
        );
    }

    if (!user) return null;

    const resource = getResourceForPath(pathname);
    if (role && resource && !hasPermission(role, resource, "view")) {
        return null; // Will redirect in useEffect
    }

    return <>{children}</>;
}
