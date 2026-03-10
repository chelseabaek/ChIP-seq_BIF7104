#!/bin/bash 
#SBATCH --account=def-makarenk 
#SBATCH --time=2:00:00 
#SBATCH --mem=1G 
#SBATCH --output=%x.o%j 
#SBATCH --error=%x.e%j

# modules
module purge 2>/dev/null 
module load mugqic/MACS/2.0.10.09132012
module load samtools

cd $SLURM_SUBMIT_DIR

samtools view -b ../../results/bowtie/SRR576933.sam > ../../results/MACS/SRR576933.bam
samtools view -b ../../results/bowtie/SRR576938.sam > ../../results/MACS/SRR576938.bam

samtools sort -o ../../results/MACS/SRR576933.sorted.bam ../../results/MACS/SRR576933.bam
samtools sort -o ../../results/MACS/SRR576938.sorted.bam ../../results/MACS/SRR576938.bam

# macs2 callpeak \
# -t ../../results/bowtie/SRR576933.sam \
# -c ../../results/bowtie/SRR576938.sam \
# -f SAM \
# -n "macs2" \
# -g 4639675 \
# --bw 400 \
# --keep-dup 1 \
# --bdg \
# --SPMR \
# &> ../../results/MACS/MACS.out

macs2 callpeak \
-t ../../results/MACS/SRR576933.sorted.bam \
-c ../../results/MACS/SRR576938.sorted.bam \
-f BAM \
-n "../../results/MACS/macs2" \
-g 4639675 \
--bw 400 \
--keep-dup 1 \
--nomodel \
--bdg \
--SPMR \
&> ../../results/MACS/MACS.out
