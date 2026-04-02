"use client";

import { useEffect, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import type { User } from "@supabase/supabase-js";
import type { Role } from "@/config/roles";

interface AuthState {
    user: User | null;
    role: Role | null;
    loading: boolean;
}

export function useAuth() {
    const [state, setState] = useState<AuthState>({
        user: null,
        role: null,
        loading: true,
    });

    useEffect(() => {
        const supabase = createClient();

        // Get initial session
        const getSession = async () => {
            try {
                const {
                    data: { user },
                } = await supabase.auth.getUser();

                if (user) {
                    // Fetch role
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

        getSession();

        // Listen for auth changes
        const {
            data: { subscription },
        } = supabase.auth.onAuthStateChange(async (_event, session) => {
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
    }, []);

    return state;
}
