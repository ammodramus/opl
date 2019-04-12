#!/usr/bin/env bash

# Install mope.
git clone https://github.com/ammodramus/mope mopebuild
cd mopebuild
# NOTE: Before installing MOPE you may have to install other dependencies,
# including GSL, python-dev, emcee (Python module), and lru-dict (Python
# module). See https://github.com/ammodramus/mope/.
python setup.py install
# Specify --user if you don't have permissions for a distribution-wide
# installation.
#python setup.py install --user

cd ..
# Download the allele frequency transition files. This requires 1.3 GB of
# storage space.
mope download-transitions

genome_size=16569  # mtDNA (rCRS) genome size
# Using two temperatures [T=(1, 1.4)] seems to improve convergence.
num_temperatures=2
num_walkers=400  # number of chains in the ensemble MCMC
num_iterations=40000  # number of iterations to run each chain


# MOPE benefits from distributed computing via MPI.
#mpirun mope run transitions/drift_transitions.h5 ${num_iterations} --input-file final_input.txt --bottlenecks transitions/bottleneck_transitions.h5 --genome-size ${genome_size} --asc-prob-penalty 0.1 --num-walkers ${num_walkers} --min-het-freq 0.005 --chain-alpha 1.7 --num-temperatures ${num_temperatures} --drift-limits 5e-4 3 --mpi --min-phred-score 30 > chains.txt

# Otherwise you can perform multi-threaded calculations on a single machine
# using Python's multiprocessing.
num_proc=4
mope run transitions/drift_transitions.h5 ${num_iterations} --input-file input.txt --bottlenecks transitions/bottleneck_transitions.h5 --genome-size ${genome_size} --asc-prob-penalty 0.1 --num-walkers ${num_walkers} --min-het-freq 0.005 --chain-alpha 1.7 --num-temperatures ${num_temperatures} --drift-limits 5e-4 3 --num-processes $num_proc --min-phred-score 30 > chains.txt

# Either command will take a long time (~ 3000-5000 CPU hours, although that's
# going past MCMC convergence quite a way). Again, it's useful to be able to
# distribute computations across compute nodes (on a HPC cluster, say) using
# MPI.
