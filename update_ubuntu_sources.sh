#############################################################################################
#
#   This script is used to initialize my linux work environment automately. All the setting 
# is just for my need.
#   This file is used to update ubuntu software sources
#
#   Version:    1.0
#   Author:     BurnedRobot
#   Email:      robotflying777@gmail.com
#   Copyright:  BurnedRobot
#
#   History:    
#   2013/08/05  BurnedRobot  First release
#
#############################################################################################

#! /bin/bash

# write 163 sources into sources.list
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


# write sohu sources into sources.list
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


# write bit sources into sources.list
function set_bit_sources()
{
    echo 'deb http://mirror.bit.edu.cn/ubuntu/ raring main restricted universe multiverse' >> sources.list
    echo 'deb http://mirror.bit.edu.cn/ubuntu/ raring-security main restricted universe multiverse' >> sources.list
    echo 'deb http://mirror.bit.edu.cn/ubuntu/ raring-updates main restricted universe multiverse' >> sources.list
    echo 'deb http://mirror.bit.edu.cn/ubuntu/ raring-backports main restricted universe multiverse' >> sources.list
    echo 'deb http://mirror.bit.edu.cn/ubuntu/ raring-proposed main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit.edu.cn/ubuntu/ raring main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit.edu.cn/ubuntu/ raring-security main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit.edu.cn/ubuntu/ raring-updates main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit.edu.cn/ubuntu/ raring-backports main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit.edu.cn/ubuntu/ raring-proposed main restricted universe multiverse' >> sources.list

    #ipv6-only
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


# init google source
function set_google_sources()
{
    echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' > google.list
    sudo mv google.list /etc/apt/sources.list.d/
}


function main()
{
    case $1 in
        "163")
            set_163_sources;;
        "sohu")
            set_sohu_sources;;
        "bit")
            set_bit_sources;;
    esac

    set_google_sources

    sudo mv sources.list /etc/apt/
    sudo apt-get update
}


main $1
