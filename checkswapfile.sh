#https://www.linux.com/news/all-about-linux-swap-space
swapon -s
fdisk -l /dev/sda
fdisk -l /dev/sdb
fdisk -l /dev/sdc
mkswap /dev/sdc1
swapon /dev/sdc1
swapon -s
