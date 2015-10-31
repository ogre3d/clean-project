#!/bin/bash
. "$( cd "$( dirname "$0" )" && pwd )/common.sh"

if [ -z "$(apt-cache search "libogre-$OGRE_VERSION-dev")" ]; then
    cd ogre
    mkdir build
    cd build
    cmake .. -DOGRE_BUILD_SAMPLES=0 -DOGRE_BUILD_TESTS=0 -DOGRE_BUILD_TOOLS=0
    make -j 4
    $SUDO make install
    cd ../..
fi
