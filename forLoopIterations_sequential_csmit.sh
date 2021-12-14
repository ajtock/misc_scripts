#!/bin/bash

# Sequentially submit Rscript jobs to Condor

# Usage on node7:
# nohup bash forLoopIterations_sequential_csmit.sh

# Note in the example below, 9 is added to the "start" iterations 1, 11 and 21 to define the "stop" iterations
# See usage example in forLoopIterations.R 
for x in 1 11 21
do
  /scripts/csmit -m 10G -c 1 "/applications/R/R-3.5.0/bin/Rscript forLoopIterations.R $x $(($x + 9))" & sleep 10;
done
