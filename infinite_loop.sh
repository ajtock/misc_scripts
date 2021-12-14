#!/bin/bash

# Occupy an off-target node on the cluster with
# an infinite loop "dummy" job, allowing for a
# real job to be allocated to a target node
# NB: please remove dummy jobs from the cluster using
# condor_rm jobID once your real job has been allocated
# to the target node

# Usage on hydrogen node7:
# /scripts/csmit -m {real_job_memory}G -c {real_job_CPU_number} "bash ./infinite_loop.sh"

while :
do
  echo "use condor_rm jobID to stop dummy job once real job has been allocated to target node"
  sleep 1
done
