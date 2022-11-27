#!/bin/bash

set -e

echo "🚀 Trying to deploy to k8s without skaffold, using PROD images from Dockerhub: "
# interesting kubemoji proposal: https://github.com/jseguillon/kubemoji
kubectl apply -f deploy/k8s-manhouse/ | while read LINE ; do
    echo "8️⃣ 🧠 $LINE"
done

# kubectl-get-gcp-url from sakura
# DEV_SERVICE="service/pastang-manhouse-dev"
# PROD_SERVICE="service/pastang-manhouse-prod"

GCLB_IP_DEV=$(kubectl get  service/pastang-manhouse-dev  --output jsonpath='{.status.loadBalancer.ingress[0].ip}')
GCLB_IP_PROD=$(kubectl get service/pastang-manhouse-prod --output jsonpath='{.status.loadBalancer.ingress[0].ip}')

echo "👷‍♂️DEV LB IP: $GCLB_IP_DEV"
echo "🌳PRD LB IP: $GCLB_IP_PROD"


echo "Note: this will only work for Riccardo. For inspiration, check kubernetes-service.rb in palladius/sakura"
dns-setup-palladius.sh pastang-dev.palladi.us  "$GCLB_IP_DEV"
