if [ ! -d "/home/max/usb" ]; then
    mkdir ~/usb
    sudo mount /dev/sdb1 ~/usb
fi
