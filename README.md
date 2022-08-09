# Bootstrap

完整编译需要多个依赖,可以在子项目中获取完整依赖.
或者简单粗暴一些,直接 `make`,根据报错补全依赖后重新 `make`直到编译成功.

成功后会输出 _类似_ 以下内容:

```txt
========================= SUCCESS ========================
[1] /root/bootstrap/hackernel/kernel-space/hackernel.ko
[2] /root/bootstrap/hackernel/user-space/build/hackernel
[3] /root/bootstrap/uranus/cmd/sample/uranus-sample
[4] /root/bootstrap/uranus/cmd/telegram/uranus-telegram
[5] /root/bootstrap/uranus/cmd/web/uranus-web
==========================================================
```

* [1] 是内核模块,进行其他操作前需要[加载内核模块](https://man.archlinux.org/man/insmod.8.en).
* [2] 是与内核模块直接通信的服务程序,这个程序又对外提供接口,避免其他服务直接与内核交互.可以直接启动.
* [3] 作为测试程序,运行依赖上一个服务程序.运行后持续输出系统中启动的进程.这个程序正常即可确定所有服务正常启动.
* [4] 产生的日志上报到 Telegram,与 `uranus-sample` 同级
* [5] 支持 Web API 操作,与 `uranus-sample` 同级

有些进程启动时需要配置文件,配置文件参考子模块中的说明.

如果仔细观察编译过程,还会发现构建了前端项目,前端项目的文件直接被编译到了 [5] 的二进制中.
由于作者是前端的初学者,除用户登录登出外,并没有完成任何实际可用的功能.
如果你是前端开发人员,欢迎协助完成页面开发.

子模块将维持最新稳定版本,而非主线版本.
