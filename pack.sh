#!/bin/bash

set -e

for package in packages/*; do
  if [ -d "$package" ]; then
    (cd "$package" && npm pack --pack-destination ../../)
  fi
done
