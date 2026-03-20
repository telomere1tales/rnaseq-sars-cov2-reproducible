# 🧬 RNA-seq Analysis of SARS-CoV-2 Infection
## A Reproducible Bioinformatics Pipeline for Differential Gene Expression

## 📌 Overview

This project implements a **reproducible RNA-seq analysis pipeline** to 
investigate gene expression changes associated with SARS-CoV-2 infection 
in human airway epithelial cells.

By analyzing transcriptomic data from **Blanco-Melo et al. (2020)** — 
one of the most cited COVID-19 transcriptomics studies — the project 
identifies differentially expressed genes and biological patterns linked 
to the host response during infection.

The workflow emphasizes **reproducibility, transparency, and biological 
interpretability** — critical in modern bioinformatics research.

---

## 🎯 Objective

To analyze RNA-seq data from SARS-CoV-2 infection and identify gene 
expression changes that provide insight into disease-related biological 
processes.

---

## 🦠 Biological Context

SARS-CoV-2 infection triggers complex molecular responses in host cells. 
Understanding these responses through RNA sequencing allows us to:

- Identify genes upregulated or downregulated during infection
- Explore innate immune response mechanisms
- Detect potential biomarkers or therapeutic targets

**Dataset:** GSE147507 — Series 1
- **Cell type:** Normal Human Bronchial Epithelial (NHBE) — primary 
human airway cells, the first line of defense against respiratory pathogens
- **Conditions:** Mock (uninfected) vs SARS-CoV-2
- **Replicates:** 3 per condition
- **Source:** Gene Expression Omnibus (GEO)

---

## 🔁 Reproducibility Focus

This project is designed as a **fully reproducible analysis**:

- Data downloaded programmatically from GEO using `GEOquery`
- Structured pipeline with clear separation of steps
- `renv.lock` captures exact package versions
- Code-driven workflow ensuring repeatability

To reproduce:
```r
renv::restore()
source("R/01_load_data.R")
source("R/02_preprocessing.R")
source("R/03_analysis.R")
rmarkdown::render("report/rnaseq_sars_cov2_report.Rmd")
```

---

## 🏗️ Repository Structure
```
rnaseq_sars_cov2/
├── R/
│   ├── 01_load_data.R     # Download data from GEO (run first)
│   ├── 02_preprocessing.R # DESeq2 object and filtering
│   └── 03_analysis.R      # DEA, visualizations, GO enrichment
├── output/                # Results tables
├── figs/                  # Generated figures
├── report/                # R Markdown report
└── renv.lock              # Exact package versions
```

> **Note:** Raw data is not included in this repository. 
> Run `R/01_load_data.R` to download it automatically from GEO.
---

## ⚙️ Methodology

1. **Data loading** — programmatic download from GEO
2. **Preprocessing** — filtering lowly expressed genes
3. **Quality control** — PCA for sample clustering
4. **Normalization** — DESeq2 size factor estimation
5. **Differential expression** — negative binomial model
6. **Visualization** — volcano plot, heatmap
7. **Functional analysis** — GO enrichment (clusterProfiler)

---

## 📊 Key Results

| Metric | Value |
|---|---|
| Genes analyzed | 12,291 |
| Upregulated (padj<0.05) | 309 |
| Downregulated (padj<0.05) | 117 |
| Significant DEGs (\|lFC\|>1) | 111 |
| GO terms enriched | 759 |

**Top upregulated genes:** CCL20, SAA2, SAA1, IL36G — consistent with 
innate immune and inflammatory response to SARS-CoV-2.

---

## 🧠 Key Insights

- SARS-CoV-2 induces a strong transcriptional response in primary 
airway epithelial cells
- Top DEGs include cytokines and antimicrobial proteins
- GO enrichment confirms activation of antiviral defense pathways
- PCA shows clean separation between infected and control samples

---

## 🔬 Biological Interpretation

The results of this analysis can be used to:
- Better understand host response to viral infection
- Identify potential molecular targets
- Support further biological or clinical research

---

## ⚠️ Limitations

- Small sample size (3 replicates per condition) limits statistical power
- RNA-seq captures transcriptional changes but not full cellular activity
- Results based on in vitro model — further validation required

---

## 🚀 Potential Impact

Understanding gene expression changes during SARS-CoV-2 infection 
can contribute to:
- Improved knowledge of disease mechanisms
- Identification of therapeutic targets
- Better preparedness for future viral outbreaks

---

## 🛠️ Tech Stack

- R 4.5.3
- `DESeq2`, `GEOquery`, `clusterProfiler`
- `EnhancedVolcano`, `pheatmap`, `org.Hs.eg.db`
- `renv` for reproducibility

## 📚 Reference

Blanco-Melo, D. et al. (2020). Imbalanced Host Response to SARS-CoV-2 
Drives Development of COVID-19. *Cell*, 181(5), 1036-1045.

---

## 💼 Why This Project Matters

✔ Real published dataset from a landmark COVID-19 paper
✔ Professional repository structure
✔ Fully reproducible with `renv`
✔ Connects immunology background with bioinformatics skills
✔ Combines data science and life sciences

---

## 👩‍💻 Author

**Noelia Caba Martin**
Junior Bioinformatician / Data Scientist
Interested in healthcare data, transcriptomics and applied machine learning

⭐ Feel free to star the repo or connect!
