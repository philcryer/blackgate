#!/bin/sh
echo "I: Installing openssh-server"
apt-get install --yes --force-yes -y openssh-server
# disable root login
echo "I: Disabling root login in sshd_config"
sed -i "s/PermitRootLogin yes/PermitRootLogin no/" /etc/ssh/sshd_config
# don't start ssh on boot, we don't need it
echo "I: Disabling openssh-server from starting on boot"
update-rc.d -f ssh remove
exit 0
