<!-- badges: start -->
[![License](https://img.shields.io/badge/License-CC%20BY%204.0-blue.svg)](https://creativecommons.org/licenses/by/4.0/deed.en) 
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.15224389.svg)](https://doi.org/10.5281/zenodo.15224389)
<!-- badges: end --> 

## A FAIR and project-oriented template for open science data workflows
> Kauê de Sousa, Marie-Angélique Laporte

Here we introduce a reusable, project-oriented data analysis template designed to align with the FAIR principles (Findable, Accessible, Interoperable, and Reusable). The template offers a structured and scalable approach for managing scientific data and code, particularly suited for collaborative and open science environments. It integrates good practices from R-based workflows, GitHub–Zenodo integration, and metadata standards including DataCite and CFF.

---

## Objectives

The template aims to:

- Improve consistency and reproducibility across research projects.
- Ensure research outputs are FAIR and ready for long-term archiving.
- Provide a ready-to-use metadata structure for data and code publication.
- Support automated workflows and interoperability with platforms like Zenodo, GitHub, and institutional repositories.

---

## Repository structure

The project follows a project-oriented layout inspired by best practices in the R community.

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
---

## Best practices incorporated

- **Project-oriented** structure.
- **FAIR-compliant metadata** with Zenodo and DataCite standards.
- **Automation** via R scripts for JSON conversion and validation.
- **Citation support** with `CITATION.cff` file.
- **Clear separation** of raw data, outputs, scripts, and documentation.
- **GitHub–Zenodo integration** for DOI minting.

---

## Metadata management

The `metadata/` folder contains:

- `metadata.xlsx`: Main spreadsheet with sheets for general metadata, authors, funders, dates, and communities.
- `metadata.json`: DataCite-compliant metadata for institutional or repository submission.
- `CITATION.cff`: Used by GitHub and Zenodo to generate citation metadata (it must be placed on the main root).
- `README.md`: Guide to using the metadata tools.

---

## How to use this template

1. **Clone or fork the repository** and open it in RStudio.
2. **Complete `metadata.xlsx`** using the provided structure.
3. **Add your data**
4. **Run your analysis**
5. **Run the R scripts** from the `script/` folder to:
   - Validate metadata 
   - Convert to JSON
6. **Publish to Zenodo**:
   - Enable the GitHub repo in your [Zenodo GitHub settings](https://zenodo.org/account/settings/github/).
   - Create a GitHub release. Zenodo will use the `CITATION.cff` to generate the DOI metadata.

---

## Reusability and extensions

This template is suitable for:
- Research projects requiring data publication.
- Collaborative projects across CGIAR and university partners.
- Students and researchers new to reproducible data workflows.

The structure is extensible and can support:
- Additional metadata schemas and controled vocabularies (e.g., Dublin Core, DCAT)
- Workflow automation using GitHub Actions or R scripts
- Integration with institutional data catalogs

---

## Contribute

This template is open for improvement! You can:
- Suggest edits via GitHub Issues
- Fork the repository for your own project
- Contribute back improvements via pull request

---

## References

- [FAIR Principles](https://www.go-fair.org/fair-principles/)
- [DataCite Metadata Schema](https://schema.datacite.org/)
- [GitHub–Zenodo Integration](https://docs.github.com/en/repositories/archiving-a-github-repository/referencing-and-citing-content)
- [Project-Oriented Workflows in R](https://www.tidyverse.org/blog/2017/12/workflow-vs-script/)



