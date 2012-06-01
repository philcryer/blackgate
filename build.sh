#!/bin/bash

DATESTAMP=`date "+%Y%m%d.%N"`
CODENAME="squeeze"

echo "P: blackGATE build started ${DATESTAMP}"

#echo "P: Checking for required software"
#if which git &> /dev/null; then
#	apt-get install -q=2 git
#fi
#if which lsb_release &> /dev/null; then
#	CODENAME=`lsb_release -c -s`
#else
#	apt-get install -q=2 lsb-release
#	CODENAME=`lsb_release -c -s`
#fi

echo "P: Checking software sources"
if [ ! -f "/etc/apt/sources.list.d/live-build.list" ]; then
	echo "I: Installing live.debian.net software source"
 	echo "deb http://live.debian.net/ ${CODENAME}-snapshots main contrib non-free" > /etc/apt/sources.list.d/live-build.list
	wget http://live.debian.net/debian/project/keys/archive-key.asc -O - | apt-key add -
	apt-get update; apt-get install -y --yes --assume-yes live-build
fi

echo "P: Checking base directory"
if [ ! -d "/tmp/blackgate-live-build" ]; then
	echo "I: Installing base directory"
	mkdir /tmp/blackgate-live-build
fi

echo "P: Cleaning chroot environment"
cd /tmp/blackgate-live-build; lb clean

echo "P: Setting build configs"
lb config --architecture i386 --archive-areas "main contrib non-free"; cd -

echo "I: Installing hook files"
cp ../hooks/*.sh config/chroot_local-hooks/
chmod 755 config/chroot_local-hooks/*.sh

echo "I: Installing config files"
#cp ../config/ config

echo "P: Starting build of blackgate-${DATESTAMP}.iso"
cd /tmp/blackgate-live-build; time lb build

mv /tmp/blackgate-live-build/binary-hybrid.iso /tmp/blackgate-live-build/blackgate-${DATESTAMP}.iso
md5sum /tmp/blackgate-live-build/blackgate-${DATESTAMP}.iso > /tmp/blackgate-live-build/blackgate-${DATESTAMP}.md5

echo "I: Build completed, filename blackgate-${DATESTAMP}.iso"

exit 0
