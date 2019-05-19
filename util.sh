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
#Cria USB Bootable a partir do Ubuntu unetbootin
sudo add-apt-repository ppa:gezakovacs/ppa
sudo apt-get update
sudo apt-get install unetbootin
sudo apt-get install XQuartz
#Install/Uninstall VBox
dpkg -l | grep virtualbox
sudo apt install virtualbox
sudo apt-get remove virtualbox* --purge
InstallAnaconda.sh
#dism.exe /Online /Disable-Feature:Microsoft-Hyper-V
sudo apt-get install gnome-system-tools
sudo apt-get install libeigen3-dev
#atualizar o cmake
sudo apt-get purge cmake
sudo apt-get install cmake
sudo apt-get purge cmake
version=3.14
build=4
wget https://cmake.org/files/v$version/cmake-$version.$build.tar.gz
tar -xzvf cmake-$version.$build.tar.gz
cd cmake-$version.$build/
./bootstrap
make -j4
sudo make install
$ cmake --version

