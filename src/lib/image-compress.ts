import browserImageCompression from "browser-image-compression";
import { IMAGE } from "./constants";

/**
 * Client-side image compression before upload
 */
export async function compressImage(file: File): Promise<File> {
    const options = {
        maxSizeMB: IMAGE.MAX_SIZE_MB,
        maxWidthOrHeight: Math.max(IMAGE.MAX_WIDTH, IMAGE.MAX_HEIGHT),
        useWebWorker: true,
        fileType: "image/webp" as const,
    };

    try {
        const compressedFile = await browserImageCompression(file, options);
        return compressedFile;
    } catch (error) {
        console.error("Image compression failed:", error);
        return file; // Return original if compression fails
    }
}

/**
 * Validate image file before upload
 */
export function validateImage(file: File): { valid: boolean; error?: string } {
    if (!IMAGE.ACCEPTED_TYPES.includes(file.type as any)) {
        return {
            valid: false,
            error: `Format tidak didukung. Gunakan: ${IMAGE.ACCEPTED_TYPES.map((t) =>
                t.replace("image/", "")
            ).join(", ")}`,
        };
    }

    if (file.size > IMAGE.MAX_SIZE_BYTES) {
        return {
            valid: false,
            error: `Ukuran file terlalu besar. Maksimal ${IMAGE.MAX_SIZE_MB}MB`,
        };
    }

    return { valid: true };
}

/**
 * Create preview URL for an image file
 */
export function createImagePreview(file: File): string {
    return URL.createObjectURL(file);
}

/**
 * Revoke preview URL to free memory
 */
export function revokeImagePreview(url: string): void {
    URL.revokeObjectURL(url);
}
