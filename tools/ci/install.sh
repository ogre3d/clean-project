#!/bin/bash
. "$( cd "$( dirname "$0" )" && pwd )/common.sh"

if [ -z "$(apt-cache search "libogre-$OGRE_VERSION-dev")" ]; then
    cd ogre
    mkdir build
    cd build
    cmake ..
    make -j 4
    $SUDO make install
    cd ../..
fi
