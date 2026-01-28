# Quick Commit Reference

## Format
```
<type>: <description>
```

## Common Types

| Commit | Version | Example |
|--------|---------|---------|
| `feat:` | 1.0.0 → 1.1.0 | `feat: add new color tokens` |
| `fix:` | 1.0.0 → 1.0.1 | `fix: correct primary color` |
| `docs:` | 1.0.0 → 1.0.1 | `docs: update README` |
| `feat!:` | 1.0.0 → 2.0.0 | `feat!: redesign tokens` |

## Examples

```bash
# Add new feature (minor bump)
git commit -m "feat: add shadow tokens"

# Fix bug (patch bump)
git commit -m "fix: correct dark mode colors"

# Update docs (patch bump)
git commit -m "docs: add usage examples"

# Breaking change (major bump)
git commit -m "feat!: rename all tokens

BREAKING CHANGE: Token names changed"

# With scope
git commit -m "feat(themes): add retro theme"
```

## Full Guide
See [CONTRIBUTING.md](../CONTRIBUTING.md) for complete documentation.
