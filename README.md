<!-- badges: start -->
[![License](https://img.shields.io/badge/License-CC%20BY%204.0-blue.svg)](https://creativecommons.org/licenses/by/4.0/deed.en) 
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.15224389.svg)](https://doi.org/10.5281/zenodo.15224389)
[![Check analysis](https://github.com/AgrDataSci/template-repo-data-analysis/actions/workflows/check.yml/badge.svg)](https://github.com/AgrDataSci/template-repo-data-analysis/actions/workflows/check.yml)
<!-- badges: end --> 

## A FAIR and project-oriented template for open science data workflows
> Kauê de Sousa, Marie-Angélique Laporte

A reusable, project-oriented template for data analysis that follows the FAIR principles (Findable, Accessible, Interoperable, Reusable) and is ready for AI assistants. It gives scientific data and code a clear structure, metadata for DataCite and Zenodo, and the documentation an assistant needs to rerun an analysis, trace a result to its sources and cite them.

The template is the cross-cutting resource of [ai-ready-documentation](https://github.com/AgrDataSci/ai-ready-documentation), the AgrDataSci family of repositories for evidence, protocols, data and analysis. It is not a layer of evidence. It is the scaffold any of those layers, or any research project, can start from.

---

## Objectives

- Make research projects consistent and reproducible.
- Make outputs FAIR and ready for long-term archiving.
- Record why each analysis was done the way it was, not only how.
- Link every output to the code, data, protocol and evidence behind it.
- Let people and AI assistants use, check and cite the work with little guidance.

---

## Repository structure

```text
template-repo-data-analysis/
├── data/                                       # Anonymized raw and cleaned datasets
├── decisions/                                  # One decision record per script (question, method, assumptions, limits)
│   ├── _template.md                            # Template for a new record
│   └── 01-example-plackett-luce-concept-testing.md
├── docs/                                       # Reports, papers or additional documentation
├── metadata/                                   # Metadata files and templates
│   ├── project-metadata.xlsx                   # Project metadata, edited by hand
│   ├── project-metadata.json                   # DataCite metadata, generated from the xlsx
│   ├── provenance.json                         # Links outputs to code, data, protocols and evidence
│   ├── example-metadata-data-mip-uganda.csv    # Data dictionary of the example dataset
│   └── README.md    
├── output/                                     # Model results, figures, tables 
├── script/                                     # Analysis scripts, run in numeric order
│   └── helper/                                 # Environment setup and metadata generation
├── tests/                                      # One test per script, run on every push
├── .github/workflows/check.yml                 # Runs all tests on GitHub
├── AGENTS.md                                   # Short instructions for AI agents
├── SKILL.md                                    # Skill for AI assistants (rules, conventions, file index)
├── llms.txt                                    # Entry point for AI tools that read the web
├── CITATION.cff                                # Citation metadata used by GitHub and Zenodo
├── LICENSE                                     # The terms under which others may reuse the work
├── template-repo-data-analysis.Rproj           # RStudio project file (rename it for your project)
└── README.md                                   # Project overview
```

---

## Best practices incorporated

- **Project-oriented** structure, with scripts run from the project root.
- **FAIR metadata** for DataCite and Zenodo, and data dictionaries with Crop Ontology terms.
- **Decision records** that separate what the results support from what they do not.
- **Provenance** from each output back to its inputs, protocol and evidence.
- **Reproducibility** through pinned package versions (renv), session information and tests.
- **Continuous checks** with GitHub Actions on every push.
- **Citation support** with `CITATION.cff` and GitHub and Zenodo integration for DOIs.
- **AI readiness** through `SKILL.md`, `AGENTS.md` and `llms.txt`, following the shared skeleton of ai-ready-documentation.

---

## How to use this template

1. **Copy the repository** (fork, clone or download) and open it in RStudio. Rename the `.Rproj` file.
2. **Set up the environment** with `source("script/helper/helper-00-setup-environment.R")`, then commit `renv.lock`.
3. **Add your data** to `data/` and describe each variable in a data dictionary in `metadata/`.
4. **Write your analysis** in numbered scripts in `script/`. Start each with a header naming its question, inputs, outputs, decision record and test.
5. **Record your decisions** in `decisions/`, starting from `_template.md`.
6. **Write a test** for each script in `tests/`. GitHub runs them on every push.
7. **Register provenance** in `metadata/provenance.json`, linking each output to its code, data, protocol and evidence.
8. **Complete the metadata** in `metadata/project-metadata.xlsx` and run the helper scripts to generate `CITATION.cff` and the DataCite JSON (see [metadata/README.md](metadata/README.md)).
9. **Publish to Zenodo**.
   - Enable the repository in your [Zenodo GitHub settings](https://zenodo.org/account/settings/github/).
   - Create a GitHub release. Zenodo uses `CITATION.cff` to build the DOI metadata.
10. **Delete the example files** once your own work replaces them.

---

## Using it with AI assistants

Share the repository link with an assistant, or point it to `SKILL.md`. The skill tells the assistant how the project is organized, which conventions to follow and which rules to respect, for example never to invent a DOI or ORCID and to keep the reproducibility of a computation apart from the validity of its interpretation. Agents that work inside the repository read `AGENTS.md`. Tools that read the web start from `llms.txt`.

In a project built from the template, update `SKILL.md` so its description and index match your project.

---

## Reusability and extensions

This template suits
- research projects that publish data and code,
- collaborative projects across CGIAR and university partners,
- students and researchers new to reproducible workflows.

The structure can be extended with
- additional metadata schemas and controlled vocabularies (e.g. Dublin Core, DCAT),
- machine-readable research objects (e.g. RO-Crate or CodeMeta) built from `provenance.json`,
- integration with institutional data catalogs.

---

## Contribute

This template is open for improvement. You can
- suggest edits via GitHub Issues,
- fork the repository for your own project,
- contribute improvements back via pull request.

---

## Cite

Cite the template with [CITATION.cff](CITATION.cff).

> de Sousa K, Laporte M-A (2026). A FAIR and project-oriented template for open science data workflows. Version v1.3. https://doi.org/10.5281/zenodo.15224389

---

## References

- [FAIR Principles](https://www.go-fair.org/fair-principles/)
- [DataCite Metadata Schema](https://schema.datacite.org/)
- [GitHub and Zenodo integration](https://docs.github.com/en/repositories/archiving-a-github-repository/referencing-and-citing-content)
- [Project-Oriented Workflows in R](https://www.tidyverse.org/blog/2017/12/workflow-vs-script/)
- [renv](https://rstudio.github.io/renv/)
- [ai-ready-documentation](https://github.com/AgrDataSci/ai-ready-documentation)
