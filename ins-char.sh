#!/bin/bash

# shell or nodejs
mode=${1:-0}
# pre month or others
dirName=${2}

if [[ $mode -eq '0' ]]; then
  echo 'use iconv-base (linux)'
else
  echo 'use iconv-lite (vscode)'
fi

for fileRaw in file/raw/*/*; do
  if [ ! -f $fileRaw ]; then
    echo "there is no file..."
    break
  fi
  if [[ $fileRaw != *.txt ]]; then
    break
  fi
  if [[ $fileRaw == *hth/ot_insurance.txt ]]; then
    fileRe=$(dirname $fileRaw)/ht_insurance.txt
    mv $fileRaw $fileRe
    fileRaw=$fileRe
  fi
  # dirBkp=file/backup/$(basename $(dirname $fileRaw))
  # mkdir -p $dirBkp
  if [[ $dirName == "" ]]; then
    dirName=$(basename $(dirname $fileRaw))
    dirName=${dirName//[^0-9]/}
  fi
  dirOri=file/origin/$dirName
  mkdir -p $dirOri
  fileOri=$dirOri/$(basename $fileRaw)
  rm -f $fileOri

  if [[ $mode -eq '0' ]]; then
    ir=1
    { # try
      iconv -f BIG5HKSCS -t UTF8 $fileRaw > $fileOri
    } || {
      ir=0
      rm $fileOri
    }
    if [[ $ir -eq 1 ]]; then
      # mv $fileRaw $dirBkp
      echo "done: $fileOri"
      rm $fileRaw
    fi
  else
    npm run big5 $fileRaw $fileOri
  fi
done