# 👋 Start Here - Design Tokens Migration

Welcome! This guide will help you move the design tokens to a separate repository.

## 📚 Documentation Overview

Choose your path based on your preference:

### 🚀 Quick Start (Recommended)

**File:** `QUICK_START.md`  
**Time:** 15 minutes  
**Best for:** Getting it done fast with clear steps

### ✅ Step-by-Step Checklist

**File:** `CHECKLIST.md`  
**Time:** 20 minutes  
**Best for:** Tracking progress, ensuring nothing is missed

### 📖 Detailed Setup Guide

**File:** `SETUP.md`  
**Time:** 20 minutes  
**Best for:** Understanding each step in detail

### 📋 Complete Documentation

**File:** `../SEPARATE_REPO_SETUP.md`  
**Time:** 30 minutes  
**Best for:** Deep dive into the entire process

### 🏗️ Architecture Overview

**File:** `../TOKENS_ARCHITECTURE.md`  
**Time:** 10 minutes  
**Best for:** Understanding the system design

---

## 🎯 What You'll Accomplish

By following this guide, you'll:

1. ✅ Create a new GitHub repository: `bolt-design-tokens`
2. ✅ Publish design tokens to GitHub Packages
3. ✅ Update main project to use published package
4. ✅ Set up automated publishing via GitHub Actions
5. ✅ Enable independent versioning for tokens

---

## ⚡ Quick Path (15 minutes)

If you want to get started immediately:

### 1. Create Repository (2 min)

Go to https://github.com/new

- Name: `bolt-design-tokens`
- Private, with README, .gitignore (Node), MIT license

### 2. Clone & Copy (2 min)

```bash
cd ~/projects
git clone https://github.com/rohan016-dev/bolt-design-tokens.git
cd bolt-design-tokens
cp -r ../Design_System_POC/packages/design-tokens/* .
cp -r ../Design_System_POC/packages/design-tokens/.github .
cp ../Design_System_POC/packages/design-tokens/.npmrc .
cp ../Design_System_POC/packages/design-tokens/.gitignore .
rm -rf node_modules
```

### 3. Create Token (3 min)

https://github.com/settings/tokens

- Scopes: `write:packages`, `read:packages`, `delete:packages`

### 4. Configure & Publish (3 min)

```bash
echo 'export GITHUB_TOKEN="your_token"' >> ~/.zshrc
source ~/.zshrc
./verify-package.sh
git add . && git commit -m "feat: initial release" && git push
```

### 5. Update Main Project (5 min)

```bash
cd ~/projects/Design_System_POC
# Update package.json: "@bolt-design/tokens": "^1.0.0"
# Create .npmrc with GitHub Packages config
rm -rf packages/design-tokens pnpm-workspace.yaml
pnpm install && pnpm dev
```

**Done!** 🎉

For detailed instructions, see `QUICK_START.md`

---

## 📦 What's in This Package

```
packages/design-tokens/
├── src/
│   ├── index.ts          # TypeScript utilities
│   ├── tokens.css        # Design tokens
│   └── themes.css        # Theme variations
│
├── .github/
│   └── workflows/
│       └── publish.yml   # Auto-publish workflow
│
├── Documentation/
│   ├── START_HERE.md     # This file
│   ├── QUICK_START.md    # 5-step guide
│   ├── SETUP.md          # Detailed setup
│   ├── CHECKLIST.md      # Progress tracker
│   └── README.md         # Package docs
│
├── Configuration/
│   ├── package.json      # Package config
│   ├── .npmrc            # GitHub Packages
│   └── .gitignore        # Ignore rules
│
└── Tools/
    └── verify-package.sh # Verification script
```

---

## 🔍 Verification

Before you start, verify everything is ready:

```bash
./verify-package.sh
```

This checks:

- ✅ Package name and version
- ✅ Repository URL
- ✅ Required files exist
- ✅ Configuration is correct
- ⚠️ GITHUB_TOKEN (you'll set this up)

---

## 🎓 Learning Path

### Beginner

1. Read: `QUICK_START.md`
2. Follow: 5 steps
3. Done!

### Intermediate

1. Read: `SETUP.md`
2. Use: `CHECKLIST.md` to track progress
3. Reference: `../GITHUB_PACKAGES_GUIDE.md` for publishing

### Advanced

1. Read: `../TOKENS_ARCHITECTURE.md` for system design
2. Read: `../SEPARATE_REPO_SETUP.md` for complete guide
3. Customize: Workflow and configuration

---

## 🆘 Need Help?

### Common Issues

**Can't publish?**

```bash
./verify-package.sh  # Check configuration
```

**Can't install in main project?**

```bash
echo $GITHUB_TOKEN  # Verify token is set
```

**Changes not showing?**

```bash
pnpm update @bolt-design/tokens
```

### Documentation

- **Quick answers:** `QUICK_START.md`
- **Step-by-step:** `CHECKLIST.md`
- **Detailed guide:** `SETUP.md`
- **Publishing:** `../GITHUB_PACKAGES_GUIDE.md`
- **Architecture:** `../TOKENS_ARCHITECTURE.md`

---

## 🎯 Success Criteria

You'll know you're done when:

- ✅ New repository exists: `bolt-design-tokens`
- ✅ Package published to GitHub Packages
- ✅ Main project installs from GitHub Packages
- ✅ `pnpm dev` runs without errors
- ✅ Design tokens work correctly
- ✅ Theme switching works
- ✅ Dark mode works

---

## 🚀 Ready to Start?

Choose your path:

1. **Fast track:** Open `QUICK_START.md` → Follow 5 steps → Done in 15 min
2. **Careful approach:** Open `CHECKLIST.md` → Check off each item → Done in 20 min
3. **Deep dive:** Open `SETUP.md` → Understand everything → Done in 20 min

---

## 📊 Current Status

**Package:** @bolt-design/tokens  
**Version:** 1.0.0  
**Status:** ✅ Ready to migrate  
**Target:** GitHub Packages  
**Automation:** ✅ GitHub Actions configured

---

## 💡 What Happens Next?

After migration:

### Updating Tokens

```bash
# In bolt-design-tokens repo
npm version patch
git push --follow-tags
# Auto-publishes via GitHub Actions!
```

### Using Updated Tokens

```bash
# In Design_System_POC repo
pnpm update @bolt-design/tokens
pnpm dev
```

### Benefits

- ✅ Independent versioning
- ✅ Reusable across projects
- ✅ Faster updates
- ✅ Automated publishing
- ✅ Clear separation of concerns

---

**Let's get started!** 🚀

Open `QUICK_START.md` for the fastest path to success.
