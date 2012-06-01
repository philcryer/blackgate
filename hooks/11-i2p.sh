#!/bin/sh
echo "I: Installing i2p"
#Docs: http://www.i2p2.de/debian#debian
#Instructions for Debian Lenny and newer
#The steps below should be performed with root access (i.e., switching user to root with "su" or by prefixing each command with "sudo").
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB2CC88B
#For Debian Oldstable (Lenny) and Stable (Squeeze): Add the following entries to /etc/apt/sources.list.d/i2p.list
#deb http://ppa.launchpad.net/i2p-maintainers/i2p/ubuntu natty main
echo "deb http://ppa.launchpad.net/i2p-maintainers/i2p/ubuntu natty main" > /etc/apt/sources.list.d/i2p.list
#deb-src http://ppa.launchpad.net/i2p-maintainers/i2p/ubuntu natty main 
#For Debian Testing (Wheezy) or Unstable (Sid), use the following: 
#deb http://ppa.launchpad.net/i2p-maintainers/i2p/ubuntu precise main 
#deb-src http://ppa.launchpad.net/i2p-maintainers/i2p/ubuntu precise main 
#Notify your package manager of the new PPA by entering
apt-get update
#This command will retrieve the latest list of software from every repository enabled on your system, including the I2P PPA added in step 1.
#You are now ready to install I2P! 
apt-get install --yes --force-yes -y i2p
#Post-install work
#Using these I2P packages the I2P router can be started in the following three ways:
#* "on demand" using the i2prouter script. Simply run "i2prouter start" from a command prompt. (Note: Do not use sudo or run it as root!)
#* "on demand" without the java service wrapper (needed on non-Linux/non-x86 systems) by running "i2prouter-nowrapper". (Note: Do not use sudo or run it as root!)
#* as a service that automatically runs when your system boots, even before logging in. The service can be enabled with "dpkg-reconfigure i2p" as root or using sudo. This is the recommended means of operation.
exit 0
