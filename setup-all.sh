#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

for dir in $(ls -d $DIR/../*/); do
  if [[ -e $dir/setup.sh ]]; then
    CMD="cd $dir && ./setup.sh && cd .."
    echo $CMD
    bash -c "$CMD"
  fi
done
