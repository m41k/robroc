#!/bin/bash

wget www.vpngate.net/api/iphone/

cat index.html | while read LINHA; do

#DOP=`echo $LINHA | cut -d "," -f15`
#echo $DOP | base64 -d 2> /dev/null
HOST=`echo $LINHA | cut -d "," -f1`
echo $LINHA | cut -d "," -f15 | base64 -d > teste64 2> /dev/null
openvpn --config teste64 &
sleep 20
ifconfig | grep tun
 if [ $? -eq 0 ]; then
# echo $HOST
# echo "=========IP=========="
# wget -t 1 --timeout=10 -qO - 54.233.169.1/cgi-bin/vip.sh
#luakit -n 54.233.169.1/cgi-bin/vip.sh &
# echo "====================="
#sleep 20
./pac2.sh
 fi
#killall luakit
killall openvpn
done


#!/bin/bash

sysctl -w vm.drop_caches=3

TARGET="ojas17.jpg"
NUMPAC=200
DCAPTU="capture"
INTERF="tun0"
#tcpdump -q -i ens3 -c $NUMPAC -w $DCAPTU &
#tcpdump -v -x -X -i lo | grep ojas17.jpg
tcpdump -c $NUMPAC -i $INTERF -w $DCAPTU &
luakit -n luw.servehttp.com
#midori luw.servehttp.com &
sleep 15
tcpdump -x -X -r $DCAPTU | grep $TARGET

if [ $? = 0 ]; then
  xdotool mousemove 550 600 click 1&
  sleep 35
  killall luakit
  rm $DCAPTU
#  /etc/init.d/tor restart
 else
  killall luakit
  rm $DCAPTU
fi

sleep 5
./$0

