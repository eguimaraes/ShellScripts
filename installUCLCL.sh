pip install cython
sudo apt-get purge cmake
sudo apt-get install OpenSSL*
sudo apt-get install libssl-dev
sudo apt-get install libgtest-dev
#download and compile CMAKE lastest version at https://cmake.org/download/ - download source
cd diretoriofonte cmake
./bootstrap && make && sudo make install
sudo cp /usr/local/include/ /usr/include/ -r
sudo cp /usr/local/lib/ /usr/lib/ -r
sudo cp /usr/local/bin/ /usr/bin/ -r
sudo apt-get install libboost-all-dev
sudo apt-get install libeigen3-dev
sudo apt-get install libfftw3-dev libfftw3-doc
sudo apt-get install build-essential manpages-dev
git clone https://gitlab.com/libeigen/eigen.git
git clone https://github.com/lesgourg/class_public
git clone https://github.com/miguelzuma/hi_class_public
git clone https://github.com/mblum/libgp.git
cmake CMakeLists.txt -B build "-DCLASS_ROOT=/home/user/class_public" "-DEIGEN3_INCLUDE_DIR=/home/user/eigen"
cmake CMakeLists.txt -B build "-DCLASS_ROOT=/home/user/hi_class_public" "-DEIGEN3_INCLUDE_DIR=/home/user/eigen"
cmake CMakeLists.txt -S $PWD -B build "-DCLASS_ROOT=/home/user/hi_class_public" "-DEIGEN3_INCLUDE_DIR=/home/user/eigen"
cmake CMakeLists.txt "-DEIGEN3_INCLUDE_DIR=/home/user/eigen" "-DCLASS_ROOT=/home/karin/class_public-2.5.0" -B /home/user/uclcl-master/build/


#baixar e instalar http://class-code.net/


