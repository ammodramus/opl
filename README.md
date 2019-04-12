This repository contains scripts and Jupyter notebooks for performing many of
the analyses presented in "The dynamics of mitochondrial DNA in human tissues
and pedigrees: Strong effects of the germline bottleneck, mother's age, and
selection". In particular, this repository focuses on the paper's ontogenetic
phylogeny likelihood (OPL) methodology.

The recommended order of analysis is:

1) `run_mope.sh`  --- Run this script (or run the listed commands individually)
to install MOPE and generate MCMC samples of genetic drift and mutation rate
parameters.

2) `run_de_novo_probabilities.sh`   --- Run this script to calculate posterior
probabiltiies that each observed heteroplasmic mutation is de novo somewhere on
the phylogeny of the sampled tissues.


3) `postmutloc.ipynb` --- Carry out calculations and make plots related to the
above posterior de novo probabilities.

4) `germline_de_novo_regressions.ipynb` --- Perform regressions of number of
germline de novo mutations against age.

4) `persistence.ipynb` --- Carry out calculations and make plots related to
heteroplasmy persistence in the human population.

5) `mutation_enrichment.ipynb` --- Perform calculations on mutation enrichment
in different mtDNA position categories, presented in Table S2.
