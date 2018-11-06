# Final-Project
## Description
In our lab, we are interested in one disease called CHARGE syndrome, which caused by mutating the CHD7 gene in patients. For normal cells, during the process of inducing neural crest cells(NCC) to form cranial mesenchymal cells(CMC), the shape of the nucleus of cells are changing, which may  related to the genome expression reorganization.  However, this nucleus shape changing does not appear in the CHARGE syndrome patient cells(G082 cell lines), and comes back in the CHD7 corrected cell lines. Therefore, we want to know whether the gene expression during the transition from NCC to CMC has any defects, by compare the RNA-seq data at 0 hours(NCC) and 96 hours(CMC) in both CHARGE patient cells, and corrected cells as control. I am going to use STAR to align the genome. 

## Datasets
G082 and G082 corrected cell lines were both used to collect samples at day 0 (NCC) and day 96 (CMC), respectively, and sent to do the RNA-seq. G8082 corrected line is the control.

### Prototype
Analyze the first 100 genes that are specifically expressed in CMC.

## Proposed Analysis.  
Venn graph to find the overlaped gene expression. 

Heatmap to show the differences between the samples.

PCA to find out the components that influnced in the G082 cells.

GO analysis to find out which type of genes are influenced most.

Motif analysis to see which target motif is influenced.

## Proposed Timeline & Major milestones (or segments)
Milestone 1 (11/13/18): Using HPC to line up the fastq data. Generate the list which can be worked on later.

Milestone 2 (11/20/18): Find out the sepecifiic gene expression in NCC and CMC for each cell types. And generate the list of the specific genes to do the following analysis.

Milestone 3 (11/27/18): Draw graphs, and analyze which genes are influenced in G082 cells.

## User Interface
Diagram pipeline and powerpoint.

## Dependencies

## Known issue

## Road Map

## Installation
