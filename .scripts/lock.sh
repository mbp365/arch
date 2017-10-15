#! /bin/bash

#take a screenshot and save that to /tmp/lockpic.png
scrot /tmp/lockpic.png
#add a gaussian blur and save that, overwriting the first picture
convert /tmp/lockpic.png -blur 0x5 /tmp/lockpic.png
#start i3lock with the overlayed + blurred picture at /tmp/lockpic.png
i3lock -i /tmp/lockpic.png
