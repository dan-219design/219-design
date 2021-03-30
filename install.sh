#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

sudo apt-get install ruby-dev -y
sudo bundle update

rm -rf project
for i in $(ls repository)
do
  echo Installing "$i"
  target="$PWD/project/$i"
  pushd "repository/$i" >& /dev/null
    ./emscripten_install.sh "$target"
  popd >& /dev/null
done
