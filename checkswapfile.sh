#https://www.linux.com/news/all-about-linux-swap-space
swapon -s
fdisk -l /dev/sda
fdisk -l /dev/sdb
fdisk -l /dev/sdc
mkswap /dev/sdc1
swapon /dev/sdc1
swapon -s
gedit /etc/fstab
/swapfile   none    swap    sw    0   0
cat /proc/sys/vm/swappiness
sudo gedit /etc/sysctl.conf
vm.swappiness = 40


