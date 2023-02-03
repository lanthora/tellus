#/bin/bash
set -e
workdir=$(dirname $(dirname $(readlink -f "$0")))

cd $workdir/hackernel/user-space/build/
cmake $workdir/hackernel/user-space/ -DCMAKE_BUILD_TYPE=Release
make

# 仅在内存大于 4G 的时候编译前端资源
if [ `awk '($1 == "MemAvailable:"){print int($2/1048576)}' /proc/meminfo` -ge 4 ]
then
        cd $workdir/venus
        npm install
        npm run build
        rm -rf $workdir/uranus/internal/web/webui/*
        cp -r $workdir/venus/build/* $workdir/uranus/internal/web/webui/
fi

cd $workdir/uranus
make init
make
