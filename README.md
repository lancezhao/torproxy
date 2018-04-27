Tor Proxy  
====

# Description
This is one proxy based on tor network, it utlized meek bridge so that China vistors can access certain type of site.

# Support
General Ubuntu and Debian release.

# Verified
Ubuntu 16.04.4 LTS

# Install
        git clone https://github.com/lancezhao/torproxy.git
        cd torproxy
        ./install.sh

# Usage
        Your tor proxy was now set up on current server:
        Socks 5 Proxy: tcp 1080
        Http Proxy: tcp 8080
        Assume you know how to use them

# Note
    Can support Raspbian, just need to change install.sh:
    > arc="x64" # or arm
    to
    > arc="arm"
