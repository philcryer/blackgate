#!/bin/sh
echo "I: Installing Tor"
#Docs: https://www.torproject.org/docs/debian.html.en
echo "deb     http://deb.torproject.org/torproject.org ${CODENAME} main" > /etc/apt/sources.list.d/tor.list
#where you put the codename of your distribution (i.e. lenny, sid, maverick or whatever it is) in place of <DISTRIBUTION>.
#Then add the gpg key used to sign the packages by running the following commands at your command prompt:
gpg --keyserver keys.gnupg.net --recv 886DDD89
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
#Now refresh your sources, running the following command (as root) at your command prompt:
apt-get update
#If there are no errors you're good to continue.
#We provide a Debian package to help you keep our signing key current. It is recommended you use it. Install it using
apt-get install deb.torproject.org-keyring
#To finally install Tor just run:
apt-get install tor
exit 0
