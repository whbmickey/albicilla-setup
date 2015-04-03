#!/usr/bin/env bash

NAME=proxy
IP=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep 172.17)
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source $DIR/dev-env-vars.sh

for dir in $(ls -d */); do
  if [[ -e $dir/launch-container.sh ]]; then
    echo "Execute $dir/launch-container.sh"
    cd $dir && ./launch-container.sh && cd ..
  fi
done

if docker ps -a | grep -q "$NAME"; then
  echo "Remove docker container $NAME"
  docker rm -f $NAME
fi

echo "Launch container $NAME"
docker run -it -d --name="$NAME" -p 80:80 \
  --env API_ADDRESS="http://$IP:$API_MASTER_PORT" \
  --env USER_ADDRESS="http://$IP:$GENTILIS_PORT" \
  --env PUBLIC_ADDRESS="http://$IP:$PUBLIC_PORT" \
  --env USER3_ADDRESS="http://$IP:$USER3_PORT" \
  --env API_DEV_ADDRESS="http://$IP:$API_PORT" \
  tradesparq/nginx-proxy
