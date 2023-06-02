#!/bin/bash

dirName=${1}
ignores=${2}

bash ./ins-char.sh 0 "$dirName" "$ignores" && bash ./ins-char.sh 1 "$dirName" "$ignores"
