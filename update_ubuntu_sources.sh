############################################################################
#
#   This file will update the ubuntu software sources
#   Version:    1.0
#   Author:     RobotFlying
#   Email:      robotflying777@gmail.com
#   Copyright:  RobotFlying
#
#   History:    
#   2013-08-05  RobotFlying First release
#
###########################################################################  

#! /bin/bash

function set_163_sources()
{
    echo 'deb http://mirrors.163.com/ubuntu/ raring main restricted universe multiverse' > sources.list
    echo 'deb http://mirrors.163.com/ubuntu/ raring-security main restricted universe multiverse' >> sources.list
    echo 'deb http://mirrors.163.com/ubuntu/ raring-updates main restricted universe multiverse' >> sources.list
    echo 'deb http://mirrors.163.com/ubuntu/ raring-proposed main restricted universe multiverse' >> sources.list
    echo 'deb http://mirrors.163.com/ubuntu/ raring-backports main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirrors.163.com/ubuntu/ raring main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirrors.163.com/ubuntu/ raring-security main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirrors.163.com/ubuntu/ raring-updates main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirrors.163.com/ubuntu/ raring-proposed main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirrors.163.com/ubuntu/ raring-backports main restricted universe multiverse' >> sources.list
}


function set_sohu_sources()
{
    echo 'deb http://mirrors.sohu.com/ubuntu/ raring main restricted universe multiverse' > sources.list
    echo 'deb http://mirrors.sohu.com/ubuntu/ raring-security main restricted universe multiverse' >> sources.list
    echo 'deb http://mirrors.sohu.com/ubuntu/ raring-updates main restricted universe multiverse' >> sources.list
    echo 'deb http://mirrors.sohu.com/ubuntu/ raring-proposed main restricted universe multiverse' >> sources.list
    echo 'deb http://mirrors.sohu.com/ubuntu/ raring-backports main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirrors.sohu.com/ubuntu/ raring main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirrors.sohu.com/ubuntu/ raring-security main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirrors.sohu.com/ubuntu/ raring-updates main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirrors.sohu.com/ubuntu/ raring-proposed main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirrors.sohu.com/ubuntu/ raring-backports main restricted universe multiverse' >> sources.list
}


function set_bit_sources()
{
    echo 'deb http://mirror.bit.edu.cn/ubuntu/ raring main restricted universe multiverse' > sources.list
    echo 'deb http://mirror.bit.edu.cn/ubuntu/ raring-security main restricted universe multiverse' >> sources.list
    echo 'deb http://mirror.bit.edu.cn/ubuntu/ raring-updates main restricted universe multiverse' >> sources.list
    echo 'deb http://mirror.bit.edu.cn/ubuntu/ raring-backports main restricted universe multiverse' >> sources.list
    echo 'deb http://mirror.bit.edu.cn/ubuntu/ raring-proposed main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit.edu.cn/ubuntu/ raring main restricted universe multiversm' >> sources.list
    echo 'deb-src http://mirror.bit.edu.cn/ubuntu/ raring-security main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit.edu.cn/ubuntu/ raring-updates main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit.edu.cn/ubuntu/ raring-backports main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit.edu.cn/ubuntu/ raring-proposed main restricted universe multiverse' >> sources.list
    
    #ipv6-only sources
    echo 'deb http://mirror.bit6.edu.cn/ubuntu/ raring main restricted universe multiverse' >> sources.list
    echo 'deb http://mirror.bit6.edu.cn/ubuntu/ raring-security main restricted universe multiverse' >> sources.list
    echo 'deb http://mirror.bit6.edu.cn/ubuntu/ raring-updates main restricted universe multiverse' >> sources.list
    echo 'deb http://mirror.bit6.edu.cn/ubuntu/ raring-backports main restricted universe multiverse' >> sources.list
    echo 'deb http://mirror.bit6.edu.cn/ubuntu/ raring-proposed main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit6.edu.cn/ubuntu/ raring main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit6.edu.cn/ubuntu/ raring-security main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit6.edu.cn/ubuntu/ raring-updates main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit6.edu.cn/ubuntu/ raring-backports main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit6.edu.cn/ubuntu/ raring-proposed main restricted universe multiverse' >> sources.list

}


function set_google_source()
{
    echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' > google.list
    sudo rm google.list /etc/apt/sources.list.d/
}


#main function 
function main()
{
    case $1 in
        "163")
            set_163_sources
            ;;
        "sohu")
            set_sohu_sources
            ;;
        "bit")
            set_bit_sources
            ;;
    esac

    sudo mv sources.list /etc/apt

    set_google_source
    sudo apt-get update
}


main $1
