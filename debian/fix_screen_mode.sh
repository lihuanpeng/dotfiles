#!/bin/bash

#
# 修正 vmware 虚拟机中的debian系统中没有2560x1440分辨率的问题
# 使用方法：使用root权限执行此脚本
# 这只是当前环境生效，重启后新的显示器配置会丢失，也就是每次开机都要执行一次脚本。
#

# 创建新的显示模式
xrandr --newmode "2560x1440"  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync

# 添加新的显示模式
xrandr --addmode Virtual1 "2560x1440"

# 给默认显示器应用新的显示模式
xrandr --output Virtual1 --mode "2560x1440"

