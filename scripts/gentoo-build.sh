#/bin/bash
set -e
workdir=$(dirname $(dirname $(readlink -f "$0")))

cd $workdir/hackernel/user-space/build/
cmake $workdir/hackernel/user-space/ -DCMAKE_BUILD_TYPE=Release
make

cd $workdir/uranus
make init
make
