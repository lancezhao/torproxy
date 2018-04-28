#!/bin/sh

# Tor's TransPort
_trans_port="9040"

# your internal interface
_inc_if="eth1"

iptables -F
iptables -t nat -F

iptables -t nat -A PREROUTING -i $_inc_if -p udp --dport 53 -j REDIRECT --to-ports 5353
iptables -t nat -A PREROUTING -i $_inc_if -p udp --dport 5353 -j REDIRECT --to-ports 5353
iptables -t nat -A PREROUTING -i $_inc_if -p tcp --syn -j REDIRECT --to-ports $_trans_port

