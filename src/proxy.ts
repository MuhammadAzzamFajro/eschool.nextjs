import { createServerClient } from "@supabase/ssr";
import { NextResponse, type NextRequest } from "next/server";

export async function proxy(request: NextRequest) {
    let supabaseResponse = NextResponse.next({
        request,
    });

    const supabase = createServerClient(
        process.env.NEXT_PUBLIC_SUPABASE_URL!,
        process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
        {
            cookies: {
                getAll() {
                    return request.cookies.getAll();
                },
                setAll(cookiesToSet) {
                    cookiesToSet.forEach(({ name, value }) =>
                        request.cookies.set(name, value)
                    );
                    supabaseResponse = NextResponse.next({
                        request,
                    });
                    cookiesToSet.forEach(({ name, value, options }) =>
                        supabaseResponse.cookies.set(name, value, options)
                    );
                },
            },
        }
    );

    // IMPORTANT: Do not add logic between createServerClient and
    // supabase.auth.getUser(). A simple mistake could make it very hard to debug
    // issues with users being randomly logged out.
    // Wrapped in try/catch to prevent middleware crash if Supabase is unreachable.
    let user = null;
    try {
        const { data } = await supabase.auth.getUser();
        user = data.user;
    } catch {
        // If Supabase is unreachable, treat user as unauthenticated and continue
        user = null;
    }

    const isAuthPage =
        request.nextUrl.pathname === "/login" ||
        request.nextUrl.pathname === "/register";
    const isDashboardPage = request.nextUrl.pathname.startsWith("/dashboard") ||
        request.nextUrl.pathname.startsWith("/siswa") ||
        request.nextUrl.pathname.startsWith("/guru") ||
        request.nextUrl.pathname.startsWith("/staf") ||
        request.nextUrl.pathname.startsWith("/akademik") ||
        request.nextUrl.pathname.startsWith("/kelas") ||
        request.nextUrl.pathname.startsWith("/pelajaran") ||
        request.nextUrl.pathname.startsWith("/jadwal") ||
        request.nextUrl.pathname.startsWith("/kehadiran") ||
        request.nextUrl.pathname.startsWith("/ujian") ||
        request.nextUrl.pathname.startsWith("/penugasan") ||
        request.nextUrl.pathname.startsWith("/pengumuman") ||
        request.nextUrl.pathname.startsWith("/tahun-ajaran") ||
        request.nextUrl.pathname.startsWith("/hari-libur") ||
        request.nextUrl.pathname.startsWith("/pengeluaran") ||
        request.nextUrl.pathname.startsWith("/cuti-staf") ||
        request.nextUrl.pathname.startsWith("/biaya") ||
        request.nextUrl.pathname.startsWith("/galeri") ||
        request.nextUrl.pathname.startsWith("/kartu-id") ||
        request.nextUrl.pathname.startsWith("/sertifikat") ||
        request.nextUrl.pathname.startsWith("/pengaturan") ||
        request.nextUrl.pathname.startsWith("/absensi") ||
        request.nextUrl.pathname.startsWith("/kurikulum") ||
        request.nextUrl.pathname.startsWith("/kesiswaan") ||
        request.nextUrl.pathname.startsWith("/notifikasi");

    // Redirect authenticated users away from login/register
    if (user && isAuthPage) {
        const url = request.nextUrl.clone();
        url.pathname = "/dashboard";
        return NextResponse.redirect(url);
    }

    // Redirect unauthenticated users to login
    if (!user && isDashboardPage) {
        const url = request.nextUrl.clone();
        url.pathname = "/login";
        url.searchParams.set("redirect", request.nextUrl.pathname);
        return NextResponse.redirect(url);
    }

    return supabaseResponse;
}

export const config = {
    matcher: [
        /*
         * Match all request paths except for the ones starting with:
         * - _next/static (static files)
         * - _next/image (image optimization files)
         * - favicon.ico (favicon file)
         * - api (API routes)
         * - public files
         */
        "/((?!_next/static|_next/image|favicon.ico|api|.*\\.(?:svg|png|jpg|jpeg|gif|webp)$).*)",
    ],
};
