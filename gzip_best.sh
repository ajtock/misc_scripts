#!/bin/bash

# Example usage via condor submission system on hydrogen node7:
# csmit -m 1G -c 1 "bash gzip_best.sh PolIV_Rep2_ChIP_SRR788203.fastq"

file=$1

if [ ! -f "$file.gz" ]; then 
    gzip --best "$file"; 
else 
    echo "skipping $file"
fi

