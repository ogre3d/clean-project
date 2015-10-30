#!/bin/bash
. "$( cd "$( dirname "$0" )" && pwd )/common.sh"

# The cmake version carried by Ubuntu 12.04 is too old.
if [ -n "$TRAVIS" ]; then
    $SUDO add-apt-repository -y ppa:kalakris/cmake
fi

# nvidia-cg-toolkit package is in the non-free debian repository.
if [ -n "$CI_SERVER" ]; then
    $SUDO echo "deb http://httpredir.debian.org/debian jessie non-free" >> /etc/apt/sources.list
fi

$SUDO apt-get update -qq
$SUDO apt-get install -y \
    cmake \
    mercurial \
    libois-dev

if [ -n "$(apt-cache search "libogre-$OGRE_VERSION-dev")" ]; then
    $SUDO apt-get install -y \
        "libogre-$OGRE_VERSION-dev"
else
    $SUDO apt-get install -y \
        libcppunit-dev \
        libxaw7-dev \
        libfreetype6-dev \
        libfreeimage-dev \
        zlib1g-dev \
        libzzip-dev \
        libboost-all-dev \
        nvidia-cg-toolkit \
        libpoco-dev \
        libtbb-dev \
        libtinyxml-dev
fi

# OGRE Samples directories are not include in debian packages. As the sample
# application use some samples includes, as SdkTray.h, it is mandatory to
# get the sources.
hg clone https://bitbucket.org/sinbad/ogre
cd ogre
hg checkout "v${OGRE_VERSION/./-}-0"
cd ..
