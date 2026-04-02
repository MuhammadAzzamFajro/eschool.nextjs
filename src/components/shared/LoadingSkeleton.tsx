import { Skeleton } from "@/components/ui/skeleton";

interface LoadingSkeletonProps {
    variant?: "table" | "card" | "form" | "detail";
    rows?: number;
}

export function LoadingSkeleton({
    variant = "table",
    rows = 5,
}: LoadingSkeletonProps) {
    if (variant === "table") {
        return (
            <div className="space-y-4">
                {/* Search bar skeleton */}
                <Skeleton className="h-10 w-72" />
                {/* Table skeleton */}
                <div className="rounded-lg border bg-card overflow-hidden">
                    {/* Header */}
                    <div className="flex items-center gap-4 px-4 py-3 border-b bg-muted/30">
                        {Array.from({ length: 4 }).map((_, i) => (
                            <Skeleton key={i} className="h-4 flex-1" />
                        ))}
                    </div>
                    {/* Rows */}
                    {Array.from({ length: rows }).map((_, i) => (
                        <div
                            key={i}
                            className="flex items-center gap-4 px-4 py-3 border-b last:border-0"
                        >
                            {Array.from({ length: 4 }).map((_, j) => (
                                <Skeleton key={j} className="h-4 flex-1" />
                            ))}
                        </div>
                    ))}
                </div>
                {/* Pagination skeleton */}
                <div className="flex justify-between">
                    <Skeleton className="h-8 w-48" />
                    <Skeleton className="h-8 w-48" />
                </div>
            </div>
        );
    }

    if (variant === "card") {
        return (
            <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
                {Array.from({ length: rows }).map((_, i) => (
                    <div key={i} className="rounded-lg border bg-card p-6 space-y-3">
                        <Skeleton className="h-4 w-24" />
                        <Skeleton className="h-8 w-16" />
                        <Skeleton className="h-3 w-32" />
                    </div>
                ))}
            </div>
        );
    }

    if (variant === "form") {
        return (
            <div className="max-w-2xl space-y-6">
                {Array.from({ length: rows }).map((_, i) => (
                    <div key={i} className="space-y-2">
                        <Skeleton className="h-4 w-24" />
                        <Skeleton className="h-10 w-full" />
                    </div>
                ))}
                <div className="flex gap-4 pt-4">
                    <Skeleton className="h-10 w-24" />
                    <Skeleton className="h-10 w-24" />
                </div>
            </div>
        );
    }

    if (variant === "detail") {
        return (
            <div className="space-y-6">
                <div className="flex items-center gap-4">
                    <Skeleton className="h-20 w-20 rounded-full" />
                    <div className="space-y-2">
                        <Skeleton className="h-6 w-48" />
                        <Skeleton className="h-4 w-32" />
                    </div>
                </div>
                <div className="grid gap-4 sm:grid-cols-2">
                    {Array.from({ length: 6 }).map((_, i) => (
                        <div key={i} className="space-y-2">
                            <Skeleton className="h-4 w-20" />
                            <Skeleton className="h-5 w-40" />
                        </div>
                    ))}
                </div>
            </div>
        );
    }

    return null;
}
