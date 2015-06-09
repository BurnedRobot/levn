#! /bin/bash

INSTALLER="pacman -S --noconfirm"
LUA_INSTALLER='luarocks install'
LEVN_DIR=$(pwd)
CONFIG_FILES_DIR=$LEVN_DIR/config_files

# copy $XDG_CONFIG_PATH
function copy_config_dir()
{
    echo "Here copying common configure files..."
    rm -r ~/.config
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

function install()
{
    install_common_applications
    install_lua_libraries
    copy_configuration_files
}

install
