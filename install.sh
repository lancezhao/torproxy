#!/bin/bash

arc="x64" # or arm
plug_path="/usr/local/bin"

# Install tor and privoxy for Debian and Ubuntu
apt-get update
apt-get install -yqq tor privoxy

# Copy meek client to plug directory
cp ./bin/$arc/meek-client $plug_path/meek-client
chown debian-tor.debian-tor $plug_path/meek-client
chmod 755 $plug_path/meek-client

# Disable apparmor for tor, or it can not use meek-client
ln -s /etc/apparmor.d/system_tor /etc/apparmor.d/disable/
apparmor_parser -R /etc/apparmor.d/system_tor
/etc/init.d/apparmor restart

# Start tor and privoxy, enable them autostart
/etc/init.d/tor start
/etc/init.d/privoxy start

/usr/sbin/update-rc.d tor defaults
/usr/sbin/update-rc.d privoxy defaults

chown -R debian-tor.debian-tor /var/run/tor
chmod -R 700 /var/run/tor

