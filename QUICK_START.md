# 🚀 Quick Start - 5 Steps to Separate Repository

Follow these 5 simple steps to move your design tokens to a separate repository.

---

## Step 1: Create GitHub Repository (2 min)

1. Go to: **https://github.com/new**
2. Fill in:
   - Repository name: `bolt-design-tokens`
   - Description: "Design tokens and CSS variables for Bolt Design system"
   - Visibility: **Private** ✅
   - Initialize with README: **Yes** ✅
   - Add .gitignore: **Node** ✅
   - Choose license: **MIT** ✅
3. Click **"Create repository"**

---

## Step 2: Clone and Copy Files (2 min)

```bash
# Clone the new repository
cd ~/projects
git clone https://github.com/rohan016-dev/bolt-design-tokens.git
cd bolt-design-tokens

# Copy all files from current project
cp -r ../Design_System_POC/packages/design-tokens/* .
cp -r ../Design_System_POC/packages/design-tokens/.github .
cp ../Design_System_POC/packages/design-tokens/.npmrc .
cp ../Design_System_POC/packages/design-tokens/.gitignore .

# Clean up
rm -rf node_modules
```

---

## Step 3: Create GitHub Token (3 min)

1. Go to: **https://github.com/settings/tokens**
2. Click: **"Generate new token"** → **"Generate new token (classic)"**
3. Configure:
   - Note: `Publish packages`
   - Expiration: `90 days`
   - Scopes: ✅ `write:packages` ✅ `read:packages` ✅ `delete:packages`
4. Click **"Generate token"**
5. **Copy the token immediately!** (You won't see it again)

---

## Step 4: Configure and Publish (3 min)

```bash
# Add token to your shell profile
echo 'export GITHUB_TOKEN="paste_your_token_here"' >> ~/.zshrc
source ~/.zshrc

# Verify everything is ready
./verify-package.sh

# Commit and push (GitHub Actions will auto-publish)
git add .
git commit -m "feat: initial design tokens package"
git push origin main
```

**Wait 1-2 minutes for GitHub Actions to publish the package.**

Verify at: https://github.com/rohan016-dev/bolt-design-tokens/actions

---

## Step 5: Update Main Project (3 min)

```bash
# Go to your main project
cd ~/projects/Design_System_POC

# 1. Update package.json
# Change: "@bolt-design/tokens": "workspace:*"
# To:     "@bolt-design/tokens": "^1.0.0"

# 2. Create .npmrc in project root
cat > .npmrc << 'EOF'
@bolt-design:registry=https://npm.pkg.github.com
//npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}
EOF

# 3. Remove local package
rm -rf packages/design-tokens
rm pnpm-workspace.yaml

# 4. Install from GitHub Packages
pnpm install

# 5. Test it works!
pnpm dev
```

Visit **http://localhost:3000** and verify everything works! ✅

---

## ✅ Done!

Your design tokens are now in a separate repository and published to GitHub Packages!

### What You've Achieved:

✅ Independent versioning for design tokens
✅ Can update tokens without touching component code  
✅ Reusable across multiple projects
✅ Automated publishing via GitHub Actions

### Future Updates:

**In bolt-design-tokens repo:**

```bash
# Make changes to src/tokens.css or src/themes.css
npm version patch
git push --follow-tags
# GitHub Actions publishes automatically!
```

**In Design_System_POC repo:**

```bash
pnpm update @bolt-design/tokens
pnpm dev
# Test and commit
```

---

## Need Help?

- **Detailed guide:** See `SETUP.md`
- **Step-by-step checklist:** See `CHECKLIST.md`
- **Full documentation:** See `../SEPARATE_REPO_SETUP.md`
- **Publishing guide:** See `../GITHUB_PACKAGES_GUIDE.md`

## Troubleshooting

**Can't publish?**

```bash
./verify-package.sh  # Check what's wrong
```

**Can't install in main project?**

```bash
echo $GITHUB_TOKEN  # Verify token is set
rm -rf node_modules pnpm-lock.yaml && pnpm install  # Force reinstall
```

**Changes not showing?**

```bash
pnpm update @bolt-design/tokens  # Update to latest version
```

---

**Total Time:** ~15 minutes

**Ready?** Start with Step 1! 🚀
