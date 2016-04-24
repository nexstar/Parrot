#! /bin/bash
sudo apt-get update
echo "**********install tools**********"
sudo apt-get install open-server vim git wget automake build-essential  autoconf libtool yasm nasm phablet-tools repo -y
echo "**********install lib************"
sudo apt-get install libncurses5-dev libavcodec-dev libavformat-dev libswscale-dev libavutil-dev -y
sudo apt-get install libavahi-core-dev libavahi-client-dev libjson0-dev libjson0 mplayer -y
echo "******build fly and sync*********"
mkdir ~/fly5/bebop -p && cd ~/fly5/bebop
repo init -u https://github.com/Parrot-Developers/arsdk_manifests.git
repo sync

export LD_LIBRARY_PATH=~/fly5/bebop/out/Unix-base/staging/usr/lib:$LD_LIBRARY_PATH
		      
echo $LD_LIBRARY_PATH

cd ~/fly5/bebop
./build.sh -p arsdk-native -t build-sdk -j

cp ~/Parrot/Makefile ~/fly5/bebop/packages/Samples/Unix/BebopDroneDecodeStream
cd ~/fly5/bebop/packages/Samples/Unix/BebopDroneDecodeStream
make 
make run



