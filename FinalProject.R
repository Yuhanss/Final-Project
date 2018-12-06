#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(Rsamtools)
library(Rsubread)
library(gplots)
library('RColorBrewer')
library(dplyr)
library(plotly)
library(DESeq2)
library(apeglm)
library(ggrepel)
library(EnhancedVolcano)
library(pheatmap)
library(vsn)
setwd("/Users/lundai/Desktop/RNA-seq-compare")
counts <- read.csv(file = "counts.csv",sep = "\t",header = TRUE, row.names = 1)
#Error:header and 'col.names' are of different lengths.Solution:add Header=TRUE
names(counts)[1:8] <- c("WT_NCC_1","WT_NCC_2","G08_corr_NCC","G08_NCC","WT_CMC_1","WT_CMC_2","G08_corr_CMC","G08_CMC")
#Coltable <- read.csv(file = "Coltable.csv",sep = ",",header = TRUE, row.names = 1)

Col <- read.csv(file = "Col.csv",sep = ",",header = TRUE, row.names = 1)
#DEseq2 
#vignette("DESeq2")
dds <- DESeqDataSetFromMatrix(countData = counts,
                              colData = Col,
                              design = ~ Condition)
#some values in assay are negative???Didn't find any nagetive data
#check: summary(is.numeric(countdata[,1])), logical,solution:add row.name=1
dds

dds <- DESeq(dds)
res <- results(dds)
res

res_WT <- results(dds, contrast=c("Condition","control1","test1"))
res_G08_corr <- results(dds, contrast=c("Condition","control2","test2"))
res_G08 <- results(dds, contrast=c("Condition","control3","test3"))

###########
# Define UI for application that draws a histogram
ui <- fluidPage(
  pageWithSidebar(
    
   headerPanel("The change of gene expressions from NCC to CMC"),
   
   sidebarPanel(
#     selectInput("data","Choose a data:", list("WT", "G08_corr","G08"))
      checkboxInput('WT', 'WT',TRUE),
      checkboxInput('G08_corr', 'G08_corr',FALSE),
      checkboxInput('G08', 'G08', FALSE)
     ),
      
   mainPanel(
         plotOutput("Plot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
  #plot it normally with ggplot:
  output$Plot <- renderPlot({ 
    if (input$WT)
    p<-EnhancedVolcano(res_WT,
                    lab = rownames(res_G08),
                    x = "log2FoldChange",
                    y = "pvalue")
    if (input$G08_corr)
      p<-EnhancedVolcano(res_G08_corr,
                         lab = rownames(res_G08),
                         x = "log2FoldChange",
                         y = "pvalue")
    if (input$G08)
      p<-EnhancedVolcano(res_G08,
                         lab = rownames(res_G08),
                         x = "log2FoldChange",
                         y = "pvalue")
#    p <- ggplot(data, aes_string(
#      x=input$x, y=input$y))
#    p<- p + geom_point(aes_string(y=input$y))
#    coord_cartesian() +ylab("pvalue") + xlab("log2 fold change")
    print(p)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

