#!/bin/bash
. "$( cd "$( dirname "$0" )" && pwd )/common.sh"

mkdir build
cd build
cmake ..
make
make install
