# 01_load_data.R
# Download and prepare Series 1 NHBE data from GSE147507
# Blanco-Melo et al. 2020 - Cell

library(GEOquery)
library(tidyverse)

# Download GSE147507
gse <- getGEO("GSE147507", GSEMatrix = TRUE)

# Download supplementary files (raw counts)
getGEOSuppFiles("GSE147507", baseDir = "data/")

# Load human raw counts
counts <- read.table(
  gzfile("data/GSE147507/GSE147507_RawReadCounts_Human.tsv.gz"),
  header = TRUE,
  sep = "\t",
  row.names = 1
)

# Select only Series 1 samples (NHBE Mock vs SARS-CoV-2)
series1_cols <- c("Series1_NHBE_Mock_1", "Series1_NHBE_Mock_2",
                  "Series1_NHBE_Mock_3", "Series1_NHBE_SARS.CoV.2_1",
                  "Series1_NHBE_SARS.CoV.2_2", "Series1_NHBE_SARS.CoV.2_3")

counts_s1 <- counts[, series1_cols]

# Save to data folder
write.csv(counts_s1, "data/series1_NHBE_counts.csv")

cat("Series 1 data saved:", nrow(counts_s1), "genes,", 
    ncol(counts_s1), "samples\n")