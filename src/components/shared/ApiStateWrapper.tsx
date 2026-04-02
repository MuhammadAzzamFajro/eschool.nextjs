import { LoadingSkeleton } from "./LoadingSkeleton";
import { EmptyState } from "./EmptyState";
import { AlertTriangle, RefreshCw } from "lucide-react";
import { Button } from "@/components/ui/button";

interface ApiStateWrapperProps<T> {
    isLoading: boolean;
    isError: boolean;
    error?: Error | null;
    data: T | undefined | null;
    isEmpty?: boolean;
    loadingVariant?: "table" | "card" | "form" | "detail";
    emptyTitle?: string;
    emptyDescription?: string;
    emptyActionLabel?: string;
    emptyActionHref?: string;
    onRetry?: () => void;
    children: (data: T) => React.ReactNode;
}

export function ApiStateWrapper<T>({
    isLoading,
    isError,
    error,
    data,
    isEmpty,
    loadingVariant = "table",
    emptyTitle = "Tidak ada data",
    emptyDescription = "Belum ada data yang tersedia.",
    emptyActionLabel,
    emptyActionHref,
    onRetry,
    children,
}: ApiStateWrapperProps<T>) {
    if (isLoading) {
        return <LoadingSkeleton variant={loadingVariant} />;
    }

    if (isError) {
        return (
            <div className="flex flex-col items-center justify-center py-16 px-4 text-center">
                <div className="flex h-16 w-16 items-center justify-center rounded-2xl bg-destructive/10 mb-4">
                    <AlertTriangle className="h-8 w-8 text-destructive" />
                </div>
                <h3 className="text-lg font-semibold">Gagal Memuat Data</h3>
                <p className="mt-1 text-sm text-muted-foreground max-w-sm">
                    {error?.message || "Terjadi kesalahan saat mengambil data."}
                </p>
                {onRetry && (
                    <Button variant="outline" className="mt-6" onClick={onRetry}>
                        <RefreshCw className="h-4 w-4 mr-2" />
                        Coba Lagi
                    </Button>
                )}
            </div>
        );
    }

    if (!data || isEmpty) {
        return (
            <EmptyState
                title={emptyTitle}
                description={emptyDescription}
                actionLabel={emptyActionLabel}
                actionHref={emptyActionHref}
            />
        );
    }

    return <>{children(data)}</>;
}
