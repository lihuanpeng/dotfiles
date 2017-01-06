### 脚本均为网络下载，来源：https://teddysun.com/448.html

1. l2tp.sh 自动安装 l2tp 服务脚本

2. xen_debian_pptpd.sh 自动安装 pptp 服务脚本

3. 安装顺序：先运行 l2tp 脚本，脚本运行时会一并安装 ppp, iptables等服务，
安装完成后可会往系统 `/usr/bin` 目录写入 l2tp 命令程序，以后可以使用
`l2tp` 命令执行添加、删除、修改用户的操作。安装 pptp 的脚本修改过，所以不
能单独使用，必须在运行完 l2tp 脚本后执行
