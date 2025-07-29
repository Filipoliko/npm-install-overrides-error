#!/bin/bash

set -e

# Clean up previous builds if needed
rm -r ./storage/package-* 2>/dev/null || true

NPM_PUBLISH_REGISTRY="http://localhost:4873"

for package in packages/*; do
  if [ -d "$package" ]; then
    (cd "$package" && npm publish --registry $NPM_PUBLISH_REGISTRY)
  fi
done
