sudo apt-get install smbclient
sudo apt-get install cifs-utils
sudo mkdir -p /mnt/my_mount_dir
sudo mount -t cifs -o "domain=MYDOMAIN,username=MyUserName,password=myPas$werd,sec=ntlm" //(your windows host ip)/(your remote share name) /mnt/my_mount_dir
sudo mount -t cifs -o "domain=MYDOMAIN,username=MyUserName,password=myPas$werd,sec=ntlm,vers=1.0" //(your windows host ip)/(your remote share name) /mnt/my_mount_dir

