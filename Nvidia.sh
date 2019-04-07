#https://askubuntu.com/questions/61396/how-do-i-install-the-nvidia-drivers
ubuntu-drivers devices
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
sudo apt upgrade
ubuntu-drivers list
sudo apt-get purge nvidia-*
sudo apt-add-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-cache search '^nvidia-[:digit]' --names-only
sudo apt install nvidia-340      
sudo apt install nvidia-utils-390
sudo apt-get install nvidia-390
