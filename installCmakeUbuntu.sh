cmake --version
sudo apt remove cmake
#get install from https://cmake.org/download/
sudo cp cmake-3.21.3-linux-x86_64.sh /opt
cd /opt
sudo chmod +x /opt/cmake-3.21.3-linux-x86_64.sh
sudo bash /opt/cmake-3.21.3-linux-x86_64.sh
sudo ln -s /opt/cmake-3.21.3-linux-x86_64/bin/* /usr/local/bin
cmake --version
