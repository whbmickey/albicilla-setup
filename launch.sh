#!/usr/bin/env bash

source dev-env-vars.sh

IP=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep 172.17)

for dir in $(ls -d */); do
  if [[ -e $dir/launch-container.sh ]]; then
    echo "Execute $dir/launch-container.sh"
    cd $dir && ./launch-container.sh && cd ..
  fi
done

echo "Launch container: proxy"
docker rm -f proxy
docker run -it -d --name proxy -p 80:80 \
  --env API_ADDRESS="http://$IP:$API_MASTER_PORT" \
  --env USER_ADDRESS="http://$IP:$GENTILIS_PORT" \
  --env PUBLIC_ADDRESS="http://$IP:$PUBLIC_PORT" \
  --env USER3_ADDRESS="http://$IP:$USER3_PORT" \
  --env API_DEV_ADDRESS="http://$IP:$API_PORT" \
  tradesparq/nginx-proxy
