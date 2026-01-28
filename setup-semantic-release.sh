#!/bin/bash

# Setup script for semantic-release
# This creates the initial git tag so semantic-release knows the current version

echo "🔧 Setting up semantic-release..."

# Get current version from package.json
CURRENT_VERSION=$(node -p "require('./package.json').version")

echo "📦 Current version: $CURRENT_VERSION"

# Check if tag already exists
if git rev-parse "v$CURRENT_VERSION" >/dev/null 2>&1; then
  echo "✅ Tag v$CURRENT_VERSION already exists"
else
  echo "🏷️  Creating tag v$CURRENT_VERSION..."
  git tag -a "v$CURRENT_VERSION" -m "chore: initial version for semantic-release"
  echo "✅ Tag created"
fi

# Push tags
echo "📤 Pushing tags to remote..."
git push --tags

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. Make your changes"
echo "2. Commit with conventional format: git commit -m 'feat: your feature'"
echo "3. Push: git push origin main"
echo "4. Semantic-release will automatically version and publish!"
