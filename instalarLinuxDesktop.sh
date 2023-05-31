sudo apt update && sudo apt upgrade
sudo apt install kde-plasma-desktop
sudo apt-get install xfce4-session xfce4-goodies
sudo apt install lxde
sudo apt install ubuntu-mate-desktop
sudo apt install vanilla-gnome-desktop vanilla-gnome-default-settings
sudo apt install gdm3
sudo apt install slim
sudo apt install lightdm
sudo apt install ubuntu-desktop
sudo reboot
sudo service slim start
sudo apt remove [display-manager] [desktop-environment]
sudo apt remove slim lxde
sudo apt autoremove
sudo apt-get purge lightdm
sudo apt-get update
sudo apt-get install lightdm
dpkg-reconfigure lightdm
sudo reboot
dpkg-reconfigure lightdm
sudo dpkg --configure -a
sudo apt-get purge gdm3
sudo apt-get update
sudo apt-get install gdm3
dpkg-reconfigure gdm3
sudo reboot
dpkg-reconfigure gdm3
sudo dpkg --configure -a
