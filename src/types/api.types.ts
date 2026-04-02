import { type PaginatedResponse, type ApiResponse } from "./common.types";

// Re-export common types
export type { ApiResponse, PaginatedResponse };

// Server Action result type
export type ActionResult<T = void> = {
    success: boolean;
    data?: T;
    error?: string;
};
