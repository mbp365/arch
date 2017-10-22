rofi -show run -modi run -hide-scrollbar \
		 -color-window "$1, $2, $2" \
		 -color-normal "$1, $2, $1, $2, $1" \
		 -color-active "$1, $1, $1, $2, $1" \
		 -color-urgent "$1, $2, $1, $2, $1" \
		 -kb-row-select "Tab" -kb-row-tab ""
