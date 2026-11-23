@import "tailwindcss" source(none);
@source "../src";
@import "tw-animate-css";

@custom-variant dark (&:is(.dark *));

/*
  * Design system definition.
 *
  * The @theme inline block maps
  * CSS custom properties to Tailwind
  * utility classes (e.g. --color-primary ->
  * bg-primary, text-primary).
 *
  * The :root and .dark blocks
  * define the actual color values
  * using oklch format.
 *
  * To add a new semantic color:
  * 1. Add the variable to :root
  * (light value) and .dark (dark
  * value)
  * 2. Register it in @theme
  * inline as --color-<name>: var(--<name>)
 */

@theme inline {
  --radius-sm: calc(var(--radius) - 4px);
  --radius-md: calc(var(--radius) - 2px);
  --radius-lg: var(--radius);
  --radius-xl: calc(var(--radius) + 4px);
  --radius-2xl: calc(var(--radius) + 8px);
  --radius-3xl: calc(var(--radius) + 12px);
  --radius-4xl: calc(var(--radius) + 16px);
  --color-background: var(--background);
  --color-foreground: var(--foreground);
  --color-card: var(--card);
  --color-card-foreground: var(--card-foreground);
  --color-popover: var(--popover);
  --color-popover-foreground: var(--popover-foreground);
  --color-primary: var(--primary);
  --color-primary-foreground: var(--primary-foreground);
  --color-secondary: var(--secondary);
  --color-secondary-foreground: var(--secondary-foreground);
  --color-muted: var(--muted);
  --color-muted-foreground: var(--muted-foreground);
  --color-accent: var(--accent);
  --color-accent-foreground: var(--accent-foreground);
  --color-destructive: var(--destructive);
  --color-destructive-foreground: var(--destructive-foreground);
  --color-border: var(--border);
  --color-input: var(--input);
  --color-ring: var(--ring);
  --color-ring-offset-background: var(--background);
  --color-chart-1: var(--chart-1);
  --color-chart-2: var(--chart-2);
  --color-chart-3: var(--chart-3);
  --color-chart-4: var(--chart-4);
  --color-chart-5: var(--chart-5);
  --color-sidebar: var(--sidebar);
  --color-sidebar-foreground: var(--sidebar-foreground);
  --color-sidebar-primary: var(--sidebar-primary);
  --color-sidebar-primary-foreground: var(--sidebar-primary-foreground);
  --color-sidebar-accent: var(--sidebar-accent);
  --color-sidebar-accent-foreground: var(--sidebar-accent-foreground);
  --color-sidebar-border: var(--sidebar-border);
  --color-sidebar-ring: var(--sidebar-ring);
}

:root {
  --radius: 0.5rem;
  --background: oklch(0.17 0.04 260);
  --foreground: oklch(0.96 0.01 90);
  --card: oklch(0.22 0.05 260);
  --card-foreground: oklch(0.96 0.01 90);
  --popover: oklch(0.22 0.05 260);
  --popover-foreground: oklch(0.96 0.01 90);
  --primary: oklch(0.78 0.13 80);
  --primary-foreground: oklch(0.17 0.04 260);
  --secondary: oklch(0.26 0.05 260);
  --secondary-foreground: oklch(0.96 0.01 90);
  --muted: oklch(0.25 0.04 260);
  --muted-foreground: oklch(0.72 0.03 250);
  --accent: oklch(0.28 0.06 260);
  --accent-foreground: oklch(0.85 0.12 85);
  --destructive: oklch(0.65 0.2 25);
  --destructive-foreground: oklch(0.98 0 0);
  --border: oklch(0.78 0.13 80 / 20%);
  --input: oklch(0.78 0.13 80 / 30%);
  --ring: oklch(0.78 0.13 80);
  --gold-glow: oklch(0.88 0.11 90);
  --gradient-gold: linear-gradient(135deg, var(--primary), var(--gold-glow), var(--primary));
  --gradient-hero: radial-gradient(ellipse at top, oklch(0.3 0.08 260), var(--background) 70%);
  --shadow-gold: 0 10px 40px -12px oklch(0.78 0.13 80 / 45%);
  --cover-shade: linear-gradient(to bottom, oklch(0.17 0.04 260 / 65%), oklch(0.17 0.04 260 / 85%));
  --chart-1: oklch(0.646 0.222 41.116);
  --chart-2: oklch(0.6 0.118 184.704);
  --chart-3: oklch(0.398 0.07 227.392);
  --chart-4: oklch(0.828 0.189 84.429);
  --chart-5: oklch(0.769 0.188 70.08);
  --sidebar: var(--card);
  --sidebar-foreground: var(--foreground);
  --sidebar-primary: var(--primary);
  --sidebar-primary-foreground: var(--primary-foreground);
  --sidebar-accent: var(--accent);
  --sidebar-accent-foreground: var(--accent-foreground);
  --sidebar-border: var(--border);
  --sidebar-ring: var(--ring);
}

@theme inline {
  --font-display: "Cormorant Garamond", serif;
  --font-sans: "Manrope", sans-serif;
}

@utility text-gold {
  background: var(--gradient-gold);
  -webkit-background-clip: text;
  background-clip: text;
  color: transparent;
}

@utility bg-gold { background: var(--gradient-gold); }
@utility bg-hero { background: var(--gradient-hero); }
@utility shadow-gold { box-shadow: var(--shadow-gold); }
.cover-shade { background: var(--cover-shade); }

@layer base {
  h1, h2, h3, nav a, li {
    overflow-wrap: anywhere;
  }
}

@layer base {
    * {
    border-color: var(--color-border);
  }

  body {
    background-color: var(--color-background);
    color: var(--color-foreground);
  }
}
