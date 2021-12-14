#!/bin/bash

# Usage:
# csmit -m 10G -c 1 "bash ./zcat_fastq_gz_gzip_best.sh AtDMC1_S2 DMC1_V5_Rep1_ChIP_R1 DMC1_V5_Rep1_ChIP_R2"

inName=$1
outNameR1=$2
outNameR2=$3

if [ ! -f "$outNameR1.fastq.gz" ]; then
  zcat /home/dh580/20190917_dh580_Athaliana_ChIPseq_DMC1/$inName"_L001_R1_001.fastq.gz" \
       /home/dh580/20190917_dh580_Athaliana_ChIPseq_DMC1/$inName"_L002_R1_001.fastq.gz" \
       /home/dh580/20190917_dh580_Athaliana_ChIPseq_DMC1/$inName"_L003_R1_001.fastq.gz" \
       /home/dh580/20190917_dh580_Athaliana_ChIPseq_DMC1/$inName"_L004_R1_001.fastq.gz" \
       | gzip -c -k --best > $outNameR1.fastq.gz;
else
  echo "skipping $outNameR1"
fi

if [ ! -f "$outNameR2.fastq.gz" ]; then
  zcat /home/dh580/20190917_dh580_Athaliana_ChIPseq_DMC1/$inName"_L001_R2_001.fastq.gz" \
       /home/dh580/20190917_dh580_Athaliana_ChIPseq_DMC1/$inName"_L002_R2_001.fastq.gz" \
       /home/dh580/20190917_dh580_Athaliana_ChIPseq_DMC1/$inName"_L003_R2_001.fastq.gz" \
       /home/dh580/20190917_dh580_Athaliana_ChIPseq_DMC1/$inName"_L004_R2_001.fastq.gz" \
       | gzip -c -k --best > $outNameR2.fastq.gz;
else
  echo "skipping $outNameR2"
fi
