# Final-Project
## Description
In our lab, we are interested in one disease called CHARGE syndrome, which caused by mutating the CHD7 gene in patients. For normal cells, during the process of inducing neural crest cells(NCC) to form cranial mesenchymal cells(CMC), the shape of the nucleus of cells are changing, which may  related to the genome expression reorganization.  However, this nucleus shape changing does not appear in the CHARGE syndrome patient cells(G082 cell lines), and comes back in the CHD7 corrected cell lines. Therefore, we want to know whether the gene expression during the transition from NCC to CMC has any defects, by compare the RNA-seq data at 0 hours(NCC) and 96 hours(CMC) in both CHARGE patient cells, and corrected cells as control. 

I am going to use STAR to align the genome. Later, use the featurecounts to get the reading counts and use DEseq2 to do the differential gene analysis. In the second part, usint Salmon to get the TPMS, and using EdgeR, DEseq2 or LMMA to analyze the TPM data.

## Datasets
G082 and G082 corrected cell lines were both used to collect samples at day 0 (NCC) and day 96 (CMC), respectively, and sent to do the RNA-seq. G8082 corrected line is the control.

## Proposed Analysis.  
Heatmap to show the differences between the samples, using the STAR data.

PCA to find out the components that influnced in the G082 cells, using the Salmon data.

## Proposed Timeline & Major milestones (or segments)
Milestone 1 (11/13/18): There was a lot of problem in seting up the STAR. 

Milestone 2 (11/20/18): Using the STAR aligner align the DNA. Then use the featurecounts get the counts. After that, use DESeq get the p-value and folder changes.

Milestone 3 (11/27/18):  Plot Heatmap for top 50 differential genes by p-values. Draw a Volcano plot by plotting p-value (log) vs. fold-change. Since I don't have replecates, so I cannot caculate the p-value. Using Salmon align the genome and get the TRMS. Draw PCA figure and draw pipeline. 

## User Interface
Diagram pipeline and powerpoint.

## Dependencies

## Known issue

## Road Map

## Installation
