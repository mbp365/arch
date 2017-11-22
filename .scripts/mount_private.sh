if [ ! -d "/home/max/private" ]; then
    mkdir ~/private
    encfs ~/.private ~/private
fi
