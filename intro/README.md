In this tutorial, we will implement a simple workflow described in `workflow.sh`.

The workflow takes a bamfile as an input and calls variants in each chromosome separately and filters low depth calls. The calls for each chromosome is written to a different file. In the final step, the calls for each chromosome is concatenated into a single VCF file.

Take a look at `data` directory where we have a single BAM file.

Let's begin with genotyping chromosome `22` using Snakemake.

The default workflow filename for Snakemake is `Snakefile`. 

Note that `{sample}` cannot be referred directly inside shell. You can refer it using `{wildcards.sample}`

For a snakemake dry run:

`snakemake -np -c1 all`

To execute the main rule (all):

`snakemake -c 1 all`

What happens we execute the command above once more?

`snakemake -c 1 all`

You can run another single chromosome like this:

`snakemake -c 1 sample1/variants/18.vcf.gz`


