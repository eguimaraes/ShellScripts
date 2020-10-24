#subistituir PID pelo nr do processo
sudo strace -p<PID> -s9999 -e write
