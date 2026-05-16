"use client";

import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { useState, type ReactNode } from "react";
import { Toaster } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { AuthProvider } from "@/providers/auth-provider";
import type { User } from "@supabase/supabase-js";
import type { Role } from "@/config/roles";

interface ProvidersProps {
    children: ReactNode;
    initialUser?: User | null;
    initialRole?: Role | null;
}

export function Providers({ children, initialUser, initialRole }: ProvidersProps) {
    const [queryClient] = useState(
        () =>
            new QueryClient({
                defaultOptions: {
                    queries: {
                        staleTime: 60 * 1000, // 1 minute
                        refetchOnWindowFocus: false,
                        retry: 1,
                    },
                },
            })
    );

    return (
        <QueryClientProvider client={queryClient}>
            <TooltipProvider>
                <AuthProvider initialUser={initialUser} initialRole={initialRole}>
                    {children}
                    <Toaster position="top-right" richColors closeButton />
                </AuthProvider>
            </TooltipProvider>
        </QueryClientProvider>
    );
}
