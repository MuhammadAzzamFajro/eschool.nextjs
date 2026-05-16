"use client";

import { useEffect, useState } from "react";
import { PageHeader } from "@/components/shared/PageHeader";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { getProfile, updateProfile, type Profile } from "@/services/profile.service";
import { toast } from "sonner";
import { Loader2, User, Mail, Phone, Shield, Calendar } from "lucide-react";
import { ROLE_LABELS } from "@/config/roles";

export default function ProfilePage() {
    const [profile, setProfile] = useState<Profile | null>(null);
    const [loading, setLoading] = useState(true);
    const [saving, setSaving] = useState(false);
    const [formData, setFormData] = useState({
        full_name: "",
        phone: "",
    });

    useEffect(() => {
        const fetchProfile = async () => {
            try {
                const data = await getProfile();
                if (data) {
                    setProfile(data);
                    setFormData({
                        full_name: data.full_name || "",
                        phone: data.phone || "",
                    });
                }
            } catch (error) {
                console.error("Error fetching profile:", error);
                toast.error("Gagal mengambil data profil");
            } finally {
                setLoading(false);
            }
        };

        fetchProfile();
    }, []);

    const handleSave = async (e: React.FormEvent) => {
        e.preventDefault();
        setSaving(true);
        try {
            const result = await updateProfile(formData);
            if (result.success) {
                toast.success("Profil berhasil diperbarui");
                // Refresh local state
                if (profile) {
                    setProfile({ ...profile, ...formData });
                }
            } else {
                toast.error(result.error || "Gagal memperbarui profil");
            }
        } catch (error) {
            toast.error("Terjadi kesalahan sistem");
        } finally {
            setSaving(false);
        }
    };

    if (loading) {
        return (
            <div className="flex h-[400px] items-center justify-center">
                <Loader2 className="h-8 w-8 animate-spin text-primary" />
            </div>
        );
    }

    if (!profile) {
        return (
            <div className="text-center py-12">
                <p className="text-muted-foreground">Profil tidak ditemukan. Silakan login kembali.</p>
            </div>
        );
    }

    const initials = profile.full_name
        ? profile.full_name.split(" ").map(n => n[0]).join("").toUpperCase().slice(0, 2)
        : "U";

    return (
        <div className="space-y-6 max-w-4xl mx-auto">
            <PageHeader
                title="Profil Pengguna"
                description="Kelola informasi pribadi dan pengaturan akun Anda"
            />

            <div className="grid gap-6 md:grid-cols-3">
                {/* Profile Overview */}
                <Card className="md:col-span-1 border-0 shadow-sm h-fit">
                    <CardHeader className="text-center pb-2">
                        <div className="flex justify-center mb-4">
                            <Avatar className="h-24 w-24 border-4 border-primary/10">
                                <AvatarImage src={profile.avatar_url || ""} />
                                <AvatarFallback className="text-2xl bg-primary/5 text-primary font-bold">
                                    {initials}
                                </AvatarFallback>
                            </Avatar>
                        </div>
                        <CardTitle className="text-xl">{profile.full_name}</CardTitle>
                        <CardDescription>{profile.role ? ROLE_LABELS[profile.role as keyof typeof ROLE_LABELS] : "Pengguna"}</CardDescription>
                    </CardHeader>
                    <CardContent className="space-y-4 pt-4 border-t">
                        <div className="flex items-center gap-3 text-sm">
                            <Mail className="h-4 w-4 text-muted-foreground" />
                            <span className="truncate">{profile.email}</span>
                        </div>
                        <div className="flex items-center gap-3 text-sm">
                            <Shield className="h-4 w-4 text-muted-foreground" />
                            <span>Role: <span className="font-medium capitalize">{profile.role || "staf"}</span></span>
                        </div>
                        <div className="flex items-center gap-3 text-sm">
                            <Calendar className="h-4 w-4 text-muted-foreground" />
                            <span>Bergabung: {new Date(profile.created_at).toLocaleDateString("id-ID", { month: "long", year: "numeric" })}</span>
                        </div>
                    </CardContent>
                </Card>

                {/* Edit Form */}
                <Card className="md:col-span-2 border-0 shadow-sm">
                    <CardHeader>
                        <CardTitle>Informasi Pribadi</CardTitle>
                        <CardDescription>Perbarui nama dan nomor telepon Anda</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <form onSubmit={handleSave} className="space-y-4">
                            <div className="grid gap-4 sm:grid-cols-2">
                                <div className="space-y-2">
                                    <Label htmlFor="full_name">Nama Lengkap</Label>
                                    <div className="relative">
                                        <User className="absolute left-3 top-2.5 h-4 w-4 text-muted-foreground" />
                                        <Input
                                            id="full_name"
                                            className="pl-9"
                                            value={formData.full_name}
                                            onChange={(e) => setFormData({ ...formData, full_name: e.target.value })}
                                            required
                                        />
                                    </div>
                                </div>
                                <div className="space-y-2">
                                    <Label htmlFor="phone">Nomor Telepon</Label>
                                    <div className="relative">
                                        <Phone className="absolute left-3 top-2.5 h-4 w-4 text-muted-foreground" />
                                        <Input
                                            id="phone"
                                            className="pl-9"
                                            placeholder="Contoh: 08123456789"
                                            value={formData.phone}
                                            onChange={(e) => setFormData({ ...formData, phone: e.target.value })}
                                        />
                                    </div>
                                </div>
                            </div>

                            <div className="space-y-2">
                                <Label>Email (Tidak dapat diubah)</Label>
                                <div className="relative">
                                    <Mail className="absolute left-3 top-2.5 h-4 w-4 text-muted-foreground" />
                                    <Input
                                        value={profile.email}
                                        disabled
                                        className="pl-9 bg-muted/50"
                                    />
                                </div>
                            </div>

                            <div className="pt-4 flex justify-end">
                                <Button type="submit" disabled={saving} className="min-w-[120px]">
                                    {saving ? (
                                        <>
                                            <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                                            Menyimpan...
                                        </>
                                    ) : (
                                        "Simpan Perubahan"
                                    )}
                                </Button>
                            </div>
                        </form>
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}
