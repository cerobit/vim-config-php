#!/bin/sh
#WID=$(xdotool search --onlyvisible --class chromium|head -1)
#xdotool windowactivate ${WID}
xdotool search --desktop 0 "Chromium" windowactivate
xdotool key Alt+1
xdotool key F5
WID=$(xdotool search --onlyvisible --class gvim|head -1)
xdotool windowactivate ${WID}
