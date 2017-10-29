transparency=60
urxvt -tr -sh $transparency -e ncmpcpp &
sleep 0.1
urxvt -tr -sh $transparency -e vis &
i3-msg "gaps inner current set 80;gaps outer current set 30"
i3-msg "move down"
