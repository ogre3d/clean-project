#!/bin/bash
. "$( cd "$( dirname "$0" )" && pwd )/common.sh"

export OGRE_HOME="$(pwd)/ogre"

mkdir build
cd build
cmake ..
make
make install
