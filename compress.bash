#!/bin/bash

read -rp "Please Enter Path: " r1

fullpath=$(readlink -f "$r1")

if [[ ! -d "$fullpath" ]]
then
  echo "Path not exists"
  exit 0
fi


files=$(find "${fullpath}" -type f -name '*.png')

for i in $files;
do
    convert "$i" -resize 1920x1080 "$i" && optipng "$i" -out "$i"
done

files=$(find "${fullpath}" -type f -name '*.jpg')

for i in $files;
do
    convert "$i" -resize 1920x1080 "$i" && jpegoptim -m80 -o -t "$i"
done
