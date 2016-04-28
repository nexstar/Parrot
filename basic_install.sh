#! /bin/bash
sudo apt-get update

echo "**********install tools**********"
sudo apt-get install vim git wget build-essential automake autoconf libtool yasm nasm phablet-tools -y

echo "**********install lib************"
sudo apt-get install libncurses5-dev libavcodec-dev libavformat-dev libswscale-dev libavutil-dev -y
sudo apt-get install libavahi-core-dev libavahi-client-dev libjson0-dev libjson0 mplayer -y

echo "******build fly and sync*********"
path=$HOME/fly/bebop
mkdir $path -p && cd $path

repo init -u https://github.com/Parrot-Developers/arsdk_manifests.git
repo sync

echo "******exec build.sh *********"
cd $path
./build.sh -p arsdk-native -t build-sdk -j

echo "#path and LD_LIBRARY_PATH" >> $HOME/.bashrc
echo "export LD_LIBRARY_PATH=$path/out/Unix-base/staging/usr/lib:\$LD_LIBRARY_PATH" >> $HOME/.bashrc

echo "******install finshed********"

cp ~/Parrot/Makefile ~/fly/bebop/packages/Samples/Unix/BebopDroneDecodeStream

echo "******CP Finished************"
