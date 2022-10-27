#!/bin/bash

done=0;

#while : ; do
while [[ $done != 1 ]]; do

  #if [[ "$done" -ne 0]]; then
   # break
  #fi
  
  volume=$(pamixer --get-volume);
  
  chosen=$(printf "Mute\nMax\n+10\n-10\nExit" | rofi -dmenu -i -p "$volume" -theme-str '@import "nord.rasi"');
  
  case $chosen in
  
    "Mute") pactl set-sink-volume 0 0;
  
    ;;
  
    "Max") pactl set-sink-volume 0 +250%;
  
    ;;
  
    "+10") pactl set-sink-volume 0 +10%;
  
    ;;
  
    "-10") pactl set-sink-volume 0 -10%;
  
    ;;
    
    "Exit") done=1;

    ;;
  
  esac

done
