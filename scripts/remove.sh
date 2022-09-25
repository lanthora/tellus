#/bin/bash
set -v
workdir=$(dirname $(dirname $(readlink -f "$0")))

cd $workdir/hackernel/kernel-space/
make remove

rm /usr/bin/hackernel
rm /usr/bin/uranus-sample
rm /usr/bin/uranus-telegram
rm /usr/bin/uranus-web

rm /etc/hackernel/telegram.yaml
rm /etc/hackernel/web.yaml
rmdir /etc/hackernel

rm /etc/modules-load.d/hackernel.conf
rm /usr/lib/systemd/system/hackernel.service
rm /usr/lib/systemd/system/uranus-telegram.service
rm /usr/lib/systemd/system/uranus-web.service
