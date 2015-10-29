#!/bin/bash
set -e

sudo add-apt-repository -y ppa:kalakris/cmake
sudo apt-get update -qq
sudo apt-get install -y \
mercurial \
cmake \
libcppunit-dev \
libxaw7-dev \
libois-dev \
libfreetype6-dev \
libfreeimage-dev \
zlib1g-dev \
libzzip-dev \
libboost-all-dev \
nvidia-cg-toolkit \
libpoco-dev \
libtbb-dev \
libtinyxml-dev
