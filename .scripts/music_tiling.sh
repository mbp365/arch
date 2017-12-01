urxvtc -fn "xft:monospace:size=5" -tr -sh 100 -e cava &
sleep 0.1
urxvtc -e ncmpcpp &
sleep 0.1
i3-msg "gaps inner current set 80;gaps outer current set 30"
i3-msg "move down"
