#!/bin/sh

renamefile() {
	dname=$(dirname "$1")
	bname=$(basename "$1")
	xname="${bname#*.}"
	mv "$1" "$dname/$2.$xname"
}


progname=$(basename "$0")

if [ $# -ne 1 ]; then
	echo "Usage: $progname DIR"
	exit 1
fi

if [ ! -d "$1" ]; then
	echo "Error: `$1` is not a directory"
	exit 1
fi

read -p "Enter artist name:  " artist
echo "Artist name is $artist."
read -p "Enter album title:  " album
echo "Album title is $album"

for f in "$1"/*
do
	read -p "Enter track number for $f:  " number
	read -p "Enter track title  for $f:  " title
	id3 -a "$artist" -l "$album" -n $number -t "$title" "$f"
	renamefile "$f" "$number $title"
done
