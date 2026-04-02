"use server";

import { createClient } from "@/lib/supabase/server";
import { loginSchema, registerSchema, type LoginInput, type RegisterInput } from "@/schemas/auth.schema";
import { redirect } from "next/navigation";
import { revalidatePath } from "next/cache";
import type { ActionResult } from "@/types/api.types";

export async function signIn(input: LoginInput): Promise<ActionResult> {
    const validated = loginSchema.safeParse(input);
    if (!validated.success) {
        return {
            success: false,
            error: validated.error.issues[0]?.message || "Data tidak valid",
        };
    }

    const supabase = await createClient();
    const { error } = await supabase.auth.signInWithPassword({
        email: validated.data.email,
        password: validated.data.password,
    });

    if (error) {
        if (error.message.includes("Invalid login credentials")) {
            return { success: false, error: "Email atau password salah" };
        }
        if (error.message.includes("Email not confirmed")) {
            return { success: false, error: "Email belum dikonfirmasi. Cek inbox Anda" };
        }
        return { success: false, error: error.message };
    }

    revalidatePath("/", "layout");
    redirect("/dashboard");
}

export async function signUp(input: RegisterInput): Promise<ActionResult> {
    const validated = registerSchema.safeParse(input);
    if (!validated.success) {
        return {
            success: false,
            error: validated.error.issues[0]?.message || "Data tidak valid",
        };
    }

    const supabase = await createClient();
    const { error } = await supabase.auth.signUp({
        email: validated.data.email,
        password: validated.data.password,
        options: {
            data: {
                full_name: validated.data.full_name,
            },
        },
    });

    if (error) {
        if (error.message.includes("already registered")) {
            return { success: false, error: "Email sudah terdaftar" };
        }
        return { success: false, error: error.message };
    }

    return { success: true };
}

export async function signOut(): Promise<void> {
    const supabase = await createClient();
    await supabase.auth.signOut();
    revalidatePath("/", "layout");
    redirect("/login");
}

export async function getCurrentUser() {
    const supabase = await createClient();
    const {
        data: { user },
    } = await supabase.auth.getUser();
    return user;
}

export async function getUserRole(userId: string): Promise<string | null> {
    const supabase = await createClient();
    const { data } = await supabase
        .from("user_roles")
        .select("role")
        .eq("user_id", userId)
        .single();
    return data?.role || null;
}
