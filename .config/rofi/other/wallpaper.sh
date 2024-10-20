#!/bin/sh

WallDir=${1:-~/Pictures/Wallpapers}

PREVIEW=true \
  rofi -no-config -theme fullscreen-preview.rasi \
  -show filebrowser -filebrowser-command 'clipse -a' \
  -filebrowser-directory "$WallDir" \
  -filebrowser-sorting-method mtime \
  -selected-row 1 >/dev/null
