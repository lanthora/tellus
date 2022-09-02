#/bin/bash
set -v
workdir=$(dirname $(dirname $(readlink -f "$0")))

cd $workdir/hackernel/kernel-space/
make clean
DRIVER_VERSION=$(grep -Po '(?<=^PACKAGE_VERSION=")(.*)(?="$)' dkms.conf)
mkdir -p $DESTDIR/usr/src/hackernel-$DRIVER_VERSION
cp -r $workdir/hackernel/kernel-space/* $DESTDIR/usr/src/hackernel-$DRIVER_VERSION

mkdir -p $DESTDIR/usr/sbin/
cp $workdir/hackernel/user-space/build/hackernel $DESTDIR/usr/sbin/hackernel
cp $workdir/uranus/cmd/sample/uranus-sample $DESTDIR/usr/sbin/uranus-sample
cp $workdir/uranus/cmd/telegram/uranus-telegram $DESTDIR/usr/sbin/uranus-telegram
cp $workdir/uranus/cmd/web/uranus-web $DESTDIR/usr/sbin/uranus-web

mkdir -p $DESTDIR/etc/hackernel/
cp $workdir/uranus/configs/telegram.yaml $DESTDIR/etc/hackernel/telegram.yaml
cp $workdir/uranus/configs/web.yaml $DESTDIR/etc/hackernel/web.yaml

mkdir -p $DESTDIR/etc/modules-load.d/
mkdir -p $DESTDIR/etc/systemd/system/
cp $workdir/hackernel/scripts/modules-load/hackernel.conf $DESTDIR/etc/modules-load.d/hackernel.conf
cp $workdir/hackernel/scripts/systemd/hackernel.service $DESTDIR/etc/systemd/system/hackernel.service
cp $workdir/uranus/init/uranus-telegram.service $DESTDIR/etc/systemd/system/uranus-telegram.service
cp $workdir/uranus/init/uranus-web.service $DESTDIR/etc/systemd/system/uranus-web.service
