#!/bin/bash

set -eo pipefail

.git/hooks/ctags.sh > /tmp/ctags.log 2>&1 &
