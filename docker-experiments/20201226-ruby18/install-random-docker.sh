#!/bin/bash

ACTION=${1:-_NO_ACTION_}
UGLY_TARGET=${2:-NO_TARGET} # eg Dockerfile.ruby18-[build|run]

TARGET=$(echo $UGLY_TARGET | cut -d . -f 2 | sed -e s/-build// | sed -e s/-run// ) # -> ruby18

echo "Hi from: $0. Args: $*" | lolcat
echo "ACTION: $ACTION. Target: $TARGET" | lolcat

if [ "build" = "$ACTION" ]; then
    echo "lets build. To run, just call me with run instead of build"
    docker build -t multipasta:$TARGET - < Dockerfile.$TARGET # " | lolcat
    #exit 0
else
    if [ "run" = "$ACTION" ]; then
        echo lets run  | lolcat
        #echo "docker run -it -p 8080:8080 multipasta:$TARGET --volume TODO" | lolcat
        docker run -it -p 8080:8080 \
          -v /home/riccardo/git/gcp-metarepo/pasta/:/pasta-mounted-volume/ \
           multipasta:$TARGET bash
    else
        echo 'call me with "run" or "build" mofo'
    fi
fi

