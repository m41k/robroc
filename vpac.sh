#!/bin/bash
#TESTAR

function pac() 
{
 while [ 1 ]; do
   sysctl -w vm.drop_caches=3
   TARGET="ojas17.jpg"
   NUMPAC=200
   DCAPTU="capture"
   INTERF="tun0"
   tcpdump -c $NUMPAC -i $INTERF -w $DCAPTU &
   luakit -n luw.servehttp.com
   sleep 15
  if tcpdump -x -X -r $DCAPTU | grep $TARGET; then
   xdotool mousemove 550 600 click 1&
   sleep 35
   killall luakit
   rm $DCAPTU
  else
   killall luakit
   rm $DCAPTU
  fi
   sleep 5
 done
}

wget www.vpngate.net/api/iphone/

cat index.html | while read LINHA; do

HOST=`echo $LINHA | cut -d "," -f1`
echo $LINHA | cut -d "," -f15 | base64 -d > teste64 2> /dev/null
openvpn --config teste64 &
sleep 20
if  ifconfig | grep tun; then
  pac
 fi
killall openvpn
done
