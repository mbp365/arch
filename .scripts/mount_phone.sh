if [ ! -d "/home/max/phone" ]; then
    mtp-detect
    mkdir ~/phone
    jmtpfs ~/phone
fi
