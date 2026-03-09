#!/bin/bash 
#SBATCH --account=def-makarenk 
#SBATCH --time=2:00:00 
#SBATCH --mem=1G 
#SBATCH --output=%x.o%j 
#SBATCH --error=%x.e%j

# modules
module purge 2>/dev/null 
module load fastqc

cd $SLURM_SUBMIT_DIR

# experiment
fastqc --outdir ../../results/fastqc \
../../data/SRR576933.fastq.gz\
&> fastqc_SRR576933.sh.log

# control
fastqc --outdir ../../results/fastqc \
../../data/SRR576938.fastq.gz\
&> fastqc_SRR576938.sh.log