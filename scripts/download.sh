#/bin/bash

workdir=$(dirname $(dirname $(readlink -f "$0")))

download() {
        cd $workdir
        project=${1}
        if [ ! -d $workdir/$project ]; then
                git clone https://github.com/freshdom/$project.git
        else
                cd $workdir/$project
                git stash
                git checkout master
                git pull
        fi
}

download hackernel
download uranus
download cronus
