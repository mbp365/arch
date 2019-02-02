#!/bin/bash

#This is the ffmpeg command that the screencast shortcut in i3 will run.

#Picks a file name for the output file based on availability:

if [[ -f ~/output.mp4 ]]
	then
		n=1
		while [[ -f $HOME/output_$n.mp4 ]]
		do	
			n=$((n+1))
		done
		filename="$HOME/output_$n.mp4"
	else
		filename="$HOME/output.mp4"
fi

#The actual ffmpeg command:

ffmpeg \
-f x11grab \
-s $(xdpyinfo | grep dimensions | awk '{print $2;}') \
-i :0.0 \
-f pulse -ac 2 -i default \
-c:v libx264 -r 30 $filename
