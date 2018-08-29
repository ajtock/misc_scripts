#!/bin/bash

# Download only fastq files from SRA,
# with cores (-c) equal to the number of SRA IDs to be processed in parallel
# Example usage via condor submission system on hydrogen node7:
# csmit -m 20G -c 2 "bash fastqDump_splitfiles.sh SRR5681073 SRR5681074"
# SRR5681073 corresponds to SRX2916398: GSM2667837: ChIPseq_col_preimmune; Arabidopsis thaliana; ChIP-Seq
# SRR5681074 corresponds to SRX2916399: GSM2667838: ChIPseq_col_antiNRPE1; Arabidopsis thaliana; ChIP-Seq
# Study: RNA-directed DNA methylation involves co-transcriptional small RNA-guided slicing of Pol V transcripts in Arabidopsis

for inFile in "$@"
do
( fastq-dump --split-files $inFile ) &
done
wait
