if [ -d "/home/max/private" ]; then
    fusermount -uz ~/private
    rmdir ~/private
fi
