#!/bin/bash

LOCAL_HOME="$HOME/.onDocker/dsview"
LOCAL_WORKSPACE="$HOME/dsview"
mkdir -p "$LOCAL_HOME" 2> /dev/null
mkdir -p "$LOCAL_WORKSPACE" 2> /dev/null

OPTS=""
OPTS="${OPTS} --env=DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix"

docker run --rm -i \
	${OPTS} \
	-v /dev/bus/usb:/dev/bus/usb:ro --device-cgroup-rule 'c 189:* rwm' \
    	--net host -v /run/udev/control:/run/udev/control \
	-v "$LOCAL_HOME:/App_Home" \
	-v "$LOCAL_WORKSPACE:/App_Home/dsview" \
	lordrafa/dsview $@

