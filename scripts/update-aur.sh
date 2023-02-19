#!/bin/bash -ex

rm -rf /tmp/tellus-*

workdir=`mktemp -d -t tellus-XXXXXX`
cd $workdir
git clone ssh://aur@aur.archlinux.org/tellus-git.git

cd tellus-git
makepkg
makepkg --printsrcinfo > .SRCINFO

git diff --quiet && exit

version=`grep -oP "(?<=pkgver = ).*" .SRCINFO`

git add . -u
git commit -m "update to $version"
git push

rm -rf $workdir
