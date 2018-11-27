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
Milestone 1 (11/13/18): There was a lot of problem in seting up the STAR. There's no proper gcc on my computer. I tried to install the miniconda to help me install the STAR. However, when I tried to install the pipline, there are some problem. Although I can successfully install the STAR, at least seems like succeed. But when I run STAR to run the alignment, it tooks forever (more than 1 day, and still not work). 

Milestone 2 (11/20/18): Using the STAR on the server to align the DNA. Upload all my files to the server. And after the alignment, downlosd the Sam and Bam files to my computer. Then use the featurecounts gets the counts. Then I write the counts into a csv file and read the file. When I read the file there was an error: "header and 'col.names' are of different lengths", So I changed the Header=TRUE, and it worked. When created the dds dataset, there was an error:"some values in assay are negative" However, I couldn't find any nagetive data. SO I checked the summary(is.numeric(countdata[,1])), and add "row.name=1" when I read the files, and it worked. After that, DESeq(dds) didn't work.

Milestone 3 (11/27/18):  For the DESeq(dds), it did't work because I do not have the replicates. I tried to install the previous version of the DESeq. And I find that version 3.6 didn't fit the newest R version. But for version 3.7, although it had a warning message, but it worked. So I used the 3.7 version to do the DESeq and get the folder changes. And when I get the p value, I found that I cannot get the p-value because there's no replicates. So I got 4 more data from our lab which are the WT controls. and then I got the p-value. Since I want to get the differences between the genes changes from NCC to CMC in different type of cells. So I want to draw the heatmap for an combination of  50 most changes genes in each group. When I caculate the fold change, I realized that I can only caculate the fold changes between 3 groups which didn't include the G08 and G08-corracted groups which I want to get. So I separated my data and got the top 50 genes in each groups, and merged them together to get the complete list. I suddently realized that many of my genes have a count = 0, which will make the fold change became NA. So I went bach to the begining and add a 0.5 to every words when making the counts.csv and run the following steps again.Draw a Volcano plot by plotting p-value (log) vs. fold-change.  Using Salmon align the genome and get the TRMS.
## User Interface
Diagram pipeline and powerpoint.

## Dependencies

## Known issue

## Road Map

## Installation
