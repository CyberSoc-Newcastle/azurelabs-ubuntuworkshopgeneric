#!/bin/bash
cwd=$(pwd)
parent_path=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")
"$parent_path"/pull.sh
