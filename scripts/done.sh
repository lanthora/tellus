#/bin/bash
set -e
workdir=$(dirname $(dirname $(readlink -f "$0")))

clear

echo "========================= SUCCESS ========================"
echo "[1] $workdir/hackernel/kernel-space/hackernel.ko"
echo "[2] $workdir/hackernel/user-space/build/hackernel"
echo "[3] $workdir/uranus/cmd/sample/uranus-sample"
echo "[4] $workdir/uranus/cmd/telegram/uranus-telegram"
echo "[5] $workdir/uranus/cmd/web/uranus-web"
echo "[6] $workdir/uranus/cmd/notify/uranus-notify"
echo "=========================================================="
