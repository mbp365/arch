if [ -d "/home/max/phone" ]; then
    fusermount -u ~/phone
    rmdir ~/phone
fi
