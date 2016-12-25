# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

# Used plugins
plugins=(git osx)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# bootstrap zsh
source $ZSH/oh-my-zsh.sh

# set language environment
export LANG=zh_CN.UTF-8

# set default editor
export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes.
alias ll="ls -lhGF"
alias la="ls -lahGF"
alias workstation="ssh lihuanpeng@192.168.199.190"
alias clonesite="wget -r -p -np -k"

# Diffrent system has diffrent configure
# for osx, debian, freebsd
if [ $(uname) = "Darwin" ]; then
    # for osx
    alias wwwroot="cd /Library/WebServer/Documents"
    alias cleanqq="rm -rf /Users/lihuanpeng/Library/Containers/com.tencent.qq/Data/Library/Application\ Support/QQ/2705313595/Image"
    # those two lines for CUDA environment
    export PATH=/Developer/NVIDIA/CUDA-8.0/bin${PATH:+:${PATH}}
    export LD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-8.0/lib${DYLD_LIBRARY_PATH:+:${DYLD_LIBRARY_PATH}}
elif [ $(uname) = "Linux" ]; then
    # for my machine on debian
    # those two lines for CUDA environment
    export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
fi

# end of file
