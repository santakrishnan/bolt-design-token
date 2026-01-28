# @santakrishnan/bolt-design-tokens

Design tokens and CSS variables for the Bolt Design system, providing a consistent foundation for building modern web applications with Tailwind CSS v4.

## Purpose

This package provides:

- **Design tokens** - CSS custom properties for colors, typography, spacing, and shadows
- **Theme system** - Multiple pre-built themes with easy switching
- **Dark mode** - Built-in light/dark color mode support
- **TypeScript utilities** - Helper functions for theme and color mode management
- **Tailwind CSS v4 integration** - Seamlessly works with Tailwind's CSS-first configuration

## Installation

```bash
npm install @santakrishnan/bolt-design-tokens
```

Or with pnpm:

```bash
pnpm add @santakrishnan/bolt-design-tokens
```

### GitHub Packages Authentication

Since this package is published to GitHub Packages, you need to authenticate. Create a `.npmrc` file in your project root:

```
@santakrishnan:registry=https://npm.pkg.github.com
//npm.pkg.github.com/:_authToken=${NODE_AUTH_TOKEN}
```

Then set your GitHub Personal Access Token as an environment variable:

```bash
export NODE_AUTH_TOKEN=your_github_token
```

## Usage

### 1. Import CSS Tokens

In your global CSS file (e.g., `app.css` or `globals.css`):

```css
@import "@santakrishnan/bolt-design-tokens/tokens.css";
@import "@santakrishnan/bolt-design-tokens/themes.css";
```

### 2. Use in Tailwind CSS v4

Tailwind CSS v4 automatically picks up CSS custom properties. The tokens map directly to Tailwind utilities:

```jsx
// Colors
<div className="bg-background text-foreground">
  <button className="bg-primary text-primary-foreground">
    Primary Button
  </button>
  <button className="bg-secondary text-secondary-foreground">
    Secondary Button
  </button>
</div>

// Borders and radius
<div className="border border-border rounded-[var(--radius)]">
  Card with design system border radius
</div>

// Shadows
<div className="shadow-[var(--shadow-md)]">
  Card with design system shadow
</div>
```

### 3. TypeScript/JavaScript Utilities

```typescript
import {
  applyTheme,
  applyColorMode,
  toggleColorMode,
  getCSSVariable,
  type Theme,
  type ColorMode
} from "@santakrishnan/bolt-design-tokens";

// Apply a theme
applyTheme("modern");

// Apply color mode
applyColorMode("dark");

// Toggle between light and dark
toggleColorMode();

// Get a CSS variable value
const primaryColor = getCSSVariable("--primary");
```

## Design Tokens

### Colors

The package provides semantic color tokens that work in both light and dark modes:

**Base Colors:**
- `--background` - Main background color
- `--foreground` - Main text color

**Interactive Colors:**
- `--primary` / `--primary-foreground` - Primary actions and emphasis
- `--secondary` / `--secondary-foreground` - Secondary actions
- `--accent` / `--accent-foreground` - Accent elements
- `--muted` / `--muted-foreground` - Muted/subtle elements

**Feedback Colors:**
- `--destructive` / `--destructive-foreground` - Errors and destructive actions
- `--success` / `--success-foreground` - Success states
- `--warning` / `--warning-foreground` - Warning states
- `--error` / `--error-foreground` - Error states
- `--info` / `--info-foreground` - Informational states

**UI Elements:**
- `--border` - Border color
- `--input` - Input field background
- `--ring` - Focus ring color
- `--card` / `--card-foreground` - Card backgrounds
- `--popover` / `--popover-foreground` - Popover/dropdown backgrounds

**Charts:**
- `--chart-1` through `--chart-5` - Data visualization colors

### Typography

Font family tokens:

- `--font-sans` - Sans-serif font stack (default: Inter)
- `--font-serif` - Serif font stack
- `--font-mono` - Monospace font stack
- `--font-retro` - Pixel/retro font

### Spacing

- `--radius` - Border radius (8px default)

### Shadows

Elevation system with 9 levels:

- `--shadow-2xs` - Minimal shadow
- `--shadow-xs` - Extra small
- `--shadow-sm` - Small
- `--shadow-md` - Medium (default)
- `--shadow-lg` - Large
- `--shadow-xl` - Extra large
- `--shadow-2xl` - Maximum elevation

## Themes

The package includes 4 pre-built themes:

### Default Theme
- Font: Inter
- Style: Neutral, balanced
- Use case: General purpose applications

### Modern Theme
- Font: Poppins
- Style: Vibrant blue accent, contemporary
- Use case: Modern SaaS applications

### Professional Theme
- Font: DM Sans
- Style: Purple accent, heavier weights
- Use case: Enterprise and business applications

### Minimal Theme
- Font: Instrument Sans
- Style: Subtle colors, lighter weights
- Use case: Content-focused applications

### Applying Themes

**Via JavaScript:**
```typescript
import { applyTheme } from "@santakrishnan/bolt-design-tokens";

applyTheme("modern");
```

**Via CSS class:**
```html
<body class="theme-modern">
  <!-- Your app -->
</body>
```

## Dark Mode

Dark mode is enabled by adding the `.dark` class to the root element:

```typescript
import { applyColorMode, toggleColorMode } from "@santakrishnan/bolt-design-tokens";

// Enable dark mode
applyColorMode("dark");

// Toggle between light and dark
toggleColorMode();
```

Or manually:
```html
<html class="dark">
  <!-- Your app -->
</html>
```

## Tailwind CSS v4 Integration

Tailwind CSS v4 uses a CSS-first configuration approach. This package is designed to work seamlessly with it:

1. **Automatic detection** - Tailwind v4 automatically detects CSS custom properties
2. **No configuration needed** - Just import the CSS files
3. **Full utility support** - All tokens work with Tailwind utilities
4. **Theme-aware** - Utilities respect the active theme and color mode

### Example with Tailwind

```jsx
function Card() {
  return (
    <div className="bg-card text-card-foreground border border-border rounded-[var(--radius)] shadow-[var(--shadow-md)] p-6">
      <h2 className="text-2xl font-sans font-semibold text-foreground">
        Card Title
      </h2>
      <p className="text-muted-foreground mt-2">
        Card description text
      </p>
      <button className="mt-4 bg-primary text-primary-foreground px-4 py-2 rounded-[var(--radius)]">
        Action
      </button>
    </div>
  );
}
```

## TypeScript Support

Full TypeScript definitions are included:

```typescript
import type { Theme, ColorMode, DesignTokens } from "@santakrishnan/bolt-design-tokens";

const theme: Theme = "modern";
const mode: ColorMode = "dark";
```

## Version Updates

This package uses automated versioning with [semantic-release](https://semantic-release.gitbook.io/). Versions are automatically determined and published based on commit messages.

When new versions are published, update your package:

```bash
npm update @santakrishnan/bolt-design-tokens
```

Or with pnpm:

```bash
pnpm update @santakrishnan/bolt-design-tokens
```

See [CONTRIBUTING.md](CONTRIBUTING.md) for details on how versioning works.

## Contributing

We use conventional commits for automated versioning. See [CONTRIBUTING.md](CONTRIBUTING.md) for commit message format and guidelines.

## License

MIT

## Repository

https://github.com/santakrishnan/bolt-design-token
