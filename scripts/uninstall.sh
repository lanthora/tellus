#/bin/bash
rm /lib/modules/$(uname -r)/hackernel.ko
depmod

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
