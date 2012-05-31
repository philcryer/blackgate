#!/bin/sh
echo "HOOK: ssh server"
# install
echo "I: installing openssh-server"
apt-get install --yes --force-yes -y openssh-server
# disable root login
echo "I: disabling root login in sshd_config"
sed -i "s/PermitRootLogin yes/PermitRootLogin no/" /etc/ssh/sshd_config
# don't start ssh on boot if you don't need it
update-rc.d -f ssh remove
