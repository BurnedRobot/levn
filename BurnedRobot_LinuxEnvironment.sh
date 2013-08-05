#############################################################################################
#
#   This script is used to initialize my linux work environment automately. All the setting 
# is just for my need.
#
#   Version:    1.0
#   Author:     RobotFlying
#   Email:      robotflying777@gmail.com
#   Copyright:  RobotFlying
#
#   History:    
#   2013/06/03  RobotFlying  First release
#   2013/06/15  RobotFlying  Use 'expect' tool to implement AUTOINSTALLation
#   2013/07/12  RobotFlying  Add wget,git,goagent,curl
#   2013/07/14  RobotFlying  Use functions to simplify this code
#   2013/08/05  RobotFlying  Add chrome installation
#
#############################################################################################

#! /bin/bash

#Check the release virsion of linux
function check_version()
{
    if  cat /proc/version | grep -q "Red Hat" ; then
        echo System is Red Hat!
        INSTALL='yum install'
        SYSTEM='Red Hat'
    elif cat /proc/version | grep -q "Ubuntu" ; then
        echo System is Ubuntu!
        INSTALL='apt-get install'
        SYSTEM='Ubuntu'
    fi
}


#update software sources
function update_sources()
{
    echo -e "Please input sources name [163 or sohu or bit]:"
    read SOURCE_NAME

    if [ "$SYSTEM" == 'Ubuntu' ];
        then . update_ubuntu_sources.sh $SOURCE_NAME
    elif [ "$SYSTEM" == 'Red Hat' ]
        then . update_red_hat_sources.sh $SOURCE_NAME
    fi
}


#function common_installation 
#mostly app can be installed by this function
function common_installation()
{
    #Here installs $1
    echo Here are installing $1
    $AUTOINSTALL $1 $PASSWD
    echo
}


#Here installs expect
function install_expect()
{
    echo Here are installing expect...
    sudo $INSTALL expect
    echo '#! /usr/bin/expect' > $AUTOINSTALL
    echo "spawn sudo $INSTALL " '[lindex $argv 0]' >> $AUTOINSTALL
    echo 'expect "password"' >> $AUTOINSTALL
    echo 'send "[lindex $argv 1]\r"' >> $AUTOINSTALL
    echo 'expect -re "\[./.\]"' >> $AUTOINSTALL
    echo 'send "y\r"' >> $AUTOINSTALL
    echo 'interact' >> $AUTOINSTALL
    chmod +x $AUTOINSTALL
    echo
}


#Here installs my favourite editor - vim editor
function install_vim()
{
    $AUTOINSTALL vim $PASSWD
    echo set number > ~/.vimrc
    echo colorscheme desert >> ~/.vimrc
    echo set smartindent >> ~/.vimrc
    echo set tabstop=4 >> ~/.vimrc
    echo set shiftwidth=4 >> ~/.vimrc
    echo set expandtab >> ~/.vimrc
    echo hi Comment ctermfg=gray guifg=gray >> ~/.vimrc
    echo hi Constant ctermfg=red guifg=red >> ~/.vimrc
    echo hi PreProc ctermfg=green guifg=green >> ~/.vimrc
    echo hi Statement ctermfg=blue guifg=blue >> ~/.vimrc
    echo hi Type ctermfg=brown guifg=brown >> ~/.vimrc
    echo hi Identifier ctermfg=yellow guifg=yellow >> ~/.vimrc
    echo hi Special ctermfg=cyan guifg=cyan >> ~/.vimrc
    echo
}


#Here installs openssh
function install_ssh()
{
    echo Here are intalling ssh...
    if [ "$SYSTEM" == 'Red Hat' ];
        then $AUTOINSTALL openssh $PASSWD
    elif [ "$SYSTEM" == 'Ubuntu' ];
        then $AUTOINSTALL openssh-server $PASSWD
    fi
    echo
}


function install_google_chrome()
{
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    $AUTOINSTALL google-chrome-stable $PASSED
}


#main function
function main()
{
    check_version
    #auto install shell script
    AUTOINSTALL="./auto_install.sh"

    #common_installation array
    common_array=( "wget" "guake" "ctags" "git" "gcc" "curl" "mysql-server" "unrar" "g++" "cmake" )
    common_array_len=${#common_array[@]}

    #store the password
    echo -e "Please input password:"
    stty -echo
    read PASSWD

    update_sources
    
    install_expect
    install_vim
    install_ssh

    install_google_chrome

    #Here installs wget,guake,ctags,git,gcc,curl,mysql,unrar,g++,cmake
    index=0
    while [ $common_array_len -ne $index ]
    do
        common_installation ${common_array[$index]}
        index=` expr $index + 1`
    done

    #make a clean
    rm $AUTOINSTALL
    clear
    echo Installation Complete!
    stty echo
}

main
