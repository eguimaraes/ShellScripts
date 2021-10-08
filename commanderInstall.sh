git clone https://github.com/hke/Commander.git
cd Commander
mkdir build
cd build
cmake -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc -DCMAKE_Fortran_COMPILER=ifort -S $PWD -B $PWD/build
