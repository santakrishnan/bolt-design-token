# Contributing to Bolt Design Tokens

## Automated Versioning with Semantic Release

This project uses **semantic-release** to automatically version and publish packages based on commit messages.

## Commit Message Format

We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types and Version Bumps

| Type | Version Bump | Example |
|------|--------------|---------|
| `feat` | Minor (1.0.0 → 1.1.0) | `feat: add new color tokens` |
| `fix` | Patch (1.0.0 → 1.0.1) | `fix: correct primary color value` |
| `perf` | Patch (1.0.0 → 1.0.1) | `perf: optimize CSS bundle size` |
| `docs` | Patch (1.0.0 → 1.0.1) | `docs: update README examples` |
| `style` | Patch (1.0.0 → 1.0.1) | `style: format CSS files` |
| `refactor` | Patch (1.0.0 → 1.0.1) | `refactor: reorganize token structure` |
| `BREAKING CHANGE` | Major (1.0.0 → 2.0.0) | See below |

### Breaking Changes

For breaking changes, add `BREAKING CHANGE:` in the commit body or footer:

```bash
git commit -m "feat: redesign color system

BREAKING CHANGE: Primary color token renamed from --primary to --color-primary"
```

Or use `!` after the type:

```bash
git commit -m "feat!: redesign color system"
```

## Examples

### Adding a new feature (Minor version bump)

```bash
git commit -m "feat(tokens): add success and warning color tokens"
```

Result: 1.0.0 → 1.1.0

### Fixing a bug (Patch version bump)

```bash
git commit -m "fix(themes): correct dark mode background color"
```

Result: 1.0.0 → 1.0.1

### Updating documentation (Patch version bump)

```bash
git commit -m "docs: add Tailwind integration examples"
```

Result: 1.0.0 → 1.0.1

### Breaking change (Major version bump)

```bash
git commit -m "feat!: rename all color tokens to use color- prefix

BREAKING CHANGE: All color tokens now use --color- prefix instead of --"
```

Result: 1.0.0 → 2.0.0

### Multiple changes

```bash
git commit -m "feat(tokens): add new shadow tokens

- Add --shadow-inner for inset shadows
- Add --shadow-outline for focus states
- Update documentation with examples"
```

## Workflow

1. **Make your changes**
   ```bash
   # Edit files
   vim src/tokens.css
   ```

2. **Commit with conventional format**
   ```bash
   git add .
   git commit -m "feat(tokens): add new spacing scale"
   ```

3. **Push to main**
   ```bash
   git push origin main
   ```

4. **Automatic release**
   - GitHub Actions runs semantic-release
   - Analyzes commit messages
   - Determines version bump
   - Updates package.json
   - Generates CHANGELOG.md
   - Creates GitHub release
   - Publishes to GitHub Packages

## What Gets Automated

✅ Version bumping (based on commits)
✅ CHANGELOG generation
✅ Git tagging
✅ GitHub release creation
✅ Package publishing
✅ Release notes

## Scopes (Optional)

You can add scopes to provide more context:

- `tokens` - Changes to design tokens
- `themes` - Changes to theme system
- `utils` - Changes to TypeScript utilities
- `docs` - Documentation changes
- `ci` - CI/CD changes

Example:
```bash
git commit -m "feat(themes): add retro theme"
```

## Tips

1. **Use descriptive commit messages** - They become your changelog
2. **One logical change per commit** - Makes version bumping accurate
3. **Test before committing** - Automated releases happen immediately
4. **Review CHANGELOG.md** - After release to see what was generated

## Manual Release (Emergency)

If you need to manually trigger a release:

1. Go to Actions tab
2. Select "Publish to GitHub Packages (Manual)"
3. Click "Run workflow"

## Checking Release Status

After pushing:

1. Go to **Actions** tab
2. Click on the **Release** workflow
3. Watch the logs to see version determination and publishing

## Version History

All versions and changes are tracked in:
- `CHANGELOG.md` - Detailed changelog
- GitHub Releases - Release notes
- Git tags - Version tags

## Questions?

- Conventional Commits: https://www.conventionalcommits.org/
- Semantic Release: https://semantic-release.gitbook.io/
