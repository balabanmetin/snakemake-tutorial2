# Snakemake and HPC tutorial

Snakemake is a python based workflow management tool. It's very useful when you have a project where you chain a bunch of tools to get a result (e.g. benchmarking your software) and some parts must be distributed in HPC. It also prevents unneccessary re-running.

It would be recommended to use the login node in Cycles for this tutorial.

### Installation

Requirements: Python and anaconda/miniconda

I created a conda environment for this tutorial on Cycles. You can activate it as follows:

`conda activate /n/fs/ragr-data/users/balaban/miniconda3/envs/snakemake-tutorial/snakemake-tutorial`

If you want to test this on a different machine, you can create this environments as follows:

`conda create -n snakemake-tutorial -c bioconda -c conda-forge snakemake bcftools samtools`

Clone this repository and cd to it:

`git clone https://github.com/balabanmetin/snakemake-tutorial2.git && cd snakemake-tutorial2`

We are ready to go!

