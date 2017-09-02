#!/bin/bash

cat list.txt | while read LINHA; do
# HOST=`echo "$LINHA" | cut -d":" -f1`
# midori -e http-proxy=$HOST -e http-proxy-port=$PORT
# -e Go $SITE
export http_proxy=http://$LINHA
HOST=`wget --timeout=1 --waitretry=0 --tries=1 -qO - 54.233.169.1/cgi-bin/vip.sh`
PORT=`echo "$LINHA" | cut -d":" -f2`
#wget --timeout=1 --waitretry=0 --tries=1 -qO - 54.233.169.1/cgi-bin/vip.sh
#echo $HOST
if [[ $HOST != "" ]]; then
#echo "$HOST:$PORT"
 midori -e http-proxy=$HOST -e http-proxy-port=$PORT
fi

done


