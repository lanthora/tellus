#/bin/bash
set -e
workdir=$(dirname $(dirname $(readlink -f "$0")))
cd $workdir

cd $workdir/hackernel/kernel-space/
make clean

cd $workdir/hackernel/user-space/build/
rm -rf $workdir/hackernel/user-space/build/*

cd $workdir/venus
rm -rf $workdir/venus/build/*

cd $workdir/uranus
rm -rf $workdir/uranus/internal/web/webui/*
make clean
