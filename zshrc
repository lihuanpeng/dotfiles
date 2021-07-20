# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
if [ $(uname) = "Linux" ]; then
    plugins=(git debian)
fi

if [ $(uname) = "Darwin" ]; then
    plugins=(git osx)
fi

source ${ZSH}/oh-my-zsh.sh

# User configuration
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
MANPATH="/usr/local/man:${MANPATH}"

# global config
export LINODE="192.155.83.252"
export ALIYUN_MASTER_PEM_PATH="/Users/lihuanpeng/Public/aliyun_ssh_key_master.pem"
export ALIYUN_QIANMIAN="8.136.222.148"
export ALIYUN_LUJIAN="121.41.192.176"
export KZW_JUMP_SERVER="120.192.90.90"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# set language environment
# export LANG=zh_CN.UTF-8
# export LANGUAGE=zh_CN.UTF-8
# export LC_CTYPE=zh_CN.UTF-8
# export LC_ALL=zh_CN.UTF-8

# set default editor
export EDITOR="vim"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes.
alias ll="ls -lhGF"
alias la="ls -lahGF"
alias cp="cp -i"
alias clonesite="wget -c -r -np -k -L -p"
alias longssh="ssh -o ServerAliveInterval=60 -o ServerAliveCountMax=3"
alias mount_am3358="mount_nfs -o nolock 192.168.2.155:/home/lihuanpeng/am3358 ~/Workspace/others/am3358"

function ssh_aliyun_qianmian() {
    ssh-add -k ${ALIYUN_MASTER_PEM_PATH}
    longssh root@${ALIYUN_QIANMIAN}
}

function ssh_aliyun_lujian() {
    longssh root@${ALIYUN_LUJIAN}
}

# for macOS
if [ $(uname) = "Darwin" ]; then
    # 关闭 Homebrew 自动更新
    export HOMEBREW_NO_AUTO_UPDATE=true
    # 替换 brew bintray 镜像为阿里云源
    export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles

    # for diffrent arch config
    if [ $(arch) = "arm64" ]; then
        export ARCHFLAGS="-arch arm64"
        # homebrew installed apps on arm64
        export PATH="$PATH:/opt/homebrew/bin"
        # 命令行阻塞方式打开redis服务
        alias start_redis="/opt/homebrew/opt/redis/bin/redis-server /opt/homebrew/etc/redis.conf"
    else
        export ARCHFLAGS="-arch x86_64"
        # homebrew installed apps on x86_64
        export PATH="$PATH:/usr/local/sbin"
        # 命令行阻塞方式打开redis服务
        alias start_redis="redis-server /usr/local/etc/redis.conf"
    fi


    # proxy
    # export http_proxy=http://127.0.0.1:1087;
    # export https_proxy=http://127.0.0.1:1087;
    # export all_proxy=http://127.0.0.1:1087;

    # 打开本机apache服务器的默认root路径
    alias wwwroot="cd /Library/WebServer/Documents"
    # 解决微信开发者工具访问网络跨域问题
    alias open_wxdevtools="open -n /Applications/wechatwebdevtools.app/ --args --disable-web-security --user-data-dir --allow-running-insecure-content"

    # for Qt env
    export QTDIR="/Applications/Qt6/6.0.0/clang_64"
    export PATH="$PATH:$QTDIR/bin"
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$QTDIR/lib"

    # for jdk
    export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
fi

# Linux config
if [ $(uname) = "Linux" ]; then
    # for java
    # export JAVA_HOME="/usr/lib/jvm/default-java"
    # export JRE_HOME="${JAVA_HOME}/jre"
    # export CLASSPATH="${JAVA_HOME}/lib:${JRE_HOME}/lib"
    # export PATH="${JAVA_HOME}/bin:${PATH}"

    # alias
    # alias i3config="vim ~/.i3/config"

    # for hisi-linux- compiler
    #export PATH="/opt/hisi-linux/x86-arm/arm-hisiv500-linux/target/bin:${PATH}"

    # for android platform-tools
    # export PATH="${PATH}:/usr/local/Android/Sdk/platform-tools"
fi


#end of file

