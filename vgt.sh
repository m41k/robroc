#!/bin/bash

wget www.vpngate.net/api/iphone/

cat index.html | while read LINHA; do

#DOP=`echo $LINHA | cut -d "," -f15`
#echo $DOP | base64 -d 2> /dev/null
HOST=`echo $LINHA | cut -d "," -f1`
echo $LINHA | cut -d "," -f15 | base64 -d > teste64 2> /dev/null
openvpn --config teste64 &
sleep 10
ifconfig | grep tun
 if [ $? -eq 0 ]; then
 echo $HOST
 echo "=========IP=========="
 wget -t 1 --timeout=10 -qO - 54.233.169.1/cgi-bin/vip.sh
 echo "====================="
 sleep 10
 fi
killall openvpn
done
