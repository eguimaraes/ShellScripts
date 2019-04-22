cd /tmp
curl -O https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
sha256sum Anaconda3-5.2.0-Linux-x86_64.sh
bash Anaconda3-5.2.0-Linux-x86_64.sh
source ~/.bashrc
conda list
conda create --name python3 python=3
#Ativar Ambiente
source activate python3
conda create --name python2 python=2
conda install --name python3 scipy
conda install --name python3 -c openastronomy healpy 
conda install --name python3 -c anaconda hdf5 
conda install --name python3 -c anaconda astr
conda install --name python3 -c anaconda astr
conda install --name python3 -c anaconda ipython
