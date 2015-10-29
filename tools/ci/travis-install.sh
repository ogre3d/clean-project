#!/bin/sh
set -e

# OGRE
hg clone https://bitbucket.org/sinbad/ogre
cd ogre
hg checkout "$OGRE_VERSION"
mkdir build
cd build
cmake ..
make -j 4
sudo make install
cd ../..
