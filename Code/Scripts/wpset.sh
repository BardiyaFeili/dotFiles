#!/bin/bash

while getopts "w:" arg; do
  case $arg in
  w) WALL=$OPTARG ;;
  esac
done

echo $WALL

echo "$WALL" >"/home/bardiya/dotfiles/Code/Scripts/wptext.txt"
