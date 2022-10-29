#/bin/bash
set -e
workdir=$(dirname $(dirname $(readlink -f "$0")))
cd $workdir

cd $workdir/hackernel/user-space/build/
cmake $workdir/hackernel/user-space/ -DCMAKE_BUILD_TYPE=Release
make

cd $workdir/venus
npm install
npm run build
rm -rf $workdir/uranus/internal/web/webui/*
cp -r $workdir/venus/build/* $workdir/uranus/internal/web/webui/

cd $workdir/uranus
make init
make
