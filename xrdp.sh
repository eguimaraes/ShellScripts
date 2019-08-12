sudo apt-get update
sudo apt-get install xrdp
apt-get install xfce4 
echo xfce4-session >~/.xsession
sudo gedit /etc/xrdp/startwm.sh
#emove the line . /etc/X11/Xsession and add the line startxfce4 and then hit ctrl+X and save the file
service xrdp restart 



