#!/bin/bash
. "$( cd "$( dirname "$0" )" && pwd )/common.sh"

# The cmake version carried by Ubuntu 12.04 is too old.
if [[ -n "$TRAVIS" && "$_system_version" == "12.04" ]]; then
    $SUDO add-apt-repository -y ppa:kalakris/cmake
fi

# nvidia-cg-toolkit package is in the multiverse ubuntu repository.
if [[ -n "$TRAVIS" && "$_system_version" == "14.04" ]]; then
    $SUDO apt-add-repository -y multiverse
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

if [ -n "$(apt-cache search "$OGRE_DEB_PACKAGE")" ]; then
    $SUDO apt-get install -y \
        "$OGRE_DEB_PACKAGE"
else
    # libxrandr-dev is needed by Ubuntu 14.04
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
        libtinyxml-dev \
        libxrandr-dev
fi

# OGRE Samples directories are not include in debian packages after OGRE 1.7.4.
# http://stackoverflow.com/a/15238730/2180332
# As the sample application use some samples includes, as SdkTray.h, it is
# mandatory to get the sources.
if [[ -z "$(apt-cache search "$OGRE_DEB_PACKAGE")" || "$OGRE_VERSION" != "1.7" ]]; then
    hg clone https://bitbucket.org/sinbad/ogre -u "$OGRE_HG_BRANCH"
fi
