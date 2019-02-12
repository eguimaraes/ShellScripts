cd /tmp
curl -O https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
sha256sum Anaconda3-5.2.0-Linux-x86_64.sh
bash Anaconda3-5.2.0-Linux-x86_64.sh
source ~/.bashrc
conda list
conda create --name aprendendo python=3
#Ativar Ambiente
source activate aprendendo
conda create --name aprendendoP2 python=2
source activate aprendendoP2
conda install --name aprendendo scipy
conda install --name aprendendo -c openastronomy healpy 
conda install --name aprendendo -c anaconda hdf5 
conda install --name aprendendo -c anaconda astr
#Desativar Ambiente
source deactivate aprendendo
source deactivate aprendendoP2

