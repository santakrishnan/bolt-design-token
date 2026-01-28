# Quick Setup Guide for bolt-design-tokens Repository

This is a streamlined guide to get your design tokens package into a separate repository and published to GitHub Packages.

## Step 1: Create New GitHub Repository

1. Go to https://github.com/new
2. Repository name: `bolt-design-tokens`
3. Description: "Design tokens and CSS variables for Bolt Design system"
4. Visibility: **Private** (recommended) or Public
5. ✅ Add a README file
6. ✅ Add .gitignore: **Node**
7. ✅ Choose a license: **MIT**
8. Click "Create repository"

## Step 2: Clone and Setup

```bash
# Clone the new repository
cd ~/projects  # or wherever you keep projects
git clone https://github.com/rohan016-dev/bolt-design-tokens.git
cd bolt-design-tokens

# Copy files from your current project
# (Adjust the path to your Design_System_POC location)
cp -r ../Design_System_POC/packages/design-tokens/* .
cp -r ../Design_System_POC/packages/design-tokens/.github .
cp ../Design_System_POC/packages/design-tokens/.npmrc .
cp ../Design_System_POC/packages/design-tokens/.gitignore .

# Remove node_modules (we'll reinstall)
rm -rf node_modules

# Install dependencies
npm install
```

## Step 3: Create GitHub Personal Access Token

1. Go to https://github.com/settings/tokens
2. Click "Generate new token" → "Generate new token (classic)"
3. Token name: "Publish packages"
4. Expiration: 90 days (or your preference)
5. Select scopes:
   - ✅ `write:packages`
   - ✅ `read:packages`
   - ✅ `delete:packages`
6. Click "Generate token"
7. **Copy the token immediately!**

## Step 4: Configure Authentication

Add to your `~/.zshrc` (or `~/.bashrc`):

```bash
export GITHUB_TOKEN="your_token_here"
```

Then reload:

```bash
source ~/.zshrc
```

## Step 5: Commit and Push

```bash
git add .
git commit -m "feat: initial design tokens package"
git push origin main
```

## Step 6: Publish to GitHub Packages

The package will automatically publish via GitHub Actions when you push to main.

**To verify:**

1. Go to your repository on GitHub
2. Click "Actions" tab
3. Check the workflow run
4. Once complete, click "Packages" in the right sidebar
5. You should see `@bolt-design/tokens`

**Or publish manually:**

```bash
npm login --registry=https://npm.pkg.github.com
# Username: your GitHub username
# Password: your Personal Access Token
# Email: your GitHub email

npm publish
```

## Step 7: Update Main Project

In your `Design_System_POC` project:

### 1. Update package.json

Change from workspace reference to version:

```json
{
  "dependencies": {
    "@bolt-design/tokens": "^1.0.0"
  }
}
```

### 2. Create .npmrc in project root

```
@bolt-design:registry=https://npm.pkg.github.com
//npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}
```

### 3. Remove local package

```bash
# In Design_System_POC directory
rm -rf packages/design-tokens
rm pnpm-workspace.yaml  # if not using other packages
```

### 4. Install from GitHub Packages

```bash
pnpm install
```

### 5. Test

```bash
pnpm dev
```

Visit http://localhost:3000 and verify everything works!

## Updating Tokens (Future Workflow)

### In bolt-design-tokens repo:

```bash
# Make your changes to src/tokens.css or src/themes.css

# Bump version
npm version patch  # 1.0.0 → 1.0.1

# Commit and push
git add .
git commit -m "feat(tokens): update primary color"
git push --follow-tags
```

GitHub Actions will automatically publish the new version.

### In Design_System_POC repo:

```bash
# Update to latest version
pnpm update @bolt-design/tokens

# Test
pnpm dev

# Commit
git add package.json pnpm-lock.yaml
git commit -m "chore: update design tokens to v1.0.1"
git push
```

## Troubleshooting

### Can't publish: "Package already exists"

```bash
npm version patch
git push --follow-tags
```

### Can't install in main project

- Check `.npmrc` is configured
- Verify `GITHUB_TOKEN` environment variable is set
- Try: `rm -rf node_modules pnpm-lock.yaml && pnpm install`

### Changes not reflecting

```bash
rm -rf node_modules pnpm-lock.yaml
pnpm install
```

## Quick Commands Reference

```bash
# In tokens repo
npm version patch && git push --follow-tags

# In main project
pnpm update @bolt-design/tokens

# Check installed version
pnpm list @bolt-design/tokens

# Force reinstall
rm -rf node_modules pnpm-lock.yaml && pnpm install
```

## Files Included in This Package

```
bolt-design-tokens/
├── .github/
│   └── workflows/
│       └── publish.yml       # Auto-publish workflow
├── src/
│   ├── index.ts             # TypeScript utilities
│   ├── tokens.css           # Design tokens
│   └── themes.css           # Theme variations
├── .gitignore               # Git ignore rules
├── .npmrc                   # GitHub Packages config
├── package.json             # Package configuration
├── README.md                # Package documentation
└── SETUP.md                 # This file
```

## Next Steps

1. ✅ Create GitHub repository
2. ✅ Clone and copy files
3. ✅ Create Personal Access Token
4. ✅ Configure authentication
5. ✅ Commit and push
6. ✅ Verify automatic publishing
7. ✅ Update main project
8. ✅ Test everything works

You're all set! 🚀
