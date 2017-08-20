#!/bin/bash

cat list.txt | while read LINHA; do
 HOST=`echo "$LINHA" | cut -d":" -f1`
 PORT=`echo "$LINHA" | cut -d":" -f2`
 midori -e http-proxy=$HOST -e http-proxy-port=$PORT
done


