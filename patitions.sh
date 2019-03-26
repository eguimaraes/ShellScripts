sudo blkid
sudo mkdir /media/Data
sudo cp /etc/fstab /etc/fstab.orig
sudo gedit /etc/fstab
#UUID=519CB82E5888AD0F  /media/Data  ntfs-3g  defaults,windows_names,locale=en_US.utf8  0 0
locale
locale -a
sudo mount -a
#UUID=519CB82E5888AD0F  /media/Data  ntfs  defaults,umask=222  0 0
sudo mv /etc/fstab.orig /etc/fstab
sudo umount  /media/<mountpoint> 
