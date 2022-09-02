#/bin/bash
set -e
workdir=$(dirname $(dirname $(readlink -f "$0")))

cd $workdir
git remote set-url origin git@github.com:lanthora/tellus.git

cd $workdir/hackernel/
git remote set-url origin git@github.com:lanthora/hackernel.git

cd $workdir/venus
git remote set-url origin git@github.com:lanthora/venus.git

cd $workdir/uranus
git remote set-url origin git@github.com:lanthora/uranus.git
