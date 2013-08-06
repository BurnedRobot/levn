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
#   2013/08/05  RobotFlying  Add update sources and google_chrome installation
#                            Add goagent
#
#############################################################################################

#! /bin/bash

#Check the release virsion of linux
function check_version()
{
    if  cat /proc/version | grep -q "Red Hat" ; then echo System is Red Hat!
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
    echo "Here will begin update software sources!"
    echo "Please input software sources[163 or sohu or bit]"
    read SOURCE

    if [ "$SYSTEM" == 'Ubuntu' ];
        then ./update_ubuntu_sources.sh $SOURCE
    elif [ "$SYSTEM" == 'Red Hat' ];
        then ./update_red_hat_sources.sh $SOURCE
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
    echo
}


function init()
{
    check_version

    AUTOINSTALL="./auto_install.sh"

    echo '#! /usr/bin/expect' > $AUTOINSTALL
    echo "spawn sudo $INSTALL " '[lindex $argv 0]' >> $AUTOINSTALL
    echo 'expect "password"' >> $AUTOINSTALL
    echo 'send "[lindex $argv 1]\r"' >> $AUTOINSTALL
    echo 'expect -re "\[./.\]"' >> $AUTOINSTALL
    echo 'send "y\r"' >> $AUTOINSTALL
    echo 'interact' >> $AUTOINSTALL
    chmod +x $AUTOINSTALL

    update_sources

    #store the password
    echo "Installation will begin!"
    echo -e "Please input password again:"
    stty -echo
    read PASSWD


    install_expect
}


function clean
{
    #make a clean
    rm $AUTOINSTALL
    clear
    echo Installation Complete!
    stty echo
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


#Here installs google-chrome
function install_google_chrome()
{
    echo Here are installing google-chrome
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    $AUTOINSTALL google-chrome-stable $PASSWD
}


#Here installs goagent 
function install_goagent()
{
    if [ "$SYSTEM" == 'Ubuntu' ];
        then $AUTOINSTALL python-dev $PASSWD
        $AUTOINSTALL libssl-dev $PASSWD
    elif [ "$SYSTEM" == 'Red Hat' ];
        then $AUTOINSTALL python-devel $PASSWD
        $AUTOINSTALL libssl-devel $PASSWD
    fi

    NOW_DIR=$PWD

    # install gevent
    curl -L -O https://github.com/python-greenlet/greenlet/archive/0.4.0.tar.gz && tar xvzpf 0.4.0.tar.gz && cd greenlet-0.4.0 && sudo python setup.py install

    curl -L -O https://github.com/downloads/surfly/gevent/gevent-1.0rc2.tar.gz && tar xvzpf gevent-1.0rc2.tar.gz && cd gevent-1.0rc2 && sudo python setup.py install

    #install openssl
    wget http://www.openssl.org/source/openssl-1.0.1c.tar.gz
    tar zxvf openssl-1.0.1c.tar.gz
    cd openssl-1.0.1c
#设定Openssl 安装，( --prefix )参数为欲安装之目录，也就是安装后的档案会出现在该目录下
    ./config --prefix=/root/openssl 
    make && make install

    #install pyopenssl
    wget http://pypi.python.org/packages/source/p/pyOpenSSL/pyOpenSSL-0.13.tar.gz && tar zxvf pyOpenSSL-0.13.tar.gz && cd pyOpenSSL-0.13 && sudo python setup.py install
    
    cd ~/Desktop
    git clone https://github.com/goagent/goagent.git

    cd $NOW_DIR
    sudo rm  -f 0.4.0.tar.gz gevent-1.0rc2.tar.gz -r gevent-1.0rc2 -r greenlet-0.4.0
    sudo rm -f openssl-1.0.1c.tar.gz pyOpenSSL-0.13.tar.gz -r openssl-1.0.1c -r pyOpenSSL-0.13
}


#main function
function main()
{

    init

    #common_installation array
    common_array=( "wget" "guake" "ctags" "git" "gcc" "curl" "mysql-server" "unrar" "g++" "cmake" )
    common_array_len=${#common_array[@]}

    install_vim
    install_ssh

    #Here installs wget,guake,ctags,git,gcc,curl,mysql,unrar,g++,cmake
    index=0
    while [ $common_array_len -ne $index ]
    do
        common_installation ${common_array[$index]}
        index=` expr $index + 1`
    done

    #Here installs google-chrome
    #install_google_chrome
   
    #Here installs goagent
    #install_goagent

    clean
}


function test()
{
    init
    install_goagent
    clean
}


main
#test
