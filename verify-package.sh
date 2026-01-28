#!/bin/bash

# Verification script for bolt-design-tokens package
# Run this before publishing to ensure everything is configured correctly

echo "🔍 Verifying bolt-design-tokens package..."
echo ""

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    echo "❌ Error: package.json not found. Run this script from the package root."
    exit 1
fi

# Check package name
PACKAGE_NAME=$(node -p "require('./package.json').name")
if [ "$PACKAGE_NAME" != "@bolt-design/tokens" ]; then
    echo "❌ Error: Package name should be '@bolt-design/tokens', found '$PACKAGE_NAME'"
    exit 1
fi
echo "✅ Package name: $PACKAGE_NAME"

# Check version
VERSION=$(node -p "require('./package.json').version")
echo "✅ Version: $VERSION"

# Check repository URL
REPO_URL=$(node -p "require('./package.json').repository.url")
if [[ "$REPO_URL" != *"bolt-design-tokens"* ]]; then
    echo "⚠️  Warning: Repository URL should point to bolt-design-tokens repo"
    echo "   Current: $REPO_URL"
else
    echo "✅ Repository URL: $REPO_URL"
fi

# Check required files
echo ""
echo "📁 Checking required files..."

required_files=(
    "src/index.ts"
    "src/tokens.css"
    "src/themes.css"
    "README.md"
    ".npmrc"
    ".gitignore"
)

for file in "${required_files[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file"
    else
        echo "❌ Missing: $file"
    fi
done

# Check GitHub Actions workflow
if [ -f ".github/workflows/publish.yml" ]; then
    echo "✅ .github/workflows/publish.yml"
else
    echo "⚠️  Missing: .github/workflows/publish.yml (auto-publish won't work)"
fi

# Check GITHUB_TOKEN environment variable
echo ""
echo "🔐 Checking authentication..."
if [ -z "$GITHUB_TOKEN" ]; then
    echo "⚠️  GITHUB_TOKEN environment variable not set"
    echo "   Add to ~/.zshrc: export GITHUB_TOKEN=\"your_token_here\""
else
    echo "✅ GITHUB_TOKEN is set"
fi

# Check publishConfig
REGISTRY=$(node -p "require('./package.json').publishConfig.registry")
if [ "$REGISTRY" = "https://npm.pkg.github.com" ]; then
    echo "✅ publishConfig registry: $REGISTRY"
else
    echo "❌ Error: publishConfig.registry should be 'https://npm.pkg.github.com'"
fi

# Summary
echo ""
echo "📊 Summary:"
echo "   Package: $PACKAGE_NAME@$VERSION"
echo "   Registry: GitHub Packages"
echo ""

# Check if ready to publish
if [ -z "$GITHUB_TOKEN" ]; then
    echo "⚠️  Set GITHUB_TOKEN before publishing"
    echo ""
    echo "Next steps:"
    echo "1. Create Personal Access Token at https://github.com/settings/tokens"
    echo "2. Add to ~/.zshrc: export GITHUB_TOKEN=\"your_token\""
    echo "3. Run: source ~/.zshrc"
    echo "4. Run this script again"
else
    echo "✅ Ready to publish!"
    echo ""
    echo "To publish manually:"
    echo "  npm publish"
    echo ""
    echo "Or push to GitHub and let Actions publish automatically:"
    echo "  git add ."
    echo "  git commit -m \"feat: initial release\""
    echo "  git push origin main"
fi
