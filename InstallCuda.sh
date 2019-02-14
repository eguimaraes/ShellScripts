#pre install
#Veja o video https://www.youtube.com/watch?v=cL05xtTocmY
#https://www.youtube.com/watch?v=2EbHSCvGFM0
lspci | grep -i nvidia
uname -m && cat /etc/*release
gcc --version
uname -r
sudo apt-get install linux-headers-$(uname -r)
#http://developer.nvidia.com/cuda-downloads
sudo apt-get install g++ freeglut3-dev build-essential libx11-dev 
sudo apt-get install libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev    
sudo update-pciids
#Install cuda https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1804&target_type=deblocal
sudo dpkg -i cuda-repo-ubuntu1804-10-0-local-10.0.130-410.48_1.0-1_amd64.deb
sudo apt-key add /var/cuda-repo-10-0-local-10.0.130-410.48/7fa2af80.pub
sudo apt-get install cuda
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install cuda
export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64\${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
systemctl status nvidia-persistenced
sudo systemctl enable nvidia-persistenced

