#!/bin/bash

SERVICE_REGEX="skpasta-"


function _curl() {
    echodo curl -I --max-time 0.9 -s "$1" 2>/dev/null
}

#kubectl get 'pod,deployment' | grep skpasta
kubectl get service | grep "$SERVICE_REGEX" | while read service type intip EXT_IP port_mapping time ; do
    PORT=$(echo $port_mapping | cut -d: -f 1)
    echo "[🏚️🐛] check $service $EXT_IP:$PORT"


    echo
    _curl "http://$EXT_IP:$PORT/"
#    _curl "http://$EXT_IP:8080"
done

