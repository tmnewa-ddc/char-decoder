#!/bin/bash

dirName=${1}
ignores=${2}

echo "unzip start!"
bash ./ins-arch.sh

echo "iconv start!"

bash ./ins-char.sh 0 "$dirName" "$ignores"

bash ./ins-char.sh 1 "$dirName" "$ignores"
