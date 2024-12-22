#!/bin/bash

artist=$(playerctl metadata artist)
title=$(playerctl metadata title)

if [ -n "$artist" ] && [ -n "$title" ]; then
  echo " $artist - $title"
fi