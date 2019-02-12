cd /tmp
curl -O https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
sha256sum Anaconda3-5.2.0-Linux-x86_64.sh
bash Anaconda3-5.2.0-Linux-x86_64.sh
source ~/.bashrc
conda list
conda create --name aprendendo python=3
source activate aprendendo
conda install --name aprendendo scipy
conda install -c openastronomy healpy 
conda install -c anaconda hdf5 
