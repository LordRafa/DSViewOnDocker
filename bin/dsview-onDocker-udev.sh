#!/usr/bin/env bash

if [ ! -z "$(docker ps -qf name=dsview-on-docker)" ]; then

  if [ "$ACTION" == "add" ]; then

    docker exec -u 0 dsview-on-docker mkdir -p $(dirname $DEVNAME)
    docker exec -u 0 dsview-on-docker mknod $DEVNAME c $MAJOR $MINOR
    docker exec -u 0 dsview-on-docker chmod -R 777 $DEVNAME

  elif [ "$ACTION" == "remove" ]; then

    docker exec -u 0 dsview-on-docker rm $DEVNAME
    docker exec -u 0 dsview-on-docker rmdir -p $(dirname $DEVNAME)

  fi

fi

