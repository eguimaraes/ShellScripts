lspci | grep -i nvidia
 uname -m && cat /etc/*release
 gcc --version
 uname -r
 sudo apt-get install linux-headers-$(uname -r)
 #http://developer.nvidia.com/cuda-downloads
 sudo update-pciids
 sudo dpkg -i cuda-repo-<distro>_<version>_<architecture>.deb
 sudo apt-key add /var/cuda-repo-<version>/7fa2af80.pub
 sudo apt-get update
 sudo apt-get install cuda
 export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}
 export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64\${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
 systemctl status nvidia-persistenced
 sudo systemctl enable nvidia-persistenced
 /lib/udev/rules.d/40-vm-hotadd.rules
 sudo cp /lib/udev/rules.d/40-redhat.rules /etc/udev/rules.d
 sudo sed -i '/SUBSYSTEM=="memory", ACTION=="add"/d' /etc/udev/rules.d/40-redhat.rules
 sudo /usr/local/cuda-X.Y/bin/uninstall_cuda_X.Y.pl
 sudo /usr/bin/nvidia-uninstall
