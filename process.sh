#!/bin/bash

mode=${1:-0}

for file in file/source/*
do
  if [ ! -f $file ]; then
      echo "there is no file..."
      break
  fi
  rm file/target/${file##*/}

  if [[ $mode -eq '0' ]]; then
    echo 'use iconv (bash)'
    iconv -f BIG5HKSCS -t UTF8 $file > file/target/${file##*/}
    mv $file file/backup/
  else
    echo 'use iconv-lite (vscode)'
    npm run big5 $file
  fi
done