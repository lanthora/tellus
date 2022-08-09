#/bin/bash
set -e
workdir=$(dirname $(dirname $(readlink -f "$0")))

clear

echo -e "========================= SUCCESS ========================"
echo -e "[1] $workdir/hackernel/kernel-space/hackernel.ko"
echo -e "[2] $workdir/hackernel/user-space/build/hackernel"
echo -e "[3] $workdir/uranus/cmd/sample/uranus-sample"
echo -e "[4] $workdir/uranus/cmd/telegram/uranus-telegram"
echo -e "[5] $workdir/uranus/cmd/web/uranus-web"
echo -e "=========================================================="
