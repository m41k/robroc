#!/bin/bash
 /etc/init.d/tor restart
 sleep 5
 echo "=========IP=========="
 torify wget -t 1 --timeout=10 -qO - 54.233.169.1/cgi-bin/vip.sh
 echo "====================="
 sleep 10
./$0
