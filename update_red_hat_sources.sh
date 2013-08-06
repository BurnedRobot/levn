#############################################################################################
#
#   This script is used to initialize my linux work environment automately. All the setting 
# is just for my need.
#   This file is used to update fedora software sources
#
#   Version:    1.0
#   Author:     RobotFlying
#   Email:      robotflying777@gmail.com
#   Copyright:  RobotFlying
#
#   History:    
#   2013/08/06  RobotFlying  First release
#
#############################################################################################

#! /bin/bash

# write 163 sources into fedora.repo
function set_163_sources()
{
#fedora-163.repo中的内容：
    echo '[fedora]' > fedora-163.repo
    echo 'name=Fedora $releasever – $basearch – 163.com' >> fedora-163.repo
    echo 'failovermethod=priority' >> fedora-163.repo
    echo 'baseurl=http://mirrors.163.com/fedora/releases/$releasever/Everything/$basearch/os/' >> fedora-163.repo
    echo 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch' >> fedora-163.repo
    echo 'enabled=1' >> fedora-163.repo
    echo 'metadata_expire=7d' >> fedora-163.repo
    echo 'gpgcheck=1' >> fedora-163.repo
    echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch' >> fedora-163.repo
    echo '[fedora-debuginfo]' >> fedora-163.repo
    echo 'name=Fedora $releasever – $basearch – Debug – 163.com' >> fedora-163.repo
    echo 'failovermethod=priority' >> fedora-163.repo
    echo 'baseurl=http://mirrors.163.com/fedora/releases/$releasever/Everything/$basearch/debug/' >> fedora-163.repo
    echo 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=fedora-debug-$releasever&arch=$basearch' >> fedora-163.repo
    echo 'enabled=0' >> fedora-163.repo
    echo 'metadata_expire=7d' >> fedora-163.repo
    echo 'gpgcheck=1' >> fedora-163.repo
    echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch' >> fedora-163.repo
    echo '[fedora-source]' >> fedora-163.repo
    echo 'name=Fedora $releasever – Source – 163.com' >> fedora-163.repo
    echo 'failovermethod=priority' >> fedora-163.repo
    echo 'baseurl=http://mirrors.163.com/fedora/releases/$releasever/Everything/source/SRPMS/' >> fedora-163.repo
    echo 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=fedora-source-$releasever&arch=$basearch' >> fedora-163.repo
    echo 'enabled=0' >> fedora-163.repo
    echo 'metadata_expire=7d' >> fedora-163.repo
    echo 'gpgcheck=1' >> fedora-163.repo
    echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch' >> fedora-163.repo
    
#fedora-updates-163.repo中的内容：
    echo '[updates]' > fedora-updates-163.repo
    echo 'name=Fedora $releasever – $basearch – Updates – 163.com' >> fedora-updates-163.repo
    echo 'failovermethod=priority' >> fedora-updates-163.repo
    echo 'baseurl=http://mirrors.163.com/fedora/updates/$releasever/$basearch/' >> fedora-updates-163.repo
    echo 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=updates-released-f$releasever&arch=$basearch' >> fedora-updates-163.repo
    echo 'enabled=1' >> fedora-updates-163.repo
    echo 'gpgcheck=1' >> fedora-updates-163.repo
    echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch' >> fedora-updates-163.repo
    echo '[updates-debuginfo]' >> fedora-updates-163.repo
    echo 'name=Fedora $releasever – $basearch – Updates – Debug – 163.com' >> fedora-updates-163.repo
    echo 'failovermethod=priority' >> fedora-updates-163.repo
    echo 'baseurl=http://mirrors.163.com/fedora/updates/$releasever/$basearch/debug/' >> fedora-updates-163.repo
    echo 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=updates-released-debug-f$releasever&arch=$basearch' >> fedora-updates-163.repo
    echo 'enabled=0' >> fedora-updates-163.repo
    echo 'gpgcheck=1' >> fedora-updates-163.repo
    echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch' >> fedora-updates-163.repo
    echo '[updates-source]' >> fedora-updates-163.repo
    echo 'name=Fedora $releasever – Updates Source – 163.com' >> fedora-updates-163.repo
    echo 'failovermethod=priority' >> fedora-updates-163.repo
    echo 'baseurl=http://mirrors.163.com/fedora/updates/$releasever/SRPMS/' >> fedora-updates-163.repo
    echo 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=updates-released-source-f$releasever&arch=$basearch' >> fedora-updates-163.repo
    echo 'enabled=0' >> fedora-updates-163.repo
    echo 'gpgcheck=1' >> fedora-updates-163.repo
    echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch' >> fedora-updates-163.repo
}


function set_sohu_sources()
{
    echo '[fedora-mirrors.sohu.com]' > fedora-sohu.repo
    echo 'name=Fedora $releasever - $basearch - sohu.com' >> fedora-sohu.repo
    echo 'failovermethod=priority' >> fedora-sohu.repo
    echo 'baseurl=http://mirrors.sohu.com/fedora/releases/$releasever/Everything/$basearch/os/' >> fedora-sohu.repo
    echo 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch' >> fedora-sohu.repo
    echo 'enabled=1' >> fedora-sohu.repo
    echo 'metadata_expire=7d' >> fedora-sohu.repo
    echo 'gpgcheck=1' >> fedora-sohu.repo
    echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch' >> fedora-sohu.repo
    echo '[fedora-debuginfo-mirrors.sohu.com]' >> fedora-sohu.repo
    echo 'name=Fedora $releasever - $basearch - Debug - sohu.com' >> fedora-sohu.repo
    echo 'failovermethod=priority' >> fedora-sohu.repo
    echo 'baseurl=http://mirrors.sohu.com/fedora/releases/$releasever/Everything/$basearch/debug/' >> fedora-sohu.repo
    echo 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=fedora-debug-$releasever&arch=$basearch' >> fedora-sohu.repo
    echo 'enabled=0' >> fedora-sohu.repo
    echo 'metadata_expire=7d' >> fedora-sohu.repo
    echo 'gpgcheck=1' >> fedora-sohu.repo
    echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch' >> fedora-sohu.repo
    echo '[fedora-source-mirrors.sohu.com]' >> fedora-sohu.repo
    echo 'name=Fedora $releasever - Source - sohu.com' >> fedora-sohu.repo
    echo 'failovermethod=priority' >> fedora-sohu.repo
    echo 'baseurl=http://mirrors.sohu.com/fedora/releases/$releasever/Everything/source/SRPMS/' >> fedora-sohu.repo
    echo 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=fedora-source-$releasever&arch=$basearch' >> fedora-sohu.repo
    echo 'enabled=0' >> fedora-sohu.repo
    echo 'metadata_expire=7d' >> fedora-sohu.repo
    echo 'gpgcheck=1' >> fedora-sohu.repo
    echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch' >> fedora-sohu.repo

    echo '[updates]' > fedora-sohu-updates.repo
    echo 'name=Fedora $releasever - $basearch - Updates - sohu.com' >> fedora-sohu-updates.repo
    echo 'failovermethod=priority' >> fedora-sohu-updates.repo
    echo 'baseurl=http://mirrors.sohu.com/fedora/updates/$releasever/$basearch/' >> fedora-sohu-updates.repo
    echo 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=updates-released-f$releasever&arch=$basearch' >> fedora-sohu-updates.repo
    echo 'enabled=1' >> fedora-sohu-updates.repo
    echo 'gpgcheck=1' >> fedora-sohu-updates.repo
    echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch' >> fedora-sohu-updates.repo
    echo '[updates-debuginfo]' >> fedora-sohu-updates.repo
    echo 'name=Fedora $releasever - $basearch - Updates - Debug - sohu.com' >> fedora-sohu-updates.repo
    echo 'failovermethod=priority' >> fedora-sohu-updates.repo
    echo 'baseurl=http://mirrors.sohu.com/fedora/updates/$releasever/$basearch/debug/' >> fedora-sohu-updates.repo
    echo 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=updates-released-debug-f$releasever&arch=$basearch' >> fedora-sohu-updates.repo
    echo 'enabled=0' >> fedora-sohu-updates.repo
    echo 'gpgcheck=1' >> fedora-sohu-updates.repo
    echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch' >> fedora-sohu-updates.repo
    echo '[updates-source]' >> fedora-sohu-updates.repo
    echo 'name=Fedora $releasever - Updates Source - sohu.com' >> fedora-sohu-updates.repo
    echo 'failovermethod=priority' >> fedora-sohu-updates.repo
    echo 'baseurl=http://mirrors.sohu.com/fedora/updates/$releasever/SRPMS/' >> fedora-sohu-updates.repo
    echo 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=updates-released-source-f$releasever&arch=$basearch' >> fedora-sohu-updates.repo
    echo 'enabled=0' >> fedora-sohu-updates.repo
    echo 'gpgcheck=1' >> fedora-sohu-updates.repo
    echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch' >> fedora-sohu-updates.repo

}


function set_bit_sources()
{

    echo '[Release-mirror.bit.edu.cn]' > fedora-bit.repo
    echo 'name=Fedora 19 – x86_64' >> fedora-bit.repo
    echo 'baseurl=http://mirror.bitunion.edu.cn/fedora/linux/releases/19/Fedora/x86_64/os/' >> fedora-bit.repo
    echo 'enabled=1' >> fedora-bit.repo
    echo 'gpgcheck=1' >> fedora-bit.repo
    echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora' >> fedora-bit.repo
    echo ' ' >> fedora-bit.repo
    echo '[Everything-mirror.bit.edu.cn]' >> fedora-bit.repo
    echo 'name=Everything 19 – x86_64' >> fedora-bit.repo
    echo 'baseurl=http://mirror.bitunion.edu.cn/fedora/linux/releases/19/Everything/x86_64/os/' >> fedora-bit.repo
    echo 'enabled=1' >> fedora-bit.repo
    echo 'gpgcheck=1' >> fedora-bit.repo
    echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora' >> fedora-bit.repo
     echo ' ' >> fedora-bit.repo
    echo '[updates-mirror.bit.edu.cn]' >> fedora-bit.repo
    echo 'name=Fedora updates' >> fedora-bit.repo
    echo 'baseurl=http://mirror.bitunion.edu.cn/fedora/linux/updates/19/x86_64/' >> fedora-bit.repo
    echo 'enabled=1' >> fedora-bit.repo
    echo 'gpgcheck=0' >> fedora-bit.repo
}


function set_google_sources()
{
    echo '[google-chrome]' > google.repo
    echo 'name=google-chrome - 64-bit' >> google.repo
    echo 'baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64' >> google.repo
    echo 'enabled=1' >> google.repo
    echo 'gpgcheck=1' >> google.repo
    echo 'gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub' >> google.repo
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

    CURRENT_DIR=$PWD
    cd /etc/yum.repos.d
    sudo rm -f *.repo

    cd $CURRENT_DIR
    #echo $CURRENT_DIR
    sudo mv ./*.repo /etc/yum.repos.d
    sudo yum makecache
}

main $1
