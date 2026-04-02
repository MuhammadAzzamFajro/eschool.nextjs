import { cn } from "@/lib/utils";
import { STATUS_COLORS, STATUS_LABELS, type StatusType } from "@/lib/constants";

interface StatusBadgeProps {
    status: StatusType;
    className?: string;
}

export function StatusBadge({ status, className }: StatusBadgeProps) {
    return (
        <span
            className={cn(
                "inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-semibold",
                STATUS_COLORS[status] || "bg-gray-100 text-gray-700",
                className
            )}
        >
            {STATUS_LABELS[status] || status}
        </span>
    );
}
