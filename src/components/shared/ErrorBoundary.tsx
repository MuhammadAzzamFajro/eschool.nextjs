"use client";

import { Component, type ReactNode } from "react";
import { Button } from "@/components/ui/button";
import { AlertTriangle, RefreshCw } from "lucide-react";

interface ErrorBoundaryProps {
    children: ReactNode;
    fallback?: ReactNode;
}

interface ErrorBoundaryState {
    hasError: boolean;
    error: Error | null;
}

export class ErrorBoundary extends Component<
    ErrorBoundaryProps,
    ErrorBoundaryState
> {
    constructor(props: ErrorBoundaryProps) {
        super(props);
        this.state = { hasError: false, error: null };
    }

    static getDerivedStateFromError(error: Error): ErrorBoundaryState {
        return { hasError: true, error };
    }

    componentDidCatch(error: Error, errorInfo: React.ErrorInfo) {
        console.error("ErrorBoundary caught:", error, errorInfo);
    }

    render() {
        if (this.state.hasError) {
            if (this.props.fallback) {
                return this.props.fallback;
            }

            return (
                <div className="flex flex-col items-center justify-center py-16 px-4 text-center">
                    <div className="flex h-16 w-16 items-center justify-center rounded-2xl bg-destructive/10 mb-4">
                        <AlertTriangle className="h-8 w-8 text-destructive" />
                    </div>
                    <h3 className="text-lg font-semibold">Terjadi Kesalahan</h3>
                    <p className="mt-1 text-sm text-muted-foreground max-w-sm">
                        {this.state.error?.message || "Sesuatu yang tidak terduga terjadi."}
                    </p>
                    <Button
                        variant="outline"
                        className="mt-6"
                        onClick={() => this.setState({ hasError: false, error: null })}
                    >
                        <RefreshCw className="h-4 w-4 mr-2" />
                        Coba Lagi
                    </Button>
                </div>
            );
        }

        return this.props.children;
    }
}
