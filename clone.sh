#!/usr/bin/env bash

REPOS="albicilla-rest albicilla-api albicilla-public gentilis"

printf "Your github username:"
read username

for repo in $REPOS; do
  if [ ! -d "$repo" ]; then
    git clone "git@github.com:$username/$repo.git"

    cd $repo
    git remote add central git@github.com:Tradesparq/$repo.git
    git remote set-url --push central no_push

    # TODO should be removed
    if [[ "$repo" != "albicilla-user" ]]; then
      git checkout launch-script
    fi
    cd ..
  fi

  if [ -e "$repo/package.json" ]; then
    cd $repo && npm install && cd ..
  fi

  if [ -e "$repo/bower.json" ]; then
    cd $repo && bower install --config.interactive=false && cd ..
  fi
done

if [ ! -d "albicilla-api-master" ]; then
  echo "Copy albicilla-api-master"
  cp -r albicilla-api/ albicilla-api-master/

  # TODO uncomment 1st line, remove 2nd line
  #cd albicilla-api && git checkout dev && cd ..
  cd albicilla-api && git checkout launch-script-dev && cd ..
fi
