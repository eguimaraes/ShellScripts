sudo apt-get update -y && sudo apt-get upgrade -y
cd /tmp/
wget https://repo.anaconda.com/archive/Anaconda3-5.0.1-Linux-x86_64.sh
md5sum Anaconda3-5.0.1-Linux-x86_64.sh
bash Anaconda3-5.0.1-Linux-x86_64.sh
source ~/.bashrc
conda create --name ekis python=3
source activate ekis
