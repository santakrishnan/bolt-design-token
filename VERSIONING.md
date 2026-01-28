# Versioning Strategies

This document compares different approaches to automate package versioning.

## Current Setup: Semantic Release ✅

**Status:** Implemented and ready to use

### How It Works

1. You commit with conventional format: `feat: add new tokens`
2. Push to main branch
3. GitHub Actions automatically:
   - Analyzes commits since last release
   - Determines version bump (major/minor/patch)
   - Updates package.json
   - Generates CHANGELOG.md
   - Creates GitHub release
   - Publishes to GitHub Packages

### Commit Format

```bash
# Minor version bump (1.0.0 → 1.1.0)
git commit -m "feat: add new color tokens"

# Patch version bump (1.0.0 → 1.0.1)
git commit -m "fix: correct primary color"

# Major version bump (1.0.0 → 2.0.0)
git commit -m "feat!: redesign token structure

BREAKING CHANGE: All tokens renamed"
```

### Pros
- ✅ Fully automated
- ✅ Consistent versioning
- ✅ Auto-generated changelog
- ✅ GitHub releases created
- ✅ No manual version bumping
- ✅ Clear version history

### Cons
- ⚠️ Requires conventional commit format
- ⚠️ Learning curve for team

### Best For
- Teams that want full automation
- Projects with frequent releases
- Open source projects

---

## Alternative 1: Changesets

**Status:** Not implemented (alternative option)

### How It Works

1. Create a changeset file describing changes
2. Changesets CLI determines version
3. Manual or automated release

### Setup

```bash
npm install -D @changesets/cli
npx changeset init
```

### Usage

```bash
# Create changeset
npx changeset

# Version packages
npx changeset version

# Publish
npx changeset publish
```

### Pros
- ✅ More control over releases
- ✅ Good for monorepos
- ✅ Review changes before release
- ✅ Flexible workflow

### Cons
- ⚠️ Extra step (creating changeset)
- ⚠️ Less automated than semantic-release

### Best For
- Monorepos
- Teams wanting review before release
- Complex release workflows

---

## Alternative 2: GitHub Actions + Manual Versioning

**Status:** Available as fallback (publish.yml)

### How It Works

1. Manually bump version: `npm version patch`
2. Push with tags: `git push --follow-tags`
3. GitHub Actions publishes

### Usage

```bash
# Patch: 1.0.0 → 1.0.1
npm version patch

# Minor: 1.0.0 → 1.1.0
npm version minor

# Major: 1.0.0 → 2.0.0
npm version major

# Push
git push --follow-tags
```

### Pros
- ✅ Simple and straightforward
- ✅ Full control
- ✅ No dependencies
- ✅ Easy to understand

### Cons
- ⚠️ Manual version bumping
- ⚠️ No auto-changelog
- ⚠️ Easy to forget

### Best For
- Small teams
- Infrequent releases
- Simple projects

---

## Alternative 3: Release Please

**Status:** Not implemented (Google's solution)

### How It Works

Similar to semantic-release but creates PRs for releases.

1. Commits analyzed
2. PR created with version bump
3. Merge PR to release

### Setup

```yaml
# .github/workflows/release-please.yml
- uses: google-github-actions/release-please-action@v3
  with:
    release-type: node
    package-name: bolt-design-tokens
```

### Pros
- ✅ Review before release (PR)
- ✅ Auto-generated changelog
- ✅ Conventional commits
- ✅ Maintained by Google

### Cons
- ⚠️ Extra step (merge PR)
- ⚠️ Slower than semantic-release

### Best For
- Teams wanting PR review
- Enterprise workflows
- Cautious release process

---

## Comparison Table

| Feature | Semantic Release | Changesets | Manual + Actions | Release Please |
|---------|-----------------|------------|------------------|----------------|
| Automation | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐ |
| Control | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Changelog | ✅ Auto | ✅ Auto | ❌ Manual | ✅ Auto |
| Learning Curve | Medium | Medium | Low | Medium |
| Setup Complexity | Medium | Low | Low | Low |
| Monorepo Support | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐ |
| Review Before Release | ❌ | ✅ | ✅ | ✅ |

---

## Recommendation

**For this project:** Semantic Release (current setup) ✅

**Why:**
- Single package (not a monorepo)
- Want full automation
- Frequent small updates expected
- Clear version history important
- Conventional commits are industry standard

**When to switch:**
- If you need more control → Use Changesets
- If you want PR review → Use Release Please
- If team struggles with commits → Use Manual + Actions

---

## Current Workflow (Semantic Release)

```bash
# 1. Make changes
vim src/tokens.css

# 2. Commit with conventional format
git add .
git commit -m "feat(tokens): add new spacing scale"

# 3. Push
git push origin main

# 4. Done! 🎉
# - Version automatically bumped
# - CHANGELOG.md updated
# - GitHub release created
# - Package published
```

---

## Migration Guide

If you want to switch to a different strategy:

### To Changesets

```bash
npm install -D @changesets/cli
npx changeset init
# Update .github/workflows/release.yml
```

### To Manual Versioning

```bash
# Remove semantic-release from package.json
# Use .github/workflows/publish.yml instead
npm version patch && git push --follow-tags
```

### To Release Please

```bash
# Create .github/workflows/release-please.yml
# Remove semantic-release workflow
```

---

## Resources

- **Semantic Release:** https://semantic-release.gitbook.io/
- **Changesets:** https://github.com/changesets/changesets
- **Release Please:** https://github.com/googleapis/release-please
- **Conventional Commits:** https://www.conventionalcommits.org/
