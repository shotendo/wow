#!/bin/bash




cd /wow/src
git clone -b 3.3.5 git://github.com/TrinityCore/TrinityCore.git

cd TrinityCore
mkdir build
cd build
cmake ../ -DCMAKE_INSTALL_PREFIX=/wow
make
make install
