#!/bin/bash

# Usage on hydrogen cluster node7:
# /scripts/csmit -m 3G -c 1 "./at9578frame4.sh"

source activate repeats
./at9578frame4.r
source deactivate
