#!/bin/bash

# https://stackoverflow.com/questions/70757791/build-linux-arm64-docker-image-on-linux-amd64-host
# doc https://medium.com/@artur.klauser/building-multi-architecture-docker-images-with-buildx-27d80f7e2408
# on Mac: https://medium.com/geekculture/docker-build-with-mac-m1-d668c802ab96
VERSION="4.2"

#set -x
set -e
#docker buildx ls

function install_onmac_m1() {
    docker buildx create --name mybuilder
    docker buildx use mybuilder
    docker buildx inspect --bootstrap

    docker buildx build --tag pastang:m1-v$VERSION -o type=image --platform=linux/arm64,linux/amd64 .
    #docker buildx build --push --tag [palladius/image-tag] --platform=linux/arm64,linux/amd64 .
    docker buildx build --push --tag palladius/pastang:m1-v$VERSION --platform=linux/arm64,linux/amd64 .
}

function insyall_on_linux() {

    export DOCKER_CLI_EXPERIMENTAL=enabled

    # on linux
    #docker run --rm --privileged docker/binfmt:66f9012c56a8316f9244ffd7622d7c21c1f6f28d

    docker run --privileged --rm tonistiigi/binfmt --install all
    docker buildx create --use --name mybuild node-amd64
    docker buildx create --append --name mybuild node-arm64
    docker buildx build --platform linux/amd64,linux/arm64 .

    #docker buildx create --use --name multi-arch-builder
    #docker buildx build --platform='linux/amd64' -t pasta-ror7:m1v$VERSION
    #echo docker buildx build -t pasta-ror7:v$VERSION .

}

install_onmac_m1
verde OK.
