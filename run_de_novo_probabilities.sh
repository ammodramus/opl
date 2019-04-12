#!/usr/bin/env bash

# This assumes that you have already run mope (see run_mope.sh) and produced
# the posterior samples in chains.txt. This script is for producing the
# posterior probabilities of de novo mutation.
num_proc=4
mope posterior-mut-loc transitions/drift_transitions.h5 transitions/bottleneck_transitions.h5 results/downsampled_chains.txt.gz 10000 --input-file input.txt --genome-size 16569 --min-het-freq 0.005 --drift-limits 5e-4 3 --num-processes $num_proc --min-phred-score 30
