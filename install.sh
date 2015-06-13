#! /bin/bash

INSTALLER="pacman -S --noconfirm"

LEVN_DIR=$(pwd)
CONFIG_FILES_DIR=$LEVN_DIR/config_files

# lua
LUA_INSTALLER='luarocks install'

# zsh
ZSH=~/.oh-my-zsh
OH_MY_ZSH=$LEVN_DIR/oh_my_zsh

# emacs
EMACS=~/.emacs.d
EMACS_CONFIG=$LEVN_DIR/emacs.d

# go
GOHOME=~/development/go
GOPATH=$GOHOME/gopath
GOPROJECT=$GOHOME/goproject

# copy $XDG_CONFIG_PATH
function copy_config_dir()
{
    echo "Here copying common configure files..."
    [ -d ~/.config ] && rm -r ~/.config
    cp -r $CONFIG_FILES_DIR/common_config/ ~/.config
}

function copy_tmux_config()
{
    echo "Here copying tmux configure files..."
    cp $CONFIG_FILES_DIR/tmux.conf ~/.tmux.conf
}

function copy_Xmodmap_config()
{
    echo "Here copying .Xmodmap file..."
    cp $CONFIG_FILES_DIR/Xmodmap ~/.Xmodmap
}

function copy_configuration_files()
{
    copy_config_dir
    copy_tmux_config
    copy_Xmodmap_config
}

# install lua libraries
function install_lua_libraries()
{
    sudo $LUA_INSTALLER luafilesystem
}

# install common applications
function install_common_applications()
{
    common_apps_list=(
        "awesome"     # desktop environment
        "alsa-utils"  # alsamixer &  amixer for sound
        "xscreensaver"
        "xorg-xrandr"
        "xorg-xmodmap"

        "zsh"
        "git"

        "emacs-nox"

        # font
        "ttf-inconsolata"
        
        "terminator"
        "tmux"
		"luarocks"

    )

    for i in ${common_apps_list[@]}
    do
        echo Here are installing \"$i\"...
        sudo $INSTALLER $i
    done
}

# configure oh_my_zsh
function configure_oh_my_zsh()
{
    [ -d $ZSH ] && rm -r $ZSH
    cp -r $OH_MY_ZSH $ZSH
    bash +x $OH_MY_ZSH/tools/install.sh
}

# configure emacs
function configure_emacs()
{
    [ -d $EMACS ] && rm -r $EMACS
    cp -r $EMACS_CONFIG $EMACS
}

# set up go environment
function setup_go()
{
    sudo $INSTALLER go
    mkdir -p $GOPATH/bin/ $GOPATH/src/ $GOPATH/pkg/ $GOPROJECT/bin/ $GOPROJECT/src/ $GOPROJECT/pkg/
    sed -i '/export GOPATH=/d' ~/.zshrc
    sed -i '/export PATH=$PATH:${GOPATH\/\/:\/\/bin:}\/bin/d' ~/.zshrc 
    echo "export GOPATH=$GOPATH:$GOPROJECT" >> ~/.zshrc 
    echo 'export PATH=$PATH:${GOPATH//://bin:}/bin' >> ~/.zshrc 
}

function install()
{
    install_common_applications
    install_lua_libraries
    copy_configuration_files
    configure_oh_my_zsh
    configure_emacs
    setup_go
}

install
