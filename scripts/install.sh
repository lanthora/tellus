#/bin/bash
set -v
workdir=$(dirname $(dirname $(readlink -f "$0")))

cd $workdir/hackernel/kernel-space/
make install

mkdir -p /usr/bin/
cp $workdir/hackernel/user-space/build/hackernel /usr/bin/hackernel
cp $workdir/uranus/cmd/sample/uranus-sample /usr/bin/uranus-sample
cp $workdir/uranus/cmd/telegram/uranus-telegram /usr/bin/uranus-telegram
cp $workdir/uranus/cmd/web/uranus-web /usr/bin/uranus-web

mkdir -p /etc/hackernel/
cp $workdir/uranus/configs/telegram.yaml /etc/hackernel/telegram.yaml
cp $workdir/uranus/configs/web.yaml /etc/hackernel/web.yaml

mkdir -p /etc/modules-load.d/
mkdir -p /usr/lib/systemd/system/
cp $workdir/hackernel/scripts/modules-load/hackernel.conf /etc/modules-load.d/hackernel.conf
cp $workdir/hackernel/scripts/systemd/hackernel.service /usr/lib/systemd/system/hackernel.service
cp $workdir/uranus/init/uranus-telegram.service /usr/lib/systemd/system/uranus-telegram.service
cp $workdir/uranus/init/uranus-web.service /usr/lib/systemd/system/uranus-web.service
