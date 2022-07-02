#/bin/bash

set -e

workdir=$(dirname $(dirname $(readlink -f "$0")))

systemctl stop uranus-web
systemctl stop hackernel

cd $workdir/hackernel/kernel-space/
make remove

rm -f /etc/modules-load.d/hackernel.conf
rm -f /usr/sbin/hackernel
rm -f /etc/systemd/system/hackernel.service
rm -f /usr/sbin/uranus-web
rm -f /etc/hackernel/web.yaml
rm -f /etc/systemd/system/uranus-web.service
rm -f /var/lib/hackernel/web.db
rmdir /etc/hackernel/
rmdir /var/lib/hackernel/

systemctl daemon-reload
