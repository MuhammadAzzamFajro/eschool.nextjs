"use client";

import { type ReactNode } from "react";
import { type FieldValues, type UseFormReturn, FormProvider } from "react-hook-form";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardFooter, CardHeader, CardTitle } from "@/components/ui/card";
import { Loader2 } from "lucide-react";
import Link from "next/link";

interface FormWrapperProps<T extends FieldValues> {
    form: UseFormReturn<T>;
    onSubmit: (data: T) => Promise<void> | void;
    title?: string;
    submitLabel?: string;
    cancelHref?: string;
    cancelLabel?: string;
    loading?: boolean;
    children: ReactNode;
    className?: string;
}

export function FormWrapper<T extends FieldValues>({
    form,
    onSubmit,
    title,
    submitLabel = "Simpan",
    cancelHref,
    cancelLabel = "Batal",
    loading = false,
    children,
    className,
}: FormWrapperProps<T>) {
    return (
        <FormProvider {...form}>
            <form onSubmit={form.handleSubmit(onSubmit)} className={className}>
                <Card className="border-0 shadow-sm">
                    {title && (
                        <CardHeader>
                            <CardTitle>{title}</CardTitle>
                        </CardHeader>
                    )}
                    <CardContent className="space-y-6">{children}</CardContent>
                    <CardFooter className="flex items-center gap-3 border-t pt-6">
                        <Button
                            type="submit"
                            disabled={loading}
                            className="shadow-md shadow-primary/25"
                        >
                            {loading ? (
                                <>
                                    <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                                    Menyimpan...
                                </>
                            ) : (
                                submitLabel
                            )}
                        </Button>
                        {cancelHref && (
                            <Button variant="outline" asChild>
                                <Link href={cancelHref}>{cancelLabel}</Link>
                            </Button>
                        )}
                    </CardFooter>
                </Card>
            </form>
        </FormProvider>
    );
}
