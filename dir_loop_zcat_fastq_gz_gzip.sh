#!/bin/bash

# Usage:
# csmit -m 10G -c 1 "bash ./dir_loop_zcat_fastq_gz_gzip.sh"

for dir in SRX*/; do
  dir=${dir::-1}

  cd ${dir}

  if [ ! -f ../${dir}_R1.fastq.gz ]; then
    if (( $(ls -1 *_1.fastq.gz | wc -l) > 1 )); then
      zcat *_1.fastq.gz \
      | gzip -c -k --fast > ../${dir}_R1.fastq.gz
    else
      cp *_1.fastq.gz ../${dir}_R1.fastq.gz
    fi
  else
    echo "skipping ../${dir}_R1.fastq.gz"
  fi

  if [ ! -f ../${dir}_R2.fastq.gz ]; then
    if (( $(ls -1 *_2.fastq.gz | wc -l) > 1 )); then
      zcat *_2.fastq.gz \
      | gzip -c -k --fast > ../${dir}_R2.fastq.gz
    else
      cp *_2.fastq.gz ../${dir}_R2.fastq.gz
    fi
  else
    echo "skipping ../${dir}_R2.fastq.gz"
  fi

  cd ..
done
