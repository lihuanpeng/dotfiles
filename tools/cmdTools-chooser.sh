#!/usr/bin/env bash
# 辅助函数
msg() {
    printf '%b\n' "$1" >&2
}

success() {
    msg "\33[32m[✔]\33[0m ${1}${2}"
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

# 脚本全局常量
CLT_PATH="/Library/Developer/CommandLineTools"
CLT7_PATH="${CLT_PATH}_7.x"
CLT8_PATH="${CLT_PATH}_8.x"

# 实际操作部分
if [ $# = 1 ]; then
    if [ $1 = "-7" ]; then
        rm ${CLT_PATH}
        ln -sf ${CLT7_PATH} ${CLT_PATH}
        xcode-select -s ${CLT_PATH}
        xcode-select -p
        success "已将 CommandLineTools 切换为 7.1 版本"
    elif [ $1 = "-8" ]; then
        rm ${CLT_PATH}
        ln -sf ${CLT8_PATH} ${CLT_PATH}
        xcode-select -r
        xcode-select -p
        success "已重置 Xcode-select 默认设置"
    else
        error "参数不正确，请使用 -7 | -8"
    fi
else
    error "参数不正确，请使用 -7 | -8"
fi

