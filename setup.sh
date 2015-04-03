#!/usr/bin/env bash

set -e

case "$1" in
"clone")
  echo "Clone codebase from github"
  ./clone.sh
  ;;
"pull")
  echo "Pull docker images"
  ./pull.sh
  ;;
"launch")
  echo "Launch containers"
  ./launch.sh
  ;;
"help")
*)
  echo "Support commands: clone|pull|launch"
  ;;
esac
