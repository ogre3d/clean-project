#!/bin/bash
set -e
SUDO="sudo"

# sudo is not needed at gitlab.com
if [ -n "$CI_SERVER" ]; then
    SUDO=""
fi

OGRE_DEB_PACKAGE="libogre-$OGRE_VERSION-dev"

# The Ogre package in Ubuntu 12.04 is Ogre 1.7
if [[ "$OGRE_VERSION" == "1.7" && -n "$TRAVIS" ]]; then
    OGRE_DEB_PACKAGE="libogre-dev"
fi

OGRE_HG_BRANCH="v${OGRE_VERSION/./-}-0"

# This one is used by cmake to locate the samples header dir
export OGRE_HOME="$(pwd)/ogre"
