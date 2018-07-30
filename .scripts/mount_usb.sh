if [ ! -d "/home/max/usb" ]; then
    mkdir ~/usb
    DEVICE=${1:-/dev/sdb1}
    sudo mount "$DEVICE" ~/usb
fi
