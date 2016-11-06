#!/bin/bash
set -e
cd `git rev-parse --git-dir`/..
ctags
