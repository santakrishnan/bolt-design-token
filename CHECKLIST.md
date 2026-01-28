# bolt-design-tokens Setup Checklist

Use this checklist to track your progress setting up the separate repository.

## Pre-Setup

- [ ] Read `SETUP.md` for quick start guide
- [ ] Read `SEPARATE_REPO_SETUP.md` for detailed instructions
- [ ] Verify all files are present in `packages/design-tokens/`

## GitHub Repository Setup

- [ ] Create new repository: `bolt-design-tokens`

  - URL: https://github.com/rohan016-dev/bolt-design-tokens
  - Visibility: Private (recommended)
  - Initialize with README: ✅
  - Add .gitignore: Node ✅
  - Add license: MIT ✅

- [ ] Clone repository locally
  ```bash
  cd ~/projects
  git clone https://github.com/rohan016-dev/bolt-design-tokens.git
  ```

## File Migration

- [ ] Copy all files from `packages/design-tokens/` to new repo

  ```bash
  cd bolt-design-tokens
  cp -r ../Design_System_POC/packages/design-tokens/* .
  cp -r ../Design_System_POC/packages/design-tokens/.github .
  cp ../Design_System_POC/packages/design-tokens/.npmrc .
  cp ../Design_System_POC/packages/design-tokens/.gitignore .
  ```

- [ ] Remove node_modules

  ```bash
  rm -rf node_modules
  ```

- [ ] Verify file structure:
  - [ ] `.github/workflows/publish.yml`
  - [ ] `src/index.ts`
  - [ ] `src/tokens.css`
  - [ ] `src/themes.css`
  - [ ] `.gitignore`
  - [ ] `.npmrc`
  - [ ] `package.json`
  - [ ] `README.md`
  - [ ] `SETUP.md`
  - [ ] `CHECKLIST.md` (this file)

## Authentication Setup

- [ ] Create GitHub Personal Access Token

  - Go to: https://github.com/settings/tokens
  - Click: "Generate new token (classic)"
  - Name: "Publish packages"
  - Expiration: 90 days
  - Scopes: `write:packages`, `read:packages`, `delete:packages`
  - Copy token immediately!

- [ ] Add token to shell profile

  ```bash
  # Add to ~/.zshrc or ~/.bashrc
  export GITHUB_TOKEN="your_token_here"

  # Reload
  source ~/.zshrc
  ```

- [ ] Verify token is set
  ```bash
  echo $GITHUB_TOKEN
  ```

## Package Verification

- [ ] Run verification script

  ```bash
  chmod +x verify-package.sh
  ./verify-package.sh
  ```

- [ ] Fix any issues reported by verification script

- [ ] Install dependencies
  ```bash
  npm install
  ```

## Publish to GitHub Packages

- [ ] Commit and push to GitHub

  ```bash
  git add .
  git commit -m "feat: initial design tokens package"
  git push origin main
  ```

- [ ] Verify GitHub Actions workflow runs

  - Go to: https://github.com/rohan016-dev/bolt-design-tokens/actions
  - Check workflow status
  - Wait for completion

- [ ] Verify package is published
  - Go to: https://github.com/rohan016-dev/bolt-design-tokens
  - Click "Packages" in right sidebar
  - Should see `@bolt-design/tokens`

### Alternative: Manual Publishing

If automatic publishing fails:

- [ ] Login to GitHub Packages

  ```bash
  npm login --registry=https://npm.pkg.github.com
  # Username: your GitHub username
  # Password: your Personal Access Token
  # Email: your GitHub email
  ```

- [ ] Publish manually
  ```bash
  npm publish
  ```

## Update Main Project (Design_System_POC)

- [ ] Update `package.json` dependencies

  ```json
  {
    "dependencies": {
      "@bolt-design/tokens": "^1.0.0"
    }
  }
  ```

- [ ] Create `.npmrc` in project root

  ```
  @bolt-design:registry=https://npm.pkg.github.com
  //npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}
  ```

- [ ] Remove local package directory

  ```bash
  rm -rf packages/design-tokens
  ```

- [ ] Remove workspace configuration (if not using other packages)

  ```bash
  rm pnpm-workspace.yaml
  ```

- [ ] Install from GitHub Packages
  ```bash
  pnpm install
  ```

## Testing

- [ ] Start development server

  ```bash
  pnpm dev
  ```

- [ ] Visit http://localhost:3000

- [ ] Verify design tokens are working:

  - [ ] Colors display correctly
  - [ ] Themes switch properly
  - [ ] Dark mode works
  - [ ] Components render correctly

- [ ] Check browser console for errors

- [ ] Test block previews with theme controls

## Final Steps

- [ ] Commit changes in main project

  ```bash
  git add .
  git commit -m "chore: migrate design tokens to separate package"
  git push
  ```

- [ ] Update team documentation

- [ ] Share setup instructions with team

## Future Workflow Test

Test the update workflow:

- [ ] Make a change in `bolt-design-tokens` repo

  ```bash
  # Edit src/tokens.css
  npm version patch
  git add .
  git commit -m "feat(tokens): test update"
  git push --follow-tags
  ```

- [ ] Update in main project

  ```bash
  pnpm update @bolt-design/tokens
  pnpm dev
  ```

- [ ] Verify changes appear

## Troubleshooting

If you encounter issues, check:

- [ ] `GITHUB_TOKEN` environment variable is set
- [ ] `.npmrc` is configured correctly in both repos
- [ ] Package version is correct in `package.json`
- [ ] GitHub Actions workflow completed successfully
- [ ] You have access to the repository

## Success Criteria

✅ New repository created and configured
✅ Package published to GitHub Packages
✅ Main project installs from GitHub Packages
✅ Development server runs without errors
✅ All design tokens work correctly
✅ Theme switching works
✅ Update workflow tested and working

---

## Quick Commands Reference

### In bolt-design-tokens repo:

```bash
# Verify setup
./verify-package.sh

# Publish manually
npm publish

# Update version
npm version patch
git push --follow-tags
```

### In Design_System_POC repo:

```bash
# Install/update tokens
pnpm install
pnpm update @bolt-design/tokens

# Check version
pnpm list @bolt-design/tokens

# Force reinstall
rm -rf node_modules pnpm-lock.yaml && pnpm install
```

---

**Current Status:** Not Started

**Started:** ****\_\_\_****

**Completed:** ****\_\_\_****

**Notes:**
