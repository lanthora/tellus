#/bin/bash
set -e
workdir=$(dirname $(dirname $(readlink -f "$0")))

cd $workdir/hackernel/kernel-space/
make clean
DRIVER_VERSION=$(grep -Po '(?<=^PACKAGE_VERSION=")(.*)(?="$)' dkms.conf)
mkdir -p $DESTDIR/usr/src/hackernel-$DRIVER_VERSION
cp -r $workdir/hackernel/kernel-space/* $DESTDIR/usr/src/hackernel-$DRIVER_VERSION

mkdir -p $DESTDIR/usr/bin/
cp $workdir/hackernel/user-space/build/hackernel $DESTDIR/usr/bin/hackernel
cp $workdir/uranus/cmd/sample/uranus-sample $DESTDIR/usr/bin/uranus-sample
cp $workdir/uranus/cmd/telegram/uranus-telegram $DESTDIR/usr/bin/uranus-telegram
cp $workdir/uranus/cmd/web/uranus-web $DESTDIR/usr/bin/uranus-web
cp $workdir/uranus/cmd/notify/uranus-notify $DESTDIR/usr/bin/uranus-notify

mkdir -p $DESTDIR/etc/hackernel/
cp $workdir/uranus/configs/telegram.yaml $DESTDIR/etc/hackernel/telegram.yaml
cp $workdir/uranus/configs/web.yaml $DESTDIR/etc/hackernel/web.yaml
cp $workdir/uranus/configs/notify.yaml $DESTDIR/etc/hackernel/notify.yaml

mkdir -p $DESTDIR/etc/modules-load.d/
mkdir -p $DESTDIR/usr/lib/systemd/system/
mkdir -p $DESTDIR/usr/lib/systemd/user/
cp $workdir/hackernel/scripts/modules-load/hackernel.conf $DESTDIR/etc/modules-load.d/hackernel.conf
cp $workdir/hackernel/scripts/systemd/hackernel.service $DESTDIR/usr/lib/systemd/system/hackernel.service
cp $workdir/uranus/init/uranus-telegram.service $DESTDIR/usr/lib/systemd/system/uranus-telegram.service
cp $workdir/uranus/init/uranus-web.service $DESTDIR/usr/lib/systemd/system/uranus-web.service
cp $workdir/uranus/init/uranus-notify.service $DESTDIR/usr/lib/systemd/user/uranus-notify.service
