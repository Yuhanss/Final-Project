# Final-Project: http://rpubs.com/Yuhan/FinalProject
## Description
In our lab, we are interested in one disease called CHARGE syndrome, which caused by mutating the CHD7 gene in patients. For normal cells, during the process of inducing neural crest cells(NCC) to form cranial mesenchymal cells(CMC), the shape of the nucleus of cells are changing, which may  related to the genome expression reorganization.  However, this nucleus shape changing does not appear in the CHARGE syndrome patient cells(G082 cell lines), and comes back in the CHD7 corrected cell lines. Therefore, we want to know whether the gene expression during the transition from NCC to CMC has any defects, by compare the RNA-seq data at 0 hours(NCC) and 96 hours(CMC) in both CHARGE patient cells, and corrected cells as control. 

I am going to use STAR to align the genome. Later, use the featurecounts to get the reading counts and use DEseq2 to do the differential gene analysis. 

## Datasets
WT, G082 and G082 corrected cell lines were both used to collect samples at day 0 (NCC) and day 96 (CMC), respectively, and sent to do the RNA-seq. 

## Proposed Analysis.  
Heatmap to show the differences between the samples, using the STAR data. 
Volcano plot to show the differences gene between NCC and CMC in different cell types. 
PCA to find out the components that influnced in the G082 cells.

## Proposed Timeline & Major milestones (or segments)
Milestone 1 (11/13/18): There was a lot of problem in seting up the STAR, since seems that there's no proper gcc on my computer. I tried to install the miniconda to help me install the STAR, however, when I tried to install the pipline, there are some problem. Although I can successfully install the STAR, at least seems like succeed, when I run STAR to run the alignment, it tooks forever (more than 1 day, and still not work). 

Milestone 2 (11/20/18): Using the STAR on the server to align the DNA, I uploaded all my files to the server. And after the alignment, download the Sam and Bam files to my computer. Then use the featurecounts gets the counts. After that, DESeq(dds) didn't work.

Milestone 3 (11/27/18):  For the DESeq(dds), it did't work because I do not have the replicates, so I got 4 more data from our lab which are the WT controls, and then got the fold change and p-value. I suddently realized that many of my genes have a count = 0, which will make the fold change became NA, so I add 1 to every counts. Heatmap of the gene counts and fold change between NCC and CMC were drawn. Volcano plot by plotting p-value (log) vs. fold-change was drawn.  

## User Interface
Using the deaw.io to draw the diagram pipeline.

## Installation
### STAR
Follow the instructions to install STAR at: https://github.com/alexdobin/STAR (It may requir the right version of gcc, it didn’t work on my computer, so I did the alignment on the server.) 
Manual: https://github.com/alexdobin/STAR/blob/master/doc/STARmanual.pdf

### Homo apaiens GRCh38 template
Download the Homo sapiens GRCh38 genome at: https://support.illumina.com/sequencing/sequencing_software/igenome.html

### R libraries
1. Featurecounts
     install.packages("BiocManager")
     BiocManager::install("Rsubread", version = "3.8")
Manual: https://www.rdocumentation.org/packages/Rsubread/versions/1.22.2/topics/featureCounts

2. DESeq2
     BiocManager::install("DESeq2", version = "3.8")
Manual: vignette("DESeq2")
     
3. pheatmap
     install.packages(ggrepel)
     install.packages(pheatmap)

4. Enhancedvolcano
     BiocManager::install("EnhancedVolcano", version = "3.9")
     
5. Apeglm
     BiocManager::install("apeglm", version = "3.8")
     
