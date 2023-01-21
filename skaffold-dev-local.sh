#!/bin/bash


start_minikube() {
# TODO: find if necessary
	minikube start --profile custom
	skaffold config set --global local-cluster true
	eval $(minikube -p custom docker-env)
}


# 1. set minukube
#start_minikube

# 2. skaffold dev
#    skaffold dev
export STATE=$(git rev-list -1 HEAD --abbrev-commit)
skaffold build --file-output build-$STATE.json
echo "2. Built: build-$STATE.json"
echo "3. Now try: skaffold deploy -a build-$STATE.json"

# how do u get the 2d83b59?
# latest from `skaffold build`
echo "2. Or try:  RAILS_ENV=production docker run -it -p 8080:8080 skaf-pasta-ror7:2d83b59"
# latest from `make docker-build`
echo "3. Or try latest:  RAILS_ENV=production docker run -it -p 8080:8080 pasta-ror7:v0.11.13c"
