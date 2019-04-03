sudo apt-get purge nvidia-*
sudo apt-add-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-cache search '^nvidia-[:digit]' --names-only
sudo apt-get install nvidia-390
