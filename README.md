# nanotail

<!-- badges: start -->
[![Build Status](https://travis-ci.org/smaegol/nanotail.svg?branch=master)](https://travis-ci.org/smaegol/nanotail)
[![codecov](https://codecov.io/gh/smaegol/nanotail/branch/master/graph/badge.svg)](https://codecov.io/gh/smaegol/nanotail)
<!-- badges: end -->

The goal of **NanoTail** is to provide a set of functions to manipulate and analyze data coming from polyA lengths estimations done using Oxford Nanopore Direct RNA sequencing and Nanopolish software. Existing solutions, like [Pipeline for testing shifts in poly(A) tail lengths estimated by nanopolish](https://github.com/nanoporetech/pipeline-polya-diff/) are, in our opinion, not sufficient for in-depth analysis of such data.
The software is still in thee development phase so all suggestions are welcome. Please also expect the code to be changed frequently, so use it with caution.

## Installation

You can install the developmental version of Nanotail with

``` r
install.packages("devtools")
devtools::install_github('smaegol/nanotail')
library(nanotail)
```

## Input data

NanoTail needs an output from `nanopolish polya` to work. It can read single output file with `read_polya_single`:

``` r
path <- "/location/of/nanopolish/output"
polya_data <- read_polya_single(path)
```

It can also read multiple samples at once and associate any metadata with them. 
Let's assume we have performed an experiment, targeting one of the polyA polymerases. 2 replicates were sequenced for control samples, and 2 replicates sequences for samples with mutant PAP, therefore after all analysis we have 4 files with `nanopolish polya` output. To read all of them at once, we can use command `read_polya_multiple` and associate metadata using samples_table data.frame:

``` r
samples_table <- data.frame(polya_path = c(path1,path2,path3,path4),
                            sample_name =c("wt1","mu1","wt2","mut2"),
                            group = c("wt","mut","wt","mut"))
polya_data_multiple <- read_polya_multiple(samples_table)
```

To obtain nanopolish predictions one can use [Pipeline for calling poly(A) tail lengths from nanopore direct RNA data using nanopolish](https://github.com/nanoporetech/pipeline-polya-ng)

## Shiny App

Once data are imported they can be processed in the R environment using `nanotail` functions described below or, more convenient, the interactive Shiny app can be launched, allowing for easy exploration of obtained data. To launch the app for the data imported above:

``` r
nanoTailApp(polya_table = polya_data_multiple)

```

## Nanopolish output QC

To get overall information about the output of NanoPolish polya analysis, please use 'get_nanopolish_processing_info()' function. Obtained sumary can be plotted using `plot_nanopolish_qc()`. Summary of the analysis is also shown in the "QC info" tab of the Shiny App.

![Nanopolish polya QC info shown in the Shiny App](https://github.com/smaegol/nanotail/blob/master/screenshots/screenshot_qc.png)


## Global distribution of polyA lengths

Global distribution of polyA tails lengths can be plotted with 'plot_polya_distribution()` function, which produces the density plot, allowing for comparison of distribution of polyA lengths between samples.

![Example global distribution density plot](https://github.com/smaegol/nanotail/blob/master/screenshots/screenshot_global.png)



## Statistical analysis of polyA predictions

NanoTail is intended to analyze differential adenylation. For this purpose 3 statistical tests can be employed, allowing or comparison of polyA lengths of individual transcripts between selected conditions: 
* Wilcoxon rank-sum test (Mann-Whitney U-test)
* Kolmogorov-Smirnov test of the equality of disributions
* generalized linear model, with post-hoc Tukey test

Differential adenylation analysis can be performed with the `calculate_polya_stats` function, or within the "Differential adenylation" tab in the Shiny App.

![Differential adenylation tab](https://github.com/smaegol/nanotail/blob/master/screenshots/screenshot_differential_adenylation.png)


## Differential expression analysis

NanoTail provides also possibility of very basic differential expression testing, using binomTest from the edgeR package. This functionality is still in the development and may not work as expected.

![Differential adenylation tab](https://github.com/smaegol/nanotail/blob/master/screenshots/screenshot_differential_expression.png)


## Citation

Please cite NanoTail as:
Krawczyk PS et al., NanoTail - R package for exploratory analysis of Nanopore Direct RNA based polyA lengths estimations

Preprint manuscript in the preparation.


## TBD & plans

* Import of polya predictions from software other then NanoPolish (poreplex,tailfindr,?)
* Analysis of predictions based on genome-mapping (now only transcriptome-mapping is supported)
* Annotation of results and enrichment analysis
* Squiggle visualization of polyA tails

## Support

Any issues connected with the NanoTail should be addressed to Pawel Krawczyk (p.krawczyk (at) ibb.waw.pl). 
