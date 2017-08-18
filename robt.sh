#!/bin/bash

while [ 1 ]; do
 /etc/init.d/tor restart
 midori &
 midori -e identify-as=MIDORI_IDENT_CUSTOM -e user-agent=teste -e Go 54.233.169.1/cgi-bin/log.sh
 sleep 5
 killall midori
 done
