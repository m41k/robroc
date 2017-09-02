#!/bin/bash

sysctl -w vm.drop_caches=3

TARGET="ojas17.jpg"
NUMPAC=200
DCAPTU="capture"
INTERF="lo"
#tcpdump -q -i ens3 -c $NUMPAC -w $DCAPTU &
#tcpdump -v -x -X -i lo | grep ojas17.jpg
tcpdump -c $NUMPAC -i $INTERF -w $DCAPTU &
torify luakit -n luw.servehttp.com
#midori luw.servehttp.com &
sleep 15
tcpdump -x -X -r $DCAPTU | grep $TARGET

if [ $? = 0 ]; then
  xdotool mousemove 500 660 click 1&
  sleep 35
  killall luakit
  rm $DCAPTU
  /etc/init.d/tor restart
 else
  killall luakit
  rm $DCAPTU
fi

sleep 5
./$0
