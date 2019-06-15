sudo mkdir /mnt/share
sudo mount -t drvfs '\\server\share' /mnt/share
sudo mkdir /mnt/d
sudo mount -t drvfs D: /mnt/d
sudo umount /mnt/d
