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
    ir=1
    { # try
      iconv -f BIG5HKSCS -t UTF8 $file > file/target/${file##*/}
    } || {
      ir=0
      rm file/target/${file##*/}
    }
    if [[ $ir -eq 1 ]]; then
      mv $file file/backup/
    fi
  else
    echo 'use iconv-lite (vscode)'
    npm run big5 $file
  fi
done