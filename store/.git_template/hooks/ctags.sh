#!/bin/bash

set -eo pipefail

cd "$(git rev-parse --git-dir)/.."
trap 'rm -f .git/$$.tags' EXIT
ctags -f .git/$$.tags
mv .git/$$.tags .git/tags
