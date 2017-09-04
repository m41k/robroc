#!/bin/bash
MEM=`free -m | grep Mem | tr -s " " | cut -d " " -f4`
  if [ $MEM -le 100 ]; then
    sysctl -w vm.drop_caches=3
  fi
/etc/init.d/tor restart
#firefox 54.233.169.1/cgi-bin/vip.sh &
#firefox go.onclasrv.com/afu.php?id=1368098 &
firefox http://kaitect.com/20bJ &
 TEMPO=`seq 30 40 | sort -R | head -n 1`
 sleep $TEMPO
wmctrl -a firefox
xdotool key ctrl+shift+w
./$0
