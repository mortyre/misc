#!/bin/bash
set -x
SERVERS=$(curl -s https://zbs.prd1-alpha.prod.whalekit.live/edgeServer/all)
PORT='40241'
for ADDR_Q in $(echo $SERVERS | jq '.[].host'); do 
    echo $ADDR_Q | sed s/\"//g
    ADDR=$(echo $ADDR_Q | sed s/\"//g)
    nc -4 -w 3 -z $ADDR $PORT
    if [[ $? == 0 ]]; then 
    #if [[ $(nc -4 -w 10 -z $ADDR $PORT) -eq 0 ]]; then 
        echo "OK" 
    else 
        echo "FAIL" 
    fi
done
