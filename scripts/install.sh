#/bin/bash
set -e
workdir=$(dirname $(dirname $(readlink -f "$0")))

cd $workdir/hackernel/kernel-space/
make install
mkdir -p /etc/hackernel/

ln -s $workdir/hackernel/scripts/modules-load/hackernel.conf /etc/modules-load.d/hackernel.conf
ln -s $workdir/hackernel/user-space/build/hackernel /usr/sbin/hackernel
ln -s $workdir/hackernel/scripts/systemd/hackernel.service /etc/systemd/system/hackernel.service
ln -s $workdir/uranus/cmd/web/uranus-web /usr/sbin/uranus-web
ln -s $workdir/uranus/configs/web.yaml /etc/hackernel/web.yaml
ln -s $workdir/uranus/init/uranus-web.service /etc/systemd/system/uranus-web.service

systemctl daemon-reload
