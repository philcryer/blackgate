echo "I: installing nginx"
apt-get install --yes --force-yes -y nginx
update-rc.d -f nginx defaults
