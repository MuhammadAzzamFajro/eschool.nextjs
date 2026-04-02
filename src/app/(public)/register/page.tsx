"use client";

import Link from "next/link";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { registerSchema, type RegisterInput } from "@/schemas/auth.schema";
import { signUp } from "@/services/auth.service";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
    Card,
    CardContent,
    CardDescription,
    CardFooter,
    CardHeader,
    CardTitle,
} from "@/components/ui/card";
import { GraduationCap, Loader2, Eye, EyeOff, CheckCircle } from "lucide-react";
import { useState } from "react";
import { toast } from "sonner";

export default function RegisterPage() {
    const [showPassword, setShowPassword] = useState(false);
    const [loading, setLoading] = useState(false);
    const [success, setSuccess] = useState(false);

    const {
        register,
        handleSubmit,
        formState: { errors },
    } = useForm<RegisterInput>({
        resolver: zodResolver(registerSchema),
    });

    const onSubmit = async (data: RegisterInput) => {
        setLoading(true);
        try {
            const result = await signUp(data);
            if (result.success) {
                setSuccess(true);
                toast.success("Registrasi berhasil! Cek email Anda untuk konfirmasi.");
            } else if (result.error) {
                toast.error(result.error);
            }
        } catch {
            toast.error("Terjadi kesalahan. Silakan coba lagi.");
        } finally {
            setLoading(false);
        }
    };

    if (success) {
        return (
            <div className="flex min-h-[calc(100vh-8rem)] items-center justify-center px-4 py-12">
                <Card className="w-full max-w-md border-0 shadow-xl shadow-primary/5">
                    <CardContent className="pt-8 pb-8 text-center space-y-4">
                        <div className="flex justify-center">
                            <div className="flex h-16 w-16 items-center justify-center rounded-full bg-emerald-100 dark:bg-emerald-900/30">
                                <CheckCircle className="h-8 w-8 text-emerald-600" />
                            </div>
                        </div>
                        <div>
                            <h2 className="text-xl font-bold">Registrasi Berhasil!</h2>
                            <p className="mt-2 text-sm text-muted-foreground">
                                Kami telah mengirim link konfirmasi ke email Anda. Silakan cek
                                inbox dan klik link tersebut untuk mengaktifkan akun.
                            </p>
                        </div>
                        <Button asChild variant="outline">
                            <Link href="/login">Ke Halaman Login</Link>
                        </Button>
                    </CardContent>
                </Card>
            </div>
        );
    }

    return (
        <div className="flex min-h-[calc(100vh-8rem)] items-center justify-center px-4 py-12">
            {/* Background decoration */}
            <div className="absolute inset-0 -z-10 overflow-hidden">
                <div className="absolute top-1/4 right-1/3 h-96 w-96 rounded-full bg-primary/5 blur-3xl" />
                <div className="absolute bottom-1/3 left-1/4 h-96 w-96 rounded-full bg-primary/10 blur-3xl" />
            </div>

            <Card className="w-full max-w-md border-0 shadow-xl shadow-primary/5">
                <CardHeader className="text-center space-y-4">
                    <div className="flex justify-center">
                        <div className="flex h-14 w-14 items-center justify-center rounded-2xl bg-primary text-primary-foreground shadow-lg shadow-primary/30">
                            <GraduationCap className="h-7 w-7" />
                        </div>
                    </div>
                    <div>
                        <CardTitle className="text-2xl font-bold">Daftar Akun</CardTitle>
                        <CardDescription className="mt-1.5">
                            Buat akun baru untuk mengakses eSchool
                        </CardDescription>
                    </div>
                </CardHeader>

                <form onSubmit={handleSubmit(onSubmit)}>
                    <CardContent className="space-y-4">
                        <div className="space-y-2">
                            <Label htmlFor="full_name">Nama Lengkap</Label>
                            <Input
                                id="full_name"
                                placeholder="Masukkan nama lengkap"
                                autoComplete="name"
                                disabled={loading}
                                {...register("full_name")}
                            />
                            {errors.full_name && (
                                <p className="text-xs text-destructive">
                                    {errors.full_name.message}
                                </p>
                            )}
                        </div>

                        <div className="space-y-2">
                            <Label htmlFor="email">Email</Label>
                            <Input
                                id="email"
                                type="email"
                                placeholder="nama@sekolah.ac.id"
                                autoComplete="email"
                                disabled={loading}
                                {...register("email")}
                            />
                            {errors.email && (
                                <p className="text-xs text-destructive">{errors.email.message}</p>
                            )}
                        </div>

                        <div className="space-y-2">
                            <Label htmlFor="password">Password</Label>
                            <div className="relative">
                                <Input
                                    id="password"
                                    type={showPassword ? "text" : "password"}
                                    placeholder="Minimal 8 karakter"
                                    autoComplete="new-password"
                                    disabled={loading}
                                    {...register("password")}
                                />
                                <Button
                                    type="button"
                                    variant="ghost"
                                    size="icon"
                                    className="absolute right-0 top-0 h-full px-3 hover:bg-transparent"
                                    onClick={() => setShowPassword(!showPassword)}
                                >
                                    {showPassword ? (
                                        <EyeOff className="h-4 w-4 text-muted-foreground" />
                                    ) : (
                                        <Eye className="h-4 w-4 text-muted-foreground" />
                                    )}
                                </Button>
                            </div>
                            {errors.password && (
                                <p className="text-xs text-destructive">
                                    {errors.password.message}
                                </p>
                            )}
                        </div>

                        <div className="space-y-2">
                            <Label htmlFor="confirmPassword">Konfirmasi Password</Label>
                            <Input
                                id="confirmPassword"
                                type="password"
                                placeholder="Ulangi password"
                                autoComplete="new-password"
                                disabled={loading}
                                {...register("confirmPassword")}
                            />
                            {errors.confirmPassword && (
                                <p className="text-xs text-destructive">
                                    {errors.confirmPassword.message}
                                </p>
                            )}
                        </div>
                    </CardContent>

                    <CardFooter className="flex flex-col gap-4">
                        <Button
                            type="submit"
                            className="w-full shadow-md shadow-primary/25"
                            disabled={loading}
                        >
                            {loading ? (
                                <>
                                    <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                                    Memproses...
                                </>
                            ) : (
                                "Daftar"
                            )}
                        </Button>
                        <p className="text-sm text-muted-foreground text-center">
                            Sudah punya akun?{" "}
                            <Link
                                href="/login"
                                className="font-medium text-primary hover:underline"
                            >
                                Masuk di sini
                            </Link>
                        </p>
                    </CardFooter>
                </form>
            </Card>
        </div>
    );
}
