#https://askubuntu.com/questions/623578/installing-blas-and-lapack-packages
sudo apt-get install libblas-dev liblapack-dev
sudo apt-get install gfortran
sudo apt-get install libatlas-base-dev
sudo rm /var/lib/apt/lists/lock
sudo apt-get update
sudo apt-get install libblas-dev checkinstall
sudo apt-get install libblas-doc checkinstall
sudo apt-get install liblapacke-dev checkinstall
sudo apt-get install liblapacke-doc checkinstall
