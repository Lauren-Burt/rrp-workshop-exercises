#!/bin/bash

# setting to help with error handling 
set -euo pipefail 

#define URLs and file paths

FASTQ_R1="SRR11518889_1.fastq.gz"
FASTQ_R2="SRR11518889_2.fastq.gz"
FASTQ_URL="ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR115/089/SRR11518889"

#where we are putting it on our computer 
DATA_DIR=../data/raw/fastq/SRP255885
mkdir -p ${DATA_DIR}

## dowload the R1 file ##
echo "dowloading the R1 file"

#Download
curl -O ${FASTQ_URL}/${FASTQ_R1}

# move the file 
mv ${FASTQ_R1} ${DATA_DIR}/

echo "The R1 file has this many lines"

# print the number of lines in the file
gunzip -c ${DATA_DIR}/${FASTQ_R1} | wc -l

echo "downloading the R2 file" 

#Download
curl -O ${FASTQ_URL}/${FASTQ_R2}

# move the file 
mv ${FASTQ_R2} ${DATA_DIR}/

echo "The R2 file has this many lines"

# print the number of lines in the file
gunzip -c ${DATA_DIR}/${FASTQ_R2} | wc -l