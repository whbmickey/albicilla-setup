#!/usr/bin/env bash

REPOS="albicilla-rest albicilla-api albicilla-public albicilla-user gentilis"

printf "Your github username:"
read username

for repo in $REPOS; do
  if [ ! -d "$repo" ]; then
    git clone "git@github.com:$username/$repo.git"

    cd $repo
    git remote add central git@github.com:Tradesparq/$repo.git
    git remote set-url --push central no_push
    cd ..
  fi
done
