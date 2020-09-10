#to list video drive
lsmod | sort | grep uvcvideo
sudo modprobe uvcvideouname -r
dmesg | grep -i "Camera"
s -ltrh /dev/video*
 v4l2-ctl --list-devices
 v4l-utils
 
