#!/bin/bash

set -e

cat riccardo.json | lolcat
VERSION=$(cat VERSION)
IMAGE_SIZE=$(docker images | grep palladius/pastang | grep "$VERSION" |  awk '{print $7}')

echo "OK IMAGE_SIZE=$IMAGE_SIZE"
#jq '.array[] += { "new_42key": 0 }' < riccardo.json
jq '.array[] += { "docker_size_v'$VERSION'": "'$IMAGE_SIZE'" }' < riccardo.json  && # > riccardo.tmp.json
    jq '.array[] += { "docker_size_v'$VERSION'": "'$IMAGE_SIZE'" }' < riccardo.json > riccardo.tmp.json

echo OK correctly written: riccardo.tmp.json
cat riccardo.tmp.json
