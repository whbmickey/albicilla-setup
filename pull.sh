#!/usr/bin/env bash

IMAGES="node tradesparq/php-apache2 tradesparq/nginx-proxy"

for image in $IMAGES; do
  docker pull $image
done
