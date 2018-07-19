#!/bin/bash

#########################################################################
#               Pooling NextSeq 500 fastq files                         #
# Adapted from Sebastian Mueller's Snakemake-based solution to creating #
# pooled fastq files for each sample in a NextSeq 500 project           #
# https://github.com/seb-mueller/pooling-nextseq-fastq                  #
#########################################################################  

# Usage:
# fastq_pooling_NextSeq.sh 170918_Chris_RNAseq_Col_kss 

# Pooling Illumina NextSeq 500 fastq files using a Snakemake directive
## This is meant to be an automated pipeline to merge fastq files from
## the NextSeq 500 machine
## The output of the NextSeq 500 machine is a bit convoluted,
## but contains all we need in a structured way
## Annoyingly, the data are split up into 4 lanes due to the nature of the machine
## These can be considered as technical replicates and should be pooled,
## which is the pupose of this program

# Requirements
    # Unix (tested on Linux only)
    # Snakemake
    # Python 3.5+ (optional)
    # basemount (optional)

# Usage
# Download or clone this repository in your standard software directory
## (doesn't need to be where the NextSeq project data are)
# e.g.,
#mkdir ~/tools
#cd ~/tools
#git clone https://github.com/seb-mueller/pooling-nextseq-fastq.git

# Define base directory where all Sainsbury Laboratory NextSeq 500 project directories
## and subdirectories are (should be) archived
## Only Greg and a few others have permission to write to this directory, and so he can
## move NextSeq projects downloaded in their entirety to this archive location
baseDir=/data/archive_data/all_sainsbury_data
# Define NextSeq 500 project directory name using argument $1 (see "Usage" above)
NextSeqDir=$1
NextSeqProj=$1

# Create a symbolic link to your archived NextSeq 500 project directory in your home directory
ln -s $baseDir/$NextSeqDir/ ~/

# Make a project directory named the same or similarly to your $NextSeqDir
## under an "analysis" directory under your home directory.
## As $NextSeqProj may be named the same as $NextSeqDir, it is important to
## differentiate your $NextSeqProj directory by creating it under ~/analysis/
#mkdir ~/analysis
mkdir ~/analysis/$NextSeqProj
cd ~/analysis/$NextSeqProj

# Follow steps in Sebastian Mueller's Snakemake-based solution to creating
## pooled fastq files for each sample in a NextSeq 500 project:
## https://github.com/seb-mueller/pooling-nextseq-fastq

# Note that --dir below is followed by the location of the soft (symbolic) link
## to your NextSeq project directory (~/$NextSeqDir) and not ~/analysis/$NextSeqProj
## Path to python3 is specified because Python 3.5+ required 
/applications/anaconda/anaconda3/bin/python3 ~/tools/pooling-nextseq-fastq/generate_config.py --dir ~/$NextSeqDir

snakemake -s ~/tools/pooling-nextseq-fastq/Snakefile

