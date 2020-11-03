sudo apt-get install openvpn
apt-get install network-manager-openvpn-gnome
openvpn --remote CLIENT_IP --dev tun1 --ifconfig 10.9.8.1 10.9.8.2
openvpn --dev tun1 --ifconfig 10.9.8.1 10.9.8.2
 openvpn --remote SERVER_IP --dev tun1 --ifconfig 10.9.8.2 10.9.8.1
