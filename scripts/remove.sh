#/bin/bash
set -v
workdir=$(dirname $(dirname $(readlink -f "$0")))

cd $workdir/hackernel/kernel-space/
make remove

rm /usr/sbin/hackernel
rm /usr/sbin/uranus-sample
rm /usr/sbin/uranus-telegram
rm /usr/sbin/uranus-web

rm /etc/hackernel/telegram.yaml
rm /etc/hackernel/web.yaml
rmdir /etc/hackernel

rm /etc/modules-load.d/hackernel.conf
rm /etc/systemd/system/hackernel.service
rm /etc/systemd/system/uranus-telegram.service
rm /etc/systemd/system/uranus-web.service
