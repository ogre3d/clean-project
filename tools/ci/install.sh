#!/bin/bash
. "$( cd "$( dirname "$0" )" && pwd )/common.sh"

if [ -z "$(apt-cache search "$OGRE_DEB_PACKAGE")" ]; then
    mkdir ogre/build
    cd ogre/build

    # On 1.8 and earlier, threading seem to not work with linux
    if [ "$OGRE_VERSION" = "1.8" ]; then
        cmake .. -DOGRE_BUILD_SAMPLES=0 -DOGRE_BUILD_TESTS=0 -DOGRE_BUILD_TOOLS=0 -DOGRE_CONFIG_THREADS=0
    else
        cmake .. -DOGRE_BUILD_SAMPLES=0 -DOGRE_BUILD_TESTS=0 -DOGRE_BUILD_TOOLS=0
    fi
    make -j 4
    $SUDO make install
    cd ../..
fi
