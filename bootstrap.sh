#/bin/bash

set -e

root=$(dirname $(readlink -f "$0"))
cd $root

# 拉项目源码
if [ ! -d $root/hackernel ]; then
        git clone https://github.com/freshdom/hackernel.git
fi

if [ ! -d $root/uranus ]; then
        git clone https://github.com/freshdom/uranus.git
fi

if [ ! -d $root/uranus-webui ]; then
        git clone https://github.com/freshdom/uranus-webui.git
fi

# 编译调试版本的内核模块
cd $root/hackernel/kernel-space/
make debug

# 编译调试版本的用户态程序
cd $root/hackernel/user-space/build/
cmake $root/hackernel/user-space/ -DCMAKE_BUILD_TYPE=Debug 
make

# 前端打包
cd $root/uranus-webui
npm install
npm run build
cp -r $root/uranus-webui/build/* $root/uranus/internal/web/webui/

# 打包后端服务
cd $root/uranus
make init
make

echo -e "\n\n=========================== 请手动执行后续操作 ===========================\n"
echo "加载内核模块[root]: insmod $root/hackernel/kernel-space/hackernel.ko"
echo "启动核心服务[root]: $root/hackernel/user-space/build/hackernel"
echo "启动后端服务[root]: $root/uranus/cmd/sample/uranus-sample"
