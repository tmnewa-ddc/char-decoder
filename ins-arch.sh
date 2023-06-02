#!/bin/bash

# read -s -p "ins pass:" password
# echo ""

for fileRaw in file/raw/*; do
  if [[ $fileRaw != *.zip ]]; then
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
  if ! unzip -q -P "$password" $fileRaw -d file/raw/; then
    echo "error..."
    continue
  fi
  rm $fileRaw
done