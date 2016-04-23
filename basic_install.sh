#! /bin/bash
sudo apt-get update
echo "**********install tools**********"
sudo apt-get install vim git wget automake autoconf libtool yasm nasm phablet-tools repo -y
echo "**********install lib************"
sudo apt-get install libncurses5-dev libavcodec-dev libavformat-dev libswscale-dev libavutil-dev -y
sudo apt-get install libavahi-core-dev libavahi-client-dev -y
echo "******build fly and sync*********"
mkdir ~/fly2/bebop -p && cd ~/fly2/bebop
repo init -u https://github.com/Parrot-Developers/arsdk_manifests.git
repo sync


export LD_LIBRARY_PATH=~/fly2/bebop/out/Unix-base/staging/usr/lib:$LD_LIBRARY_PATH
echo $LD_LIBRARY_PATH



