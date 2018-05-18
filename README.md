# nf_coverage_demo
Nextflow demo plotting mean coverage over a series of BAM files. Two parameters are required:
- `--bam_folder`: folder containing BAM files
- `--bed`: bed file listing regions to consider to calculate coverage

## Download test data set
```
git clone https://github.com/iarcbioinfo/data_test
```
## Usage
```
nextflow run iarcbioinfo/nf_coverage_demo  -with-docker --bam_folder data_test/BAM/BAM_multiple/ --bed data_test/BED/TP53_exon2_11.bed
```
