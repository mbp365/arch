python3 -m pywal -i $1
#resizes the picture to the screen resolution
#and moves it to the slim theme folder (hardcoded)
sudo -s source ~/.cache/wal/colors.sh
sudo python3 ~/.scripts/set_wal_theme.py $1
sleep 2
i3-msg restart
