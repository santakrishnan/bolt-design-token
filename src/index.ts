/**
 * Bolt Design Tokens
 *
 * Design tokens and CSS variables for the Bolt Design system.
 * Import these in your application to use the design system.
 */

// Export types for TypeScript support
export type Theme = "default" | "modern" | "professional" | "minimal";
export type ColorMode = "light" | "dark";

export interface DesignTokens {
  colors: {
    background: string;
    foreground: string;
    primary: string;
    secondary: string;
    accent: string;
    muted: string;
    destructive: string;
    border: string;
    input: string;
    ring: string;
  };
  radius: string;
  fonts: {
    sans: string;
    serif: string;
    mono: string;
    retro: string;
  };
}

// Helper function to get CSS variable value
export function getCSSVariable(variable: string): string {
  if (typeof window === "undefined") {
    return "";
  }
  return getComputedStyle(document.documentElement)
    .getPropertyValue(variable)
    .trim();
}

// Helper function to set CSS variable
export function setCSSVariable(variable: string, value: string): void {
  if (typeof window === "undefined") {
    return;
  }
  document.documentElement.style.setProperty(variable, value);
}

// Theme utilities
export function applyTheme(theme: Theme): void {
  if (typeof window === "undefined") {
    return;
  }
  document.body.className = document.body.className
    .replace(/theme-\w+/g, "")
    .trim();
  if (theme !== "default") {
    document.body.classList.add(`theme-${theme}`);
  }
}

export function getCurrentTheme(): Theme {
  if (typeof window === "undefined") {
    return "default";
  }
  const classList = document.body.classList;
  if (classList.contains("theme-modern")) {
    return "modern";
  }
  if (classList.contains("theme-professional")) {
    return "professional";
  }
  if (classList.contains("theme-minimal")) {
    return "minimal";
  }
  return "default";
}

// Color mode utilities
export function applyColorMode(mode: ColorMode): void {
  if (typeof window === "undefined") {
    return;
  }
  if (mode === "dark") {
    document.documentElement.classList.add("dark");
  } else {
    document.documentElement.classList.remove("dark");
  }
}

export function getCurrentColorMode(): ColorMode {
  if (typeof window === "undefined") {
    return "light";
  }
  return document.documentElement.classList.contains("dark") ? "dark" : "light";
}

export function toggleColorMode(): ColorMode {
  const current = getCurrentColorMode();
  const next = current === "light" ? "dark" : "light";
  applyColorMode(next);
  return next;
}
