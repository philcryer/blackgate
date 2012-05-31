#!/bin/bash

DATESTAMP=`date "+%Y%m%d.%N"`

echo "I: blackGATE build started ${DATESTAMP}"

echo "I: Checking for required software"

if which git &> /dev/null; then
	apt-get install -q=2 git
fi

if which lsb_release &> /dev/null; then
	CODENAME=`lsb_release -c -s`
else
	apt-get install -q=2 lsb-release
	CODENAME=`lsb_release -c -s`
fi

echo "I: Checking software sources"

if [ ! -f "/etc/apt/sources.list.d/live-build.list" ]; then
	echo "I: inserting live.debian.net into software sources"
 	echo "deb http://live.debian.net/ ${CODENAME}-snapshots main contrib non-free\ndeb-src http://live.debian.net/ ${CODENAME}-snapshots main contrib non-free" > /etc/apt/sources.list.d/live-build.list
	wget http://live.debian.net/debian/project/keys/archive-key.asc -O - | apt-key add -
	apt-get update; apt-get install live-build
fi

echo "I: Checking base directory"

if [ ! -d "blackgate-live-build" ]; then
	echo "I: Creating base directory"
	mkdir blackgate-live-build
	cd blackgate-live-build
	lb config --architecture i386 --archive-areas "main contrib non-free"
else 
	cd blackgate-live-build
	lb clean
fi

## copy in hooks

echo "I: Ready to build blackgate-${DATESTAMP}.iso"

#lb build

echo "I: Build completed, filename blackgate-${DATESTAMP}.iso"

exit 0
