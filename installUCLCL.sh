sudo apt-get purge cmake
sudo apt-get install OpenSSL*
sudo apt-get install libssl-dev
#download and compile CMAKE lastest version at https://cmake.org/download/ - download source
cd diretoriofonte cmake
./bootstrap && make && sudo make install
sudo cp /usr/local/include/ /usr/include/ -r
sudo cp /usr/local/lib/ /usr/lib/ -r
sudo cp /usr/local/bin/ /usr/bin/ -r
sudo apt-get install libboost-all-dev
###

