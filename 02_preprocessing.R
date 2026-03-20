# 02_preprocessing.R
# Preprocessing and quality control for Series 1 NHBE data

library(DESeq2)
library(tidyverse)

# Load counts
counts_s1 <- read.csv("data/series1_NHBE_counts.csv", 
                      row.names = 1)

# Create sample metadata
col_data <- data.frame(
  sample = colnames(counts_s1),
  condition = c("Mock", "Mock", "Mock", 
                "SARS_CoV_2", "SARS_CoV_2", "SARS_CoV_2"),
  row.names = colnames(counts_s1)
)

col_data$condition <- as.factor(col_data$condition)

# Check
print(col_data)

# Create DESeq2 object
dds <- DESeqDataSetFromMatrix(
  countData = counts_s1,
  colData = col_data,
  design = ~ condition
)

# Set reference level
dds$condition <- relevel(dds$condition, ref = "Mock")

# Filter lowly expressed genes
keep <- rowSums(counts(dds) >= 10) >= 3
dds <- dds[keep, ]
cat("Genes after filtering:", nrow(dds), "\n")

# Save processed object
saveRDS(dds, "output/dds_preprocessed.rds")
cat("Preprocessed object saved\n")
