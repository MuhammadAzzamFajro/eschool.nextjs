"use client";

import { useCallback, useState } from "react";
import { useDropzone } from "react-dropzone";
import { cn } from "@/lib/utils";
import { Button } from "@/components/ui/button";
import { ImageIcon, X, Upload, Loader2 } from "lucide-react";
import { compressImage, validateImage } from "@/lib/image-compress";
import { toast } from "sonner";
import Image from "next/image";

interface ImageUploadProps {
    value?: string;
    onChange: (url: string) => void;
    onRemove?: () => void;
    disabled?: boolean;
    className?: string;
}

export function ImageUpload({
    value,
    onChange,
    onRemove,
    disabled,
    className,
}: ImageUploadProps) {
    const [preview, setPreview] = useState<string | null>(value || null);
    const [uploading, setUploading] = useState(false);

    const onDrop = useCallback(
        async (acceptedFiles: File[]) => {
            const file = acceptedFiles[0];
            if (!file) return;

            // Validate
            const validation = validateImage(file);
            if (!validation.valid) {
                toast.error(validation.error);
                return;
            }

            setUploading(true);
            try {
                // Compress
                const compressed = await compressImage(file);

                // Preview
                const previewUrl = URL.createObjectURL(compressed);
                setPreview(previewUrl);

                // Upload to API
                const formData = new FormData();
                formData.append("file", compressed);

                const response = await fetch("/api/upload", {
                    method: "POST",
                    body: formData,
                });

                if (!response.ok) throw new Error("Upload gagal");

                const data = await response.json();
                onChange(data.url);
                toast.success("Gambar berhasil diupload");
            } catch (error) {
                toast.error("Gagal mengupload gambar");
                setPreview(value || null);
            } finally {
                setUploading(false);
            }
        },
        [onChange, value]
    );

    const { getRootProps, getInputProps, isDragActive } = useDropzone({
        onDrop,
        accept: { "image/*": [".jpeg", ".jpg", ".png", ".webp"] },
        maxFiles: 1,
        disabled: disabled || uploading,
    });

    const handleRemove = () => {
        setPreview(null);
        onRemove?.();
    };

    return (
        <div className={cn("space-y-2", className)}>
            {preview ? (
                <div className="relative w-40 h-40 rounded-xl overflow-hidden border group">
                    <Image
                        src={preview}
                        alt="Preview"
                        fill
                        className="object-cover"
                    />
                    {!disabled && (
                        <Button
                            variant="destructive"
                            size="icon"
                            className="absolute top-2 right-2 h-7 w-7 opacity-0 group-hover:opacity-100 transition-opacity"
                            onClick={handleRemove}
                        >
                            <X className="h-4 w-4" />
                        </Button>
                    )}
                    {uploading && (
                        <div className="absolute inset-0 bg-background/80 flex items-center justify-center">
                            <Loader2 className="h-6 w-6 animate-spin text-primary" />
                        </div>
                    )}
                </div>
            ) : (
                <div
                    {...getRootProps()}
                    className={cn(
                        "flex flex-col items-center justify-center rounded-xl border-2 border-dashed p-8 transition-colors cursor-pointer",
                        isDragActive
                            ? "border-primary bg-primary/5"
                            : "border-muted-foreground/25 hover:border-primary/50 hover:bg-muted/30",
                        (disabled || uploading) && "opacity-50 cursor-not-allowed"
                    )}
                >
                    <input {...getInputProps()} />
                    {uploading ? (
                        <Loader2 className="h-8 w-8 animate-spin text-primary mb-2" />
                    ) : (
                        <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-muted mb-3">
                            {isDragActive ? (
                                <Upload className="h-6 w-6 text-primary" />
                            ) : (
                                <ImageIcon className="h-6 w-6 text-muted-foreground" />
                            )}
                        </div>
                    )}
                    <p className="text-sm font-medium">
                        {isDragActive ? "Lepaskan file di sini" : "Klik atau drag gambar"}
                    </p>
                    <p className="text-xs text-muted-foreground mt-1">
                        JPG, PNG, atau WebP (maks. 5MB)
                    </p>
                </div>
            )}
        </div>
    );
}
