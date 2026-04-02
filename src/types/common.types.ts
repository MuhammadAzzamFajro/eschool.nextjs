import { type Role } from "@/config/roles";

// API Response types
export interface ApiResponse<T> {
    data: T | null;
    error: string | null;
    success: boolean;
}

export interface PaginatedResponse<T> {
    data: T[];
    total: number;
    page: number;
    pageSize: number;
    totalPages: number;
}

export interface PaginationParams {
    page?: number;
    pageSize?: number;
    search?: string;
    sortBy?: string;
    sortOrder?: "asc" | "desc";
}

// User profile from Supabase
export interface UserProfile {
    id: string;
    email: string;
    full_name: string;
    avatar_url?: string;
    phone?: string;
    created_at: string;
    updated_at: string;
}

export interface UserWithRole extends UserProfile {
    role: Role;
}
