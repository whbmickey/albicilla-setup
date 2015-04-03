#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

case "$1" in
"clone")
  echo "Clone codebase from github"
  $DIR/clone.sh
  ;;
"pull")
  echo "Pull docker images"
  $DIR/pull.sh
  ;;
"launch")
  echo "Launch containers"
  $DIR/launch.sh
  ;;
"help" | *)
  echo "Support commands: clone|pull|launch"
  ;;
esac
