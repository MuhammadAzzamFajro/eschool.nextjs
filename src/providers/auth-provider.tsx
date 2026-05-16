"use client";

import { createContext, useContext, useEffect, useState, type ReactNode } from "react";
import { createClient } from "@/lib/supabase/client";
import type { User } from "@supabase/supabase-js";
import type { Role } from "@/config/roles";

interface AuthState {
    user: User | null;
    role: Role | null;
    loading: boolean;
}

interface AuthContextType extends AuthState {
    refresh: () => Promise<void>;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export function AuthProvider({ 
    children,
    initialUser = null,
    initialRole = null
}: { 
    children: ReactNode;
    initialUser?: User | null;
    initialRole?: Role | null;
}) {
    const [state, setState] = useState<AuthState>({
        user: initialUser,
        role: initialRole,
        loading: !initialUser, // If we have an initial user, we're not loading
    });

    const refresh = async () => {
        const supabase = createClient();
        try {
            const { data: { user } } = await supabase.auth.getUser();
            if (user) {
                const { data: roleData } = await supabase
                    .from("user_roles")
                    .select("role")
                    .eq("user_id", user.id)
                    .single();

                setState({
                    user,
                    role: (roleData?.role as Role) || null,
                    loading: false,
                });
            } else {
                setState({ user: null, role: null, loading: false });
            }
        } catch {
            setState({ user: null, role: null, loading: false });
        }
    };

    useEffect(() => {
        const supabase = createClient();

        // If we don't have initial data, fetch it
        if (!initialUser) {
            refresh();
        }

        const { data: { subscription } } = supabase.auth.onAuthStateChange(async (_event, session) => {
            if (session?.user) {
                const { data: roleData } = await supabase
                    .from("user_roles")
                    .select("role")
                    .eq("user_id", session.user.id)
                    .single();

                setState({
                    user: session.user,
                    role: (roleData?.role as Role) || null,
                    loading: false,
                });
            } else {
                setState({ user: null, role: null, loading: false });
            }
        });

        return () => {
            subscription.unsubscribe();
        };
    }, [initialUser]);

    return (
        <AuthContext.Provider value={{ ...state, refresh }}>
            {children}
        </AuthContext.Provider>
    );
}

export function useAuthContext() {
    const context = useContext(AuthContext);
    if (context === undefined) {
        throw new Error("useAuthContext must be used within an AuthProvider");
    }
    return context;
}
