#!/bin/bash
cwd=$(pwd)
parent_path=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")
cd "$parent_path"/../
git pull >/dev/null
"$parent_path"/on-repulled.sh
cd $cwd
