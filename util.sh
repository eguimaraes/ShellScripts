#instala o software center
sudo apt install gnome-software
sudo apt-get install apt-xapian-index
sudo update-apt-xapian-index
sudo apt-get install synaptic
sudo apt-get install dkms
#Instala o protocolo RDP no Ubuntu
sudo apt install xrdp
sudo systemctl enable xrdp
#instala VNC
sudo apt install tightvncserver
sudo tightvncserver
#Cria USB Bootable a partir do Ubuntu
#https://github.com/slacka/WoeUSB/wiki/Limitations#fat32-filesystem-4gib-single-file-size
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt update
sudo apt install woeusb
sudo woeusb --target-filesystem NTFS --device /home/xx/Documents/isos/Win10_1809Oct_English_x64.iso /dev/sdf

InstallAnaconda.sh

