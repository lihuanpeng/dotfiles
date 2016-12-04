# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

plugins=(git osx)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
#export LANG=zh_CN.UTF-8

export EDITOR='vim'

# Compilation flags
#export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias ll="ls -lhGF"
alias la="ls -lahGF"
alias mlstation="ssh lihuanpeng@192.168.199.190"
alias clonesite="wget -r -p -np -k"

# Diffrent system has diffrent configure
# for osx, debian, freebsd
if [ $(uname) = "Darwin" ]; then
    # for osx
    alias wwwroot="cd /Library/WebServer/Documents"
    alias brewlist="brew list > /tmp/brewlist.`date +%y%m%d_%s`"
    alias cleanqq="rm -rf /Users/lihuanpeng/Library/Containers/com.tencent.qq/Data/Library/Application\ Support/QQ/2705313595/Image"
    export PATH=/Developer/NVIDIA/CUDA-8.0/bin${PATH:+:${PATH}}
    export LD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-8.0/lib${DYLD_LIBRARY_PATH:+:${DYLD_LIBRARY_PATH}}
elif [ $(uname) = "Linux" ]; then
    export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
fi


function mkcd(){
    mkdir -p "$1"
    cd "$1"
}
# safe delete files
if [ ! -d "$HOME/.Trash" ]; then
    mkdir -p "$HOME/.Trash"
fi
function saferm(){
    mv -v "$1" "$HOME/.Trash/"
}
alias cleantrash="rm -rf ~/.Trash/*"

# end of file
