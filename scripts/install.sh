#/bin/bash
set -v
workdir=$(dirname $(dirname $(readlink -f "$0")))

cd $workdir/hackernel/kernel-space/
make install
cp $workdir/hackernel/user-space/build/hackernel /usr/sbin/hackernel
cp $workdir/uranus/cmd/sample/uranus-sample /usr/sbin/uranus-sample
cp $workdir/uranus/cmd/telegram/uranus-telegram /usr/sbin/uranus-telegram
cp $workdir/uranus/cmd/web/uranus-web /usr/sbin/uranus-web

mkdir -p /etc/hackernel
cp $workdir/uranus/configs/telegram.yaml /etc/hackernel/telegram.yaml
cp $workdir/uranus/configs/web.yaml /etc/hackernel/web.yaml

cp $workdir/hackernel/scripts/modules-load/hackernel.conf /etc/modules-load.d/hackernel.conf
cp $workdir/hackernel/scripts/systemd/hackernel.service /etc/systemd/system/hackernel.service
cp $workdir/uranus/init/uranus-telegram.service /etc/systemd/system/uranus-telegram.service
cp $workdir/uranus/init/uranus-web.service /etc/systemd/system/uranus-web.service
