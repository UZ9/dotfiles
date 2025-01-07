#!/bin/bash

if [[ $# -ne 1 ]]; then 
  echo "Invalid number of arguments! Usage: tempedit <url>"
fi

# idea: check for filetype, change accordingly 
echo $1

mkdir "/tmp/$1"

wget $1 -P "/tmp/$1"
