#!/bin/bash

LOCAL_HOME="$HOME/.onDocker/dsview"
LOCAL_WORKSPACE="$HOME/dsview"
mkdir -p "$LOCAL_HOME" 2> /dev/null
mkdir -p "$LOCAL_WORKSPACE" 2> /dev/null

CONTAINER_NAME="dsview-on-docker"

OPTS=""
OPTS="${OPTS} --env=DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix"

docker run --rm -it --name="$CONTAINER_NAME" \
	${OPTS} \
	-v /dev/null:/dev/bus/usb/099 \
	--device-cgroup-rule 'c 189:* rwm' \
	-v "$LOCAL_HOME:/App_Home" \
	-v "$LOCAL_WORKSPACE:/App_Home/dsview" \
	lordrafa/dsview $@

