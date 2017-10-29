if [ ! -z "$1" ];
then
    source "/home/max/.cache/wal/colors.sh"
    wallp_temp=$wallpaper
    ~/.scripts/generate_theme.sh $1
    sleep 1
fi
cp ~/.Xdefaults tmp
echo "urxvt*transparent: true">>~/.Xdefaults
echo "urxvt*shading: 60">>~/.Xdefaults
i3-msg workspace "1337"
urxvt -e sh -c "sleep 1.4;ranger ~/Pictures/memes;" &
i3-msg move right
urxvt -e sh -c "sleep 1.4;neofetch -s;" &
sleep 0.5
urxvt -e ncmpcpp -S visualizer &
sleep 1
i3-msg move down
sleep 5
rm ~/.Xdefaults
mv tmp ~/.Xdefaults
i3-msg kill
i3-msg kill
i3-msg kill
if [ ! -z "$1" ];
then
    echo $wallp_temp
    ~/.scripts/generate_theme.sh $wallp_temp
fi
