ufw allow 5901/tcp
apt install xfce4 xfce4-goodies tightvncserver
vncserver
vncserver -kill :1
nano ~/.vnc/xstartup
startxfce4
nano /etc/systemd/system/vncserver.service
https://serverspace.io/support/help/install-tightvnc-server-on-ubuntu-20-04/
