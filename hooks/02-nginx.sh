#!/bin/sh
echo "I: installing nginx"
apt-get install --yes --force-yes -y nginx
echo "I: Enabling nginx to start on boot"
update-rc.d -f nginx defaults
exit 0
