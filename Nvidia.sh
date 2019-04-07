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

#https://askubuntu.com/questions/1050423/cannot-get-nvidia-graphics-card-to-work-on-ubuntu-18-04
First Step: purge everything NVIDIA

$ sudo apt purge nvidia-*  
Second Step: purge the PPA

$ sudo ppa-purge ppa:graphics-drivers/ppa    
Third Step: autoremove

$ sudo apt autoremove
Fourth Step: clean up

$ sudo apt auto-clean
Fifth Step: blacklist nouveau

opened the file /etc/modprobe.d/disable-nouveau.conf

and added these lines:

blacklist nouveau
blacklist vga16fb
blacklist rivafb
blacklist nvidiafb
blacklist rivatv
blacklist amd76_edac
alias nouveau off
alias lbm-nouveau off
options nouveau modeset=0
Sixth Step: re-add the PPA

$ sudo add-apt-repository ppa:graphics-drivers/ppa
Seventh Step: check for recommended drivers

$ ubuntu-drivers devices
Eighth Step: install the recommended driver from the PPA

$ sudo apt install nvidia-driver-396
Ninth Step: reboot the system

$ sudo reboot
Tenth Step: check which drivers are in use

$ lspci -k | grep -EA2 'VGA|3D'
00:02.0 VGA compatible controller: Intel Corporation Device 591b (rev 04)
    Subsystem: Acer Incorporated [ALI] Device 118a
    Kernel driver in use: i915
--
01:00.0 VGA compatible controller: NVIDIA Corporation GP106M [GeForce GTX 1060 Mobile] (rev a1)
    Subsystem: Acer Incorporated [ALI] GP106M [GeForce GTX 1060 Mobile]
    Kernel driver in use: nouveau

$ lspci -nnk | grep -i vga -A3
00:02.0 VGA compatible controller [0300]: Intel Corporation Device [8086:591b] (rev 04)
    Subsystem: Acer Incorporated [ALI] Device [1025:118a]
    Kernel driver in use: i915
    Kernel modules: i915
--
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GP106M [GeForce GTX 1060 Mobile] [10de:1c20] (rev a1)
    Subsystem: Acer Incorporated [ALI] GP106M [GeForce GTX 1060 Mobile] [1025:118b]
    Kernel driver in use: nouveau
    Kernel modules: nvidiafb, nouveau, nvidia_drm, nvidia

$ nvidia-smi
NVIDIA-SMI has failed because it couldn't communicate with the NVIDIA driver.  
Make sure that the latest NVIDIA driver is installed and running.

$ nvidia-settings
 ERROR: NVIDIA driver is not loaded   
 ERROR: Unable to load info from any available system
Final Update: Problem solved! Thanks to cl-netbox for the solution and his answer.
I didn't even have to reinstall anything, the whole issue was Secure Boot being enabled.
Once I had disabled Secure Boot and rebooted the system, the graphics card was in use.

