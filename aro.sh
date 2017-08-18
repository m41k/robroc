#!/bin/bash

while [ 1 ]; do

BROWSER=(
'firefox'
'ie'
'chorme'
)

TARRAY=${#BROWSER[@]}
RANBRO=$(($RANDOM %$TARRAY ))
echo ${BROWSER[$RANBRO]}

sleep 2
done
