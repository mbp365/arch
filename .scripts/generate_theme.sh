python -m pywal -i $1
#resizes the picture to the screen resolution
#and moves it to the slim theme folder (hardcoded)
sudo -s source ~/.cache/wal/colors.sh
sudo cp -fv $1 /usr/share/lightdm-webkit/themes/litarvan/images/background.jpg
sudo python3 ~/.scripts/set_wal_theme.py $1
#add cli-visualizer theme
cp ~/.cache/wal/colors ~/.config/vis/colors/wal
sed -i '1d' ~/.config/vis/colors/wal
sleep 2
i3-msg restart
