#! /bin/bash

SAMPLE=sample1
REF=/n/fs/ragr-data/datasets/ref-genomes/GRCh37_10X/fasta/genome.fa

mkdir -p $SAMPLE/variants/

# process each chromosome separately

for CHR in {1..22}; do
	# generate a pileup of reads in each position in chromosme CHR and pipe the output
	bcftools mpileup data/${SAMPLE}.bam -Ou -f $REF --skip-indels -a INFO/AD,AD,DP -q 0 -Q 11 -d 300 -r $CHR |
	# call variants
	bcftools call -mv -Ou | 
	# exclude low depth DP < 8
	bcftools filter -e 'FMT/DP < 8' -Oz -o $SAMPLE/variants/$CHR.vcf.gz
done

# concatenate vcf files from each chromosome
bcftools concat $SAMPLE/variants/{1..22}.vcf.gz -Oz -o $SAMPLE/calls.vcf.gz

