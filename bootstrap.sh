#/bin/bash

set -e

root=$(dirname $(readlink -f "$0"))
cd $root

# 移除历史文件
rm -rf $root/hackernel $root/uranus $root/uranus-webui-react

# 拉项目源码
git clone https://github.com/freshdom/hackernel.git
git clone https://github.com/freshdom/uranus.git
git clone https://github.com/freshdom/uranus-webui-react.git

# 编译调试版本的内核模块
cd $root/hackernel/kernel-space/
make debug

# 编译调试版本的用户态程序
cd $root/hackernel/user-space/build/
cmake $root/hackernel/user-space/ -DCMAKE_BUILD_TYPE=Debug 
make

# 前端打包
cd $root/uranus-webui-react
npm install
npm run build
cp -r $root/uranus-webui-react/build/* $root/uranus/internal/web/webui/

# 打包后端服务
cd $root/uranus
make init
make

echo -e "\n\n=========================== 请手动执行后续操作 ===========================\n"
echo "加载内核模块[root]: insmod $root/hackernel/kernel-space/hackernel.ko"
echo "启动核心服务[root]: $root/hackernel/user-space/build/hackernel"
echo "启动后端服务[root]: $root/uranus/cmd/sample/uranus-sample"
