"use client";

import {
    AlertDialog,
    AlertDialogAction,
    AlertDialogCancel,
    AlertDialogContent,
    AlertDialogDescription,
    AlertDialogFooter,
    AlertDialogHeader,
    AlertDialogTitle,
    AlertDialogTrigger,
} from "@/components/ui/alert-dialog";
import { Button } from "@/components/ui/button";
import { Loader2, Trash2 } from "lucide-react";
import { useState } from "react";

interface ConfirmDialogProps {
    title?: string;
    description?: string;
    confirmLabel?: string;
    cancelLabel?: string;
    variant?: "destructive" | "default";
    onConfirm: () => Promise<void> | void;
    trigger?: React.ReactNode;
    children?: React.ReactNode;
}

export function ConfirmDialog({
    title = "Apakah Anda yakin?",
    description = "Tindakan ini tidak dapat dibatalkan. Data yang dihapus tidak bisa dikembalikan.",
    confirmLabel = "Hapus",
    cancelLabel = "Batal",
    variant = "destructive",
    onConfirm,
    trigger,
    children,
}: ConfirmDialogProps) {
    const [loading, setLoading] = useState(false);

    const handleConfirm = async () => {
        setLoading(true);
        try {
            await onConfirm();
        } finally {
            setLoading(false);
        }
    };

    const defaultTrigger = (
        <Button variant="destructive" size="sm">
            <Trash2 className="h-4 w-4 mr-2" />
            Hapus
        </Button>
    );

    const content = trigger || children || defaultTrigger;
    // @ts-ignore: This is a hack because React.isValidElement isn't narrowing enough for TypeScript here
    const renderTrigger = typeof content === "object" && "type" in content ? content : <span>{content}</span>;

    return (
        <AlertDialog>
            <AlertDialogTrigger render={renderTrigger as React.ReactElement} />
            <AlertDialogContent>
                <AlertDialogHeader>
                    <AlertDialogTitle>{title}</AlertDialogTitle>
                    <AlertDialogDescription>{description}</AlertDialogDescription>
                </AlertDialogHeader>
                <AlertDialogFooter>
                    <AlertDialogCancel disabled={loading}>{cancelLabel}</AlertDialogCancel>
                    <AlertDialogAction
                        onClick={handleConfirm}
                        disabled={loading}
                        className={
                            variant === "destructive"
                                ? "bg-destructive text-white hover:bg-destructive/90"
                                : ""
                        }
                    >
                        {loading ? (
                            <>
                                <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                                Memproses...
                            </>
                        ) : (
                            confirmLabel
                        )}
                    </AlertDialogAction>
                </AlertDialogFooter>
            </AlertDialogContent>
        </AlertDialog>
    );
}
