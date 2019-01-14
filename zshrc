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
plugins=(git osx)

source ${ZSH}/oh-my-zsh.sh

# User configuration
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
MANPATH="/usr/local/man:${MANPATH}"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# set language environment
# export LANG=zh_CN.UTF-8
# export LANGUAGE=zh_CN.UTF-8
# export LC_CTYPE=zh_CN.UTF-8
# export LC_ALL=zh_CN.UTF-8

# set default editor
export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes.
alias ll="ls -lhGF"
alias la="ls -lahGF"
alias cp="cp -i"
alias clonesite="wget -c -r -np -k -L -p"
alias conda_init="source ~/.dotfiles/macOS/conda_init"

# proxy
export http_proxy=http://127.0.0.1:1087;
export https_proxy=http://127.0.0.1:1087;

export LINODE="192.155.83.252"

# Diffrent system has diffrent configure
# for macbook-pro with osx
if [ $(uname) = "Darwin" ]; then
    alias wwwroot="cd /Library/WebServer/Documents"

    # for mysql
    export PATH="/usr/local/mysql/bin:${PATH}"

    # those two lines for CUDA environment
    CUDA_PATH="/Developer/NVIDIA/CUDA-10.0"
    export PATH="${CUDA_PATH}/bin:${PATH}"
    export LD_LIBRARY_PATH="${CUDA_PATH}/lib:${LD_LIBRARY_PATH}"

    # for Qt env
    export QTDIR="/Applications/Qt5.12.0/5.12.0/clang_64"
    export PATH="${QTDIR}/bin:${PATH}"
    export LD_LIBRARY_PATH="${QTDIR}/lib:${LD_LIBRARY_PATH}"

    # for php composer
    export PATH="/Users/lihuanpeng/.composer/vendor/bin:${PATH}"
fi

if [ $(uname) = "Linux" ]; then
    # Qt env
    export QT_SELECT="Qt5.12.0"
    export QTDIR="/opt/Qt5.12.0/5.12.0/gcc_64"
    export PATH="${QTDIR}/bin:${PATH}"
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${QTDIR}/lib"

    # for java
    export JAVA_HOME="/usr/lib/jvm/default-java"
    export JRE_HOME="${JAVA_HOME}/jre"
    export CLASSPATH="${JAVA_HOME}/lib:${JRE_HOME}/lib"
    export PATH="${JAVA_HOME}/bin:${PATH}"

    # alias
    alias i3config="vim ~/.i3/config"
    # those two lines for CUDA environment
    CUDA_PATH="/usr/local/cuda"
    export PATH="${PATH}:${CUDA_PATH}/bin"
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${CUDA_PATH}/lib64"
fi

# export environments
export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo/'

#end of file

