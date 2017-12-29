if [ -d "/home/max/phone" ]; then
    fusermount -uz ~/phone
    rmdir ~/phone
fi
