#!/bin/bash

SITE='54.233.169.1/cgi-bin/log.sh'

while [ 1 ]; do

MEM=`free -m | grep Mem | tr -s " " | cut -d " " -f4`
  if [ $MEM -le 100 ]; then
    sysctl -w vm.drop_caches=3
  fi

BROWSER=(
'firefox'
'ie'
'chorme'
)

TARRAY=${#BROWSER[@]}
RANBRO=$(($RANDOM %$TARRAY ))
UAGENT=${BROWSER[$RANBRO]}


 /etc/init.d/tor restart
 midori &
 sleep 3
 midori -e identify-as=MIDORI_IDENT_CUSTOM -e user-agent=$UAGENT -e Go $SITE
 sleep 5
 killall midori
 done
