#!/bin/bash

# read -s -p "ins pass:" password
# echo ""

for fileRaw in file/raw/*; do
  if [[ $fileRaw != *.7z ]]; then
    continue
  fi
  if [ ! -f $fileRaw ]; then
    echo "there is no file..."
    break
  fi
  # input pass
  if [[ $password == "" ]]; then
    read -s -p "ins pass:" password
    echo ""
  fi
  echo "unzip: "$fileRaw
  if ! 7z x $fileRaw -o"file/raw/" -p"$password"; then
    echo "error..."
    continue
  fi
  rm $fileRaw
done