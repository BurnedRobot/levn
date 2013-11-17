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
#   2013/11/17  BurnedRobot  Fix a bug in set_bit_sources
#
#############################################################################################

#! /bin/bash

# write 163 sources into sources.list
function set_163_sources()
{
    echo 'deb http://mirrors.163.com/ubuntu/ saucy main restricted universe multiverse' > sources.list
    echo 'deb http://mirrors.163.com/ubuntu/ saucy-security main restricted universe multiverse' >> sources.list
    echo 'deb http://mirrors.163.com/ubuntu/ saucy-updates main restricted universe multiverse' >> sources.list
    echo 'deb http://mirrors.163.com/ubuntu/ saucy-proposed main restricted universe multiverse' >> sources.list
    echo 'deb http://mirrors.163.com/ubuntu/ saucy-backports main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirrors.163.com/ubuntu/ saucy main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirrors.163.com/ubuntu/ saucy-security main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirrors.163.com/ubuntu/ saucy-updates main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirrors.163.com/ubuntu/ saucy-proposed main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirrors.163.com/ubuntu/ saucy-backports main restricted universe multiverse' >> sources.list
}


# write sohu sources into sources.list
function set_sohu_sources()
{
    echo 'deb http://mirrors.sohu.com/ubuntu/ saucy main restricted universe multiverse' > sources.list
    echo 'deb http://mirrors.sohu.com/ubuntu/ saucy-security main restricted universe multiverse' >> sources.list
    echo 'deb http://mirrors.sohu.com/ubuntu/ saucy-updates main restricted universe multiverse' >> sources.list
    echo 'deb http://mirrors.sohu.com/ubuntu/ saucy-proposed main restricted universe multiverse' >> sources.list
    echo 'deb http://mirrors.sohu.com/ubuntu/ saucy-backports main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirrors.sohu.com/ubuntu/ saucy main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirrors.sohu.com/ubuntu/ saucy-security main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirrors.sohu.com/ubuntu/ saucy-updates main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirrors.sohu.com/ubuntu/ saucy-proposed main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirrors.sohu.com/ubuntu/ saucy-backports main restricted universe multiverse' >> sources.list
}


# write bit sources into sources.list
function set_bit_sources()
{
    echo 'deb http://mirror.bit.edu.cn/ubuntu/ saucy main restricted universe multiverse' > sources.list
    echo 'deb http://mirror.bit.edu.cn/ubuntu/ saucy-security main restricted universe multiverse' >> sources.list
    echo 'deb http://mirror.bit.edu.cn/ubuntu/ saucy-updates main restricted universe multiverse' >> sources.list
    echo 'deb http://mirror.bit.edu.cn/ubuntu/ saucy-backports main restricted universe multiverse' >> sources.list
    echo 'deb http://mirror.bit.edu.cn/ubuntu/ saucy-proposed main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit.edu.cn/ubuntu/ saucy main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit.edu.cn/ubuntu/ saucy-security main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit.edu.cn/ubuntu/ saucy-updates main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit.edu.cn/ubuntu/ saucy-backports main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit.edu.cn/ubuntu/ saucy-proposed main restricted universe multiverse' >> sources.list

    #ipv6-only
    echo 'deb http://mirror.bit6.edu.cn/ubuntu/ saucy main restricted universe multiverse' >> sources.list
    echo 'deb http://mirror.bit6.edu.cn/ubuntu/ saucy-security main restricted universe multiverse' >> sources.list
    echo 'deb http://mirror.bit6.edu.cn/ubuntu/ saucy-updates main restricted universe multiverse' >> sources.list
    echo 'deb http://mirror.bit6.edu.cn/ubuntu/ saucy-backports main restricted universe multiverse' >> sources.list
    echo 'deb http://mirror.bit6.edu.cn/ubuntu/ saucy-proposed main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit6.edu.cn/ubuntu/ saucy main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit6.edu.cn/ubuntu/ saucy-security main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit6.edu.cn/ubuntu/ saucy-updates main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit6.edu.cn/ubuntu/ saucy-backports main restricted universe multiverse' >> sources.list
    echo 'deb-src http://mirror.bit6.edu.cn/ubuntu/ saucy-proposed main restricted universe multiverse' >> sources.list
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
