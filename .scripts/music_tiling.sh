urxvtc -fn "xft:monospace:size=5" -name music -tr -sh 100 -e cava &
sleep 0.1
urxvtc -name music -e ncmpcpp &
sleep 0.1
i3-msg "gaps inner current set 0;gaps outer current set 145"
i3-msg "move down"
