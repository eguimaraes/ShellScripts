0) Get access to a Linux-based machine with minimum of 128GB RAM

1) Download and compile the Commander AST9240_2021_sim branch; see
   https://cosmoglobe.github.io/Commander/#/

   TL;DR
   a) cd your_preferred_src
   b) git clone https://github.com/Cosmoglobe/Commander.git
   c) cd Commander
   d) git checkout AST9240_2021_sim
   e) mkdir build; cd build
   f) module load intel cmake
   g) For Intel compilation (recommended): cmake -DCMAKE_INSTALL_PREFIX=your_preferred_src/Commander/build -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc -DCMAKE_Fortran_COMPILER=ifort -DMPI_C_COMPILER=mpiicc -DMPI_CXX_COMPILER=mpiicpc -DMPI_Fortran_COMPILER=mpiifort -DFFTW_ENABLE_AVX2=OFF ..
   h) cmake --build . --target install -j 8
   i) Add the following lines to your .bashrc file:

      ---------------------------
      ulimit -Sd unlimited
      ulimit -Ss unlimited
      ulimit -c 0
      ulimit -n 2048
      
      export COMMANDER_PARAMS_DEFAULT=your_preferred_src/commander3/parameter_files/defaults
      export HEALPIX=/path/to/Healpix/root
      --------------------------

2) Download data, parameter file and runscript:
   a) cd your_preferred_workdir
   b) wget http://tsih3.uio.no/www_cmb/hke/AST9240/AST9240_TODsim_project.tar
   c) tar xvf AST9240_TODsim_project.tar
   d) cd AST9240
   e) Change all pathnames in param_sim.txt, data/filelist_030_simulations.txt
      and data/filelist_030_data.txt
   f) Edit 'build' and numprocs in run_sim.sh

3) Produce simulations (TOD files will end up in data/LFI_030_sim):
   a) Verify that the following parameters are set in params_sim.txt:
       - ENABLE_TOD_SIMULATIONS  = .true.
       - SIMS_OUTPUT_DIRECTORY   = your_preferred_workdir/data/LFI_030_sim
       - BAND_TOD_FILELIST&&&    = filelist_030_data.txt
   b) ./run_sim.sh
   c) Move input sims to safe place: mv chains_sim chains_sim_input

4) Analyse simulations (output will end up in chains_sim):
   a) Create an ideal CMB (temperature+polarization) realization from
      the Planck 2018 best-fit power spectrum at Nside=1024, lmax=2000 
      and 14 arcmin FWHM resolution:
      http://pla.esac.esa.int/pla/aio/product-action?COSMOLOGY.FILE_ID=COM_PowerSpect_CMB-base-plikHM-TTTEEE-lowl-lowE-lensing-minimum-theory_R3.01.txt
   b) Change the following parameters in param_sim.sh:
       - ENABLE_TOD_SIMULATIONS  = .false.
       - BAND_TOD_FILELIST&&&    = filelist_030_sim.txt
       - COMP_INPUT_AMP_MAP&&    = your_cmb_map.fits
   c) mkdir chains_sim
   d) ./run_sim.sh (let it run for at least 10 samples before proceeding;
      for the final results, we should have 1000. But it's useful to verify that
      the code is producing something useful before making the long run, so check
      often and early :-))

5) Compute posterior mean and RMS for the following quantities, using your
   favorite tools (healpy or whatever)
   a) CMB map (use cmb_c0001_k*.fits)
   b) Frequency sky map (use tod_030_map_c0001_k*.fits)
   c) Correlated noise (use tod_030_ncorr_c0001_k*.fits)
   d) Absolute gain for detector 27M (use chain_c0001.h5)
   e) Gain as a function of time for detector 27M (use chain HDF file)
   f) Chisq as a function of time for detector 27M (use chain HDF file)

6) Compute (posterior mean - input)/posterior rms for each quantity, and
   compare with an N(0,1) distribution
