python -m pywal -i $1
#resizes the picture to the screen resolution
#and moves it to the slim theme folder (hardcoded)
sudo -s source ~/.cache/wal/colors.sh
convert $1 -resize $(xdpyinfo | grep dimensions | awk '{print $2;}')! /usr/share/slim/themes/slim-minimal/background.jpg
sudo python3 ~/.scripts/set_wal_theme.py $1
sleep 2
i3-msg restart
