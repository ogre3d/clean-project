#!/bin/bash
set -e
SUDO="sudo"

# sudo is not needed at gitlab.com
if [ -n "$CI_SERVER" ]; then
    SUDO=""
fi
