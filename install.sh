#!/usr/bin/env bash

############################  SETUP PARAMETERS
app_name='dotfiles'
[ -z "$APP_PATH" ] && APP_PATH="$HOME/.dotfiles"
[ -z "$REPO_URI" ] && REPO_URI='https://github.com/huanpenglee/dotfiles.git'
[ -z "$REPO_BRANCH" ] && REPO_BRANCH='master'
debug_mode='0'
[ -z "$VUNDLE_URI" ] && VUNDLE_URI="http://github.com/VundleVim/Vundle.Vim"

############################  BASIC SETUP TOOLS
msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq '0' ]; then
        msg "\33[32m[✔]\33[0m ${1}${2}"
    fi
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

debug() {
    if [ "$debug_mode" -eq '1' ] && [ "$ret" -gt '1' ]; then
        msg "An error occurred in function \"${FUNCNAME[$i+1]}\" on line ${BASH_LINENO[$i+1]}, we're sorry for that."
    fi
}

program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local ret='1'; }
    # fail on non-zero return value
    if [ "$ret" -ne 0 ]; then
        return 1
    fi
    return 0
}

program_must_exist() {
    program_exists $1
    # throw error on non-zero return value
    if [ "$?" -ne 0 ]; then
        error "You must have '$1' installed to continue."
    fi
}

variable_set() {
    if [ -z "$1" ]; then
        error "You must have your HOME environmental variable set to continue."
    fi
}

lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
    ret="$?"
    debug
}

############################ SETUP FUNCTIONS

do_backup() {
    if [ -e "$1" ]; then
        today=`date +%Y%m%d_%s`
        [ -e "$1" ] && [ ! -L "$1" ] && mv -v "$1" "$1.$today";
        ret="$?"
        success "Your original $1 has been backed up."
        debug
    fi
}

sync_repo() {
    local repo_path="$1"
    local repo_uri="$2"
    local repo_branch="$3"
    local repo_name="$4"
    msg "Trying to update $repo_name"
    if [ ! -e "$repo_path" ]; then
        mkdir -p "$repo_path"
        git clone -b "$repo_branch" "$repo_uri" "$repo_path"
        ret="$?"
        success "Successfully cloned $repo_name."
    else
        cd "$repo_path" && git pull origin "$repo_branch"
        ret="$?"
        success "Successfully updated $repo_name"
    fi
    debug
}

setup_vundle() {
    local system_shell="$SHELL"
    export SHELL='/bin/sh'
    vim -u "$1" "+set nomore" "+PluginInstall!" "+PluginClean" "+qall"
    export SHELL="$system_shell"
    success "Now updating/installing plugins using Vundle"
    debug
}

############################ MAIN()
variable_set "$HOME"
program_must_exist "vim"
program_must_exist "git"
program_must_exist "tmux"
program_must_exist "zsh"

do_backup "$HOME/.vim"
do_backup "$HOME/.vimrc"
do_backup "$HOME/.vimrc.bundles"
do_backup "$HOME/.zhsrc"
do_backup "$HOME/.tmux.conf"
do_backup "$HOME/.gitconfig"

msg "\nCreate symlinks."
lnif "$APP_PATH/vim/vimrc"         "$HOME/.vimrc"
lnif "$APP_PATH/vim/vimrc.bundles" "$HOME/.vimrc.bundles"
lnif "$APP_PATH/zsh/zshrc"         "$HOME/.zshrc"
lnif "$APP_PATH/zsh/my.zsh-theme"  "$HOME/.oh-my-zsh/custom/my.zsh-theme"
lnif "$APP_PATH/tmux/tmux.conf"    "$HOME/.tmux.conf"
lnif "$APP_PATH/gitconfig"         "$HOME/.gitconfig"

sync_repo "$HOME/.vim/bundle/Vundle.vim" "$VUNDLE_URI" "master" "Vundle"

setup_vundle "$APP_PATH/vim/vimrc.bundles"

msg "\nThanks for installing $app_name."
