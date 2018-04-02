#set the timezone using
#timedatectl list-timezones
#timedatectl set-timezone Zone/SubZone

sudo ntpd -qg
sudo hwclock --systohc
