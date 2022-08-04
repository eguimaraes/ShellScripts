sudo mkdir -p /mnt/windows
sudo apt install cifs-utils
sudo mount -t cifs //servidor/compartilhamento -o username=usuario,password=senha /mnt/windows
cd /mnt/windows ; ls -l

# /etc/fstab
#/servidor/compartilhamento /mnt/windows cifs rw,username=usuario,password=senha 0 0
#https://www.cyberciti.biz/tips/how-to-mount-remote-windows-partition-windows-share-under-linux.html
#https://lamasbr.github.io/2018/03/05/How-to-mount-Windows-shared-folders-cifs-or-smbfs-in-Linux.html
