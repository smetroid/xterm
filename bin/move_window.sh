#!/bin/bash

# Written by Andrew McDonough
# A simple bash script that uses xdotool to move the window that is currently in focus to different parts of the screen.
# Particularly useful for reading web pages with flexible layouts on wide monitors.
# Assign the various options to keyboard shortcuts e.g. '<Super>Left' assigned to 'swind left'
# See http://tinyurl.com/ubuntukeys for help with assigning keyboard shortcuts.

# Change the following to suit your own monitor's resolution.  Mine is 1920x1200
screen_width=`xdpyinfo | awk '/dimensions:/ { print $2; exit }' | cut -d"x" -f1`
display_width=`xdotool getdisplaygeometry | cut -d" " -f1`
window_id=`xdotool getactivewindow`

# Remember if it was maximized.
window_state=`xprop -id $window_id _NET_WM_STATE | awk '{ print $3 }'`

# Un-maximize current window so that we can move it
wmctrl -ir $window_id -b remove,maximized_vert,maximized_horz

# Read window position
x=`xwininfo -id $window_id | awk '/Absolute upper-left X:/ { print $4 }'`
y=`xwininfo -id $window_id | awk '/Absolute upper-left Y:/ { print $4 }'`

# Subtract any offsets caused by panels or window decorations
#x_offset=`xwininfo -id $window_id | awk '/Relative upper-left X:/ { print $4 }'`
#y_offset=`xwininfo -id $window_id | awk '/Relative upper-left Y:/ { print $4 }'`
x=`expr $x + 10`
#y=`expr $y + 30`


if [ $x -lt $display_width ]; then
  x=0
elif [ $x -lt `expr $screen_width - $display_width` ]; then
  x=$display_width
else
  x=`expr $screen_width - $display_width`
fi


height=1440


case "$1" in
'')
  echo "Usage: swind <left|right|top|bottom|top-left|top-right|bottom-left|bottom-right>"
;;
'left')
  xdotool windowmove $window_id $x 0
  xdotool windowsize $window_id $(( $display_width/2 - 20 )) $height
;;
'right')
  xdotool windowsize $window_id $(( $display_width/2 )) $height
  xdotool windowmove $window_id $(( $x + ($display_width/2) )) 0
;;
'top')
  xdotool windowmove $window_id $x 0
  xdotool windowsize $window_id $display_width $(( $height/2 ))
;;
'bottom')
  xdotool windowsize $window_id $(( $display_width )) $(( $height/2 ))
  xdotool windowmove $window_id $x $(( $height/2 ))
;;
'top-left')
  xdotool windowsize $window_id $(( $display_width/2 )) $(( $height/2 ))
  xdotool windowmove $window_id $x 0
;;
'top-right')
  xdotool windowsize $window_id $(( $display_width/2 )) $(( $height/2 ))
  xdotool windowmove $window_id $(( $x + (( $display_width/2 )) )) 0
;;
'bottom-left')
  xdotool windowsize $window_id $(( $display_width/2 )) $(( $height/2 ))
  xdotool windowmove $window_id $x $(( $display_width/2 ))
;;
'bottom-right')
  xdotool windowsize $window_id $(( $display_width/2 )) $(( $height/2 ))
  xdotool windowmove $window_id $(( $x + (( $display_width/2 )) ))  $(( $display_width/2 ))
;;
esac
