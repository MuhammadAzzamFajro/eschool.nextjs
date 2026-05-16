import { Sidebar } from "@/components/layout/Sidebar";
import { Header } from "@/components/layout/Header";
import { getProfile } from "@/services/profile.service";
import { getCurrentUser } from "@/services/auth.service";
import { redirect } from "next/navigation";
import { RoleGuard } from "@/components/auth/RoleGuard";
import { AuthProvider } from "@/providers/auth-provider";
import { Role } from "@/config/roles";

export default async function DashboardLayout({
    children,
}: {
    children: React.ReactNode;
}) {
    const user = await getCurrentUser();
    
    if (!user) {
        redirect("/login");
    }

    const profile = await getProfile();

    return (
        <AuthProvider initialUser={user} initialRole={profile?.role as Role}>
            <div className="flex h-screen overflow-hidden">
                <Sidebar />
                <div className="flex flex-1 flex-col overflow-hidden">
                    <Header />
                    <main className="flex-1 overflow-y-auto bg-muted/30 p-4 lg:p-6">
                        <RoleGuard>
                            {children}
                        </RoleGuard>
                    </main>
                </div>
            </div>
        </AuthProvider>
    );
}
