#!/bin/bash

SERVICE_REGEX="skpasta-"


function _curl() {
    SERVICE="$1"
    URL="$2"
    echo "[🏚️🐛] curling $SERVICE => $URL"
    echodo curl -I --max-time 0.9 -s "$URL" # 2>/dev/null
}

#kubectl get 'pod,deployment' | grep skpasta
kubectl get service | grep "$SERVICE_REGEX" | while read service type intip EXT_IP port_mapping time ; do
    PORT=$(echo $port_mapping | cut -d: -f 1)


    echo
    _curl "$service" "http://$EXT_IP:$PORT/"
#    _curl "http://$EXT_IP:8080"
done

kubectl get all | grep skpasta-
