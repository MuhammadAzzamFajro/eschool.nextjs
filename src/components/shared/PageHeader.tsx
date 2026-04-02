import Link from "next/link";
import { Button } from "@/components/ui/button";
import {
    Breadcrumb,
    BreadcrumbItem,
    BreadcrumbLink,
    BreadcrumbList,
    BreadcrumbPage,
    BreadcrumbSeparator,
} from "@/components/ui/breadcrumb";
import { type LucideIcon, Plus } from "lucide-react";
import { Fragment } from "react";

interface BreadcrumbItem {
    label: string;
    href?: string;
}

interface PageHeaderProps {
    title: string;
    description?: string;
    breadcrumbs?: BreadcrumbItem[];
    actionLabel?: string;
    actionHref?: string;
    actionIcon?: LucideIcon;
    onAction?: () => void;
    children?: React.ReactNode;
}

export function PageHeader({
    title,
    description,
    breadcrumbs,
    actionLabel,
    actionHref,
    actionIcon: ActionIcon = Plus,
    onAction,
    children,
}: PageHeaderProps) {
    return (
        <div className="space-y-4">
            {breadcrumbs && breadcrumbs.length > 0 && (
                <Breadcrumb>
                    <BreadcrumbList>
                        {breadcrumbs.map((item, index) => (
                            <Fragment key={index}>
                                {index > 0 && <BreadcrumbSeparator />}
                                <BreadcrumbItem>
                                    {item.href ? (
                                        <BreadcrumbLink render={<Link href={item.href} />}>
                                            {item.label}
                                        </BreadcrumbLink>
                                    ) : (
                                        <BreadcrumbPage>{item.label}</BreadcrumbPage>
                                    )}
                                </BreadcrumbItem>
                            </Fragment>
                        ))}
                    </BreadcrumbList>
                </Breadcrumb>
            )}

            <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
                <div>
                    <h1 className="text-2xl font-bold tracking-tight lg:text-3xl">
                        {title}
                    </h1>
                    {description && (
                        <p className="text-muted-foreground mt-1">{description}</p>
                    )}
                </div>

                <div className="flex items-center gap-2 shrink-0">
                    {children}
                    {(actionLabel && (actionHref || onAction)) && (
                        <Button
                            asChild={!!actionHref}
                            onClick={onAction}
                            className="shadow-md shadow-primary/25"
                        >
                            {actionHref ? (
                                <Link href={actionHref}>
                                    <ActionIcon className="h-4 w-4 mr-2" />
                                    {actionLabel}
                                </Link>
                            ) : (
                                <>
                                    <ActionIcon className="h-4 w-4 mr-2" />
                                    {actionLabel}
                                </>
                            )}
                        </Button>
                    )}
                </div>
            </div>
        </div>
    );
}
