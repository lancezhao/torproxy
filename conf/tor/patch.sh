#!/bin/bash

plug_path="/usr/local/bin"

cp /lancez/apps/torproxy/source/meek-client $plug_path/meek-client
chown debian-tor.debian-tor $plug_path/meek-client
chmod 755 $plug_path/meek-client

ln -s /etc/apparmor.d/system_tor /etc/apparmor.d/disable/
apparmor_parser -R /etc/apparmor.d/system_tor

chown -R debian-tor.debian-tor /var/run/tor
chmod -R 700 /var/run/tor

