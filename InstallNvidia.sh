sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt install nvidia-driver-396
sudo nano /etc/gdm3/custom.conf
#then remove the comment (# symbol) from the line that says
# WaylandEnable=false
