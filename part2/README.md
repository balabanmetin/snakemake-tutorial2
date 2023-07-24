
Using the `expand` function, it is very easy to run the workflow on multiple samples. The command for running the workflow did not change:

`snakemake -c22 -np all`

So far we were running this workflow locally since we were specifying CPU resources using `-c 22` option. It is trivially simple to run the jobs in a distributed fashion on the compute nodes. I created a cluster profile for cycles HPC. The contents of this profile may seem complex. Fortunately, you can reuse the same profile I created on cycles with no changes! And with minimal (SLURM option -A and -P) to no changes, the same profile can be used in other clusters with SLURM job scheduler too.

Inspect `cycles-profile/config.yaml`

Once you have copied the profile directory `cycles-profile` somewhere, you can run your workflow as follows:

snakemake --profile cycles-profile all

When running in the cluster, jobs use the default CPU and memory resources defined in the profile configuration. You can customize the resource needs for each rule using `threads` or `resources` directives.

### Final remarks

Snakemake offers many more useful features. A short list is below

* Snakemake can track CPU and peak memory use for each job and write the statistics to the file indicated using `benchmark` directive

* Snakemake can keep the log files for each rule. Use `log` directive

* Snakemake supports running jobs in Docker containers using Singularity. This requires converting Docker container to Singularity. Running jobs using Singularity is a bit slow (activation part is slow). My personal choice is to create a conda environment for the application and install everything there. Also, did you note that I did not tell Snakemake to activate the `snakemake-tutorial2` environment where `bcftools` were installed? It exports the environment from shell where `snakemake` command is called. 

* Using `-f`, `-fF`, and `-R` you can rerun some parts of the workflow.

* Snakemake keeps track of the timestamps of the input/output files in the workflow. If an input file is edited upstream, it generates a plan to rerun jobs that depend on the edited file downstream and only reruns the necessary downstream parts.

* `concat_vcfs` rules expected exactly 22 input VCF files that correspons to each autosomal chromosome in human. In some applications, the number of input files may depend on the dataset. For example, a rule may take an undetermined number of gene alignments as an input. Snakemake can handle this scenario as well, you can ask me to show you some examples from my code offline.
 


