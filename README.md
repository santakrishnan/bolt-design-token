# @bolt-design/tokens

Design tokens and CSS variables for the Bolt Design system.

> **📚 New to this package?** Start with `START_HERE.md` for setup instructions!

## Installation

```bash
pnpm add @bolt-design/tokens
```

## Usage

### In CSS/Tailwind

Import the tokens and themes in your global CSS file:

```css
@import "@bolt-design/tokens/tokens.css";
@import "@bolt-design/tokens/themes.css";
```

### In TypeScript/JavaScript

```typescript
import {
  applyTheme,
  applyColorMode,
  getCSSVariable,
  type Theme,
  type ColorMode
} from "@bolt-design/tokens";

// Apply a theme
applyTheme("modern");

// Apply color mode
applyColorMode("dark");

// Get a CSS variable value
const primaryColor = getCSSVariable("--primary");
```

## Available Themes

- `default` - Inter font, neutral colors
- `modern` - Poppins font, vibrant blue accent
- `professional` - DM Sans font, purple accent, heavier weights
- `minimal` - Instrument Sans font, subtle colors, lighter weights

## Design Tokens

### Colors

- Base: `--background`, `--foreground`
- Interactive: `--primary`, `--secondary`, `--accent`
- Feedback: `--destructive`, `--success`, `--warning`, `--error`, `--info`
- UI: `--border`, `--input`, `--ring`, `--muted`
- Charts: `--chart-1` through `--chart-5`

### Typography

- `--font-sans` - Sans-serif font stack
- `--font-serif` - Serif font stack
- `--font-mono` - Monospace font stack
- `--font-retro` - Pixel/retro font

### Spacing

- `--radius` - Border radius (8px)

### Shadows

- `--shadow-2xs` through `--shadow-2xl`

## Color Modes

The package supports light and dark modes. Apply the `.dark` class to the root element to enable dark mode.

## TypeScript Support

Full TypeScript definitions are included for all exports.

## License

MIT
