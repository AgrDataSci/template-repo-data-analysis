---
title: 'A FAIR and project-oriented template for open science data workflows'
tags:
- open science
- FAIR principles
- reproducibility
- metadata
- data management
authors:
  - name: Kauê de Sousa
    orcid: 0000-0002-7571-7845
    affiliation: "1, 2"
  - name: Marie-Angélique Laporte
    orcid: 0000-0002-8461-9745
    affiliation: 3
affiliations:
  - name: Digital Inclusion, Bioversity International, Montpellier, France
    index: 1
  - name: Department of Agricultural Sciences, University of Inland Norway, Hamar, Norway
    index: 2
  - name: Performance, Innovation and Strategic Analysis for Impact (PISA4), Bioversity International, Montpellier, France
    index: 3
citation_author: de Sousa et. al.
year: 2025
bibliography: paper.bib
output: rticles::joss_article
---

# Summary

Managing research data following the FAIR principles (Findable, Accessible, Interoperable, and Reusable) is crucial for transparency, reproducibility, and scientific collaboration [@Wilkinson2016]. Reproducibility, the ability to repeat the analysis, and replicability, the ability to repeat an experiment [@Stevens2017], are key to perform collaborative scientific research [@Powers2019; @Munafo2017]. It allows scientists to re-perform analysis after a long hiatus and the peers to validate analysis and get new insights using original or new data. Here, we introduce a structured and reusable repository template designed explicitly to support FAIR data workflows for straightforward reproducibility and replicability.  

# Statement of need

Data-driven research faces several challenges, including inadequate data documentation, inconsistent structure, and poor reproducibility [@Wilkinson2016; @Munafo2017]. Researchers often struggle with these aspects, lacking practical examples or accessible tools. To address these issues, we created a project-oriented, easy-to-use data template. It streamlines metadata management, facilitates reproducibility, and ensures alignment with FAIR principles.

# Repository structure

The template repository includes clear, intuitive folder structures and essential resources.

```text
template-repo-data-analysis/
├── data/                                       # Anonimized raw and cleaned datasets
├── docs/                                       # Reports or additional documentation
├── metadata/                                   # Metadata files and templates
│   ├── project-metadata.xlsx                   # Excel file with project metadata
│   ├── project-metadata.json                   # JSON file with project metadata for DataCite
│   ├── example-metadata-data-mip-uganda.csv    # Description of the dataset used as example
│   └── README.md    
├── output/                                     # Model results, figures, tables
├── script/                                     # Scripts for validation, metadata generation, etc.
├── .gitignore                                  # Indicates which files or folders to exclude from version control
├── LICENSE                                     # A valid license file stablishing the rights to use the data
├── CITATION.cff                                # Used by GitHub and Zenodo to generate citation metadata
├── template-repo-data-analysis.Rproj           # RStudio file to set up the environment (must be renamed)
└── README.md                                   # Project overview
```

# Key features

- FAIR-aligned metadata: Comprehensive metadata files (.xlsx, .json) aligned with Zenodo (https://zenodo.org) and DataCite [@RobinsonGarcia2017] schemas.
- Automated workflows: R scripts [@CRAN] to validate and convert metadata, ensuring consistent quality.
- Citation integration: A CITATION.cff file for automatic citation generation.
- Reproducibility: Scripts and clear instructions ensure any researcher can reproduce results.
- Open and collaborative: Open licensing (CC BY 4.0, https://creativecommons.org) promotes collaboration, reuse, and attribution.

# Implementation and usage

Researchers can easily adopt this repository by:

1. Cloning the repository from GitHub (https://github.com/AgrDataSci/template-repo-data-analysis).
2. Adding their data and performing their analysis.
3. Filling in the provided project-metadata.xlsx template.
4. Running provided R scripts for validation and metadata generation.
5. Publishing via integrated platforms like Zenodo for long-term archiving and DOI assignment.

# Conclusion

Adopting structured, FAIR-aligned workflows can significantly enhance reproducibility, collaboration, and transparency in research. This template provides a practical starting point, promoting best practices from the outset of research projects.

# Acknowledgments 
This work has been supported by the 1000FARMS project (INV-031561) funded by the Gates Foundation and from the Building Opportunities for Lesser-known Diversity in Edible Resources (BOLDER) project (Crop Trust Ref: CONT-1522) funded by the Norwegian Agency for Development Cooperation (Norad) through The Global Crop Diversity Trust.

# Repository link
https://doi.org/10.5281/zenodo.15224389

# References

