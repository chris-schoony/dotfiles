#!/bin/bash

SONG_INFO=$(playerctl --player=tidal-hifi metadata --format "{{ artist}} - {{ title }}" 2>/dev/null)

if [ $? -eq 0 ]; then
  echo "$SONG_INFO"
else
  echo ""
fi
