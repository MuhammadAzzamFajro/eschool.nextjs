"use server";

import { createClient } from "@/lib/supabase/server";
import { revalidatePath } from "next/cache";
import type { ActionResult } from "@/types/api.types";

export interface Profile {
    id: string;
    email: string;
    full_name: string;
    avatar_url: string | null;
    phone: string | null;
    created_at: string;
    updated_at: string;
    role?: string;
}

export async function getProfile(): Promise<Profile | null> {
    const supabase = await createClient();
    const {
        data: { user },
    } = await supabase.auth.getUser();

    if (!user) return null;

    const { data: profile } = await supabase
        .from("profiles")
        .select("*")
        .eq("id", user.id)
        .single();

    if (!profile) return null;

    const { data: roleData } = await supabase
        .from("user_roles")
        .select("role")
        .eq("user_id", user.id)
        .single();

    return {
        ...profile,
        role: roleData?.role ?? undefined,
    };
}

export async function updateProfile(input: {
    full_name: string;
    phone?: string;
}): Promise<ActionResult> {
    const supabase = await createClient();
    const {
        data: { user },
    } = await supabase.auth.getUser();

    if (!user) return { success: false, error: "Tidak terautentikasi" };

    const { error } = await supabase
        .from("profiles")
        .update({
            full_name: input.full_name,
            phone: input.phone ?? null,
            updated_at: new Date().toISOString(),
        })
        .eq("id", user.id);

    if (error) return { success: false, error: error.message };

    revalidatePath("/profile");
    revalidatePath("/dashboard");
    return { success: true };
}

export async function getAllProfiles(): Promise<Profile[]> {
    const supabase = await createClient();

    const { data: profiles, error } = await supabase
        .from("profiles")
        .select("*")
        .order("created_at", { ascending: false });

    if (error || !profiles) return [];

    // Fetch roles
    const { data: roles } = await supabase.from("user_roles").select("user_id, role");

    const roleMap = new Map(roles?.map((r) => [r.user_id, r.role]) ?? []);

    return profiles.map((p) => ({
        ...p,
        role: roleMap.get(p.id) ?? "staf",
    }));
}

export async function getDashboardStats() {
    const supabase = await createClient();

    const { data: profiles } = await supabase.from("profiles").select("id, created_at");
    const { data: roles } = await supabase.from("user_roles").select("role");

    const totalUsers = profiles?.length ?? 0;
    const roleCounts = roles?.reduce(
        (acc, r) => {
            acc[r.role] = (acc[r.role] || 0) + 1;
            return acc;
        },
        {} as Record<string, number>
    ) ?? {};

    const currentMonth = new Date().getMonth();
    const currentYear = new Date().getFullYear();
    const newThisMonth =
        profiles?.filter((p) => {
            const d = new Date(p.created_at);
            return d.getMonth() === currentMonth && d.getFullYear() === currentYear;
        }).length ?? 0;

    return {
        totalUsers,
        totalGuru: roleCounts["guru"] ?? 0,
        totalStaf: roleCounts["staf"] ?? 0,
        totalAdmin: (roleCounts["admin"] ?? 0) + (roleCounts["super_admin"] ?? 0),
        newThisMonth,
    };
}
