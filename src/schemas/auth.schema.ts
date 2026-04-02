import { z } from "zod";

export const loginSchema = z.object({
    email: z
        .string()
        .min(1, "Email wajib diisi")
        .email("Format email tidak valid")
        .max(255, "Email terlalu panjang"),
    password: z
        .string()
        .min(1, "Password wajib diisi")
        .min(8, "Password minimal 8 karakter")
        .max(128, "Password terlalu panjang"),
});

export type LoginInput = z.infer<typeof loginSchema>;

export const registerSchema = z
    .object({
        full_name: z
            .string()
            .min(1, "Nama lengkap wajib diisi")
            .min(2, "Nama minimal 2 karakter")
            .max(100, "Nama terlalu panjang"),
        email: z
            .string()
            .min(1, "Email wajib diisi")
            .email("Format email tidak valid")
            .max(255, "Email terlalu panjang"),
        password: z
            .string()
            .min(1, "Password wajib diisi")
            .min(8, "Password minimal 8 karakter")
            .max(128, "Password terlalu panjang"),
        confirmPassword: z.string().min(1, "Konfirmasi password wajib diisi"),
    })
    .refine((data) => data.password === data.confirmPassword, {
        message: "Password tidak cocok",
        path: ["confirmPassword"],
    });

export type RegisterInput = z.infer<typeof registerSchema>;
