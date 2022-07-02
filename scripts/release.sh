#/bin/bash

workdir=$(dirname $(dirname $(readlink -f "$0")))
cd $workdir

cd $workdir/hackernel/kernel-space/
make

cd $workdir/hackernel/user-space/build/
cmake $workdir/hackernel/user-space/ -DCMAKE_BUILD_TYPE=Release
make

cd $workdir/cronus
npm install
npm run build
cp -r $workdir/cronus/build/* $workdir/uranus/internal/web/webui/

cd $workdir/uranus
make init
make
