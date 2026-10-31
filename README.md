<!-- badges: start -->
[![License](https://img.shields.io/badge/License-CC%20BY%204.0-blue.svg)](https://creativecommons.org/licenses/by/4.0/deed.en) 
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.15224388.svg)](https://doi.org/10.5281/zenodo.15224388)
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
├── .github/workflows/                          # Runs all tests and renders the paper on GitHub
├── renv/                                       # renv set-up files (the package library itself is not committed)
├── renv.lock                                   # Exact versions of every R package the project uses
├── .Rprofile                                   # Starts renv when you open the project
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
- **Reproducibility** through pinned package versions (renv), session information and tests, explained step by step below.
- **Continuous checks** with GitHub Actions on every push.
- **Citation support** with `CITATION.cff` and GitHub and Zenodo integration for DOIs.
- **AI readiness** through `SKILL.md`, `AGENTS.md` and `llms.txt`, following the shared skeleton of ai-ready-documentation.

---

## New to data management? Start here

You do not need to know these words before you start. This short list explains the ones used in this template.

- **FAIR.** Four qualities of good research data. Others can **F**ind it (it has a permanent link and a description), **A**ccess it (they know how to get it), **I**nteroperate with it (it uses common formats and terms) and **R**euse it (it has a license and enough documentation to be understood).
- **Metadata.** Data about your data, such as the title, the authors, the date, the license and what each column means.
- **Data dictionary.** A table with one row per variable (column) of your dataset, saying what it measures, its unit and its allowed values.
- **Repository.** A project folder tracked by Git and stored on GitHub, so every change is saved with a date and a message.
- **Commit and push.** A commit saves a snapshot of your changes with a short message. A push sends your commits to GitHub.
- **Release.** A named version of your repository (e.g. v1.0) that Zenodo archives permanently.
- **DOI.** A permanent link to a published item (e.g. https://doi.org/10.5281/zenodo.15224388). It keeps working even if a website moves.
- **ORCID.** A permanent ID for a researcher, so your work is credited to you and not to someone with the same name.
- **Reproducibility.** Anyone can rerun your analysis on your data and get the same results.
- **Package.** An add-on for R that provides functions, e.g. `ggplot2` for plots.
- **renv and the lock file.** renv is an R package that writes down the exact version of every package your project uses, in a file called `renv.lock`. Think of it as a recipe that names the exact brand and size of each ingredient.
- **Session information.** A text file, written by each script, that records which version of R and of each package was used in the last run.
- **Decision record.** A short note explaining why you analysed the data the way you did, and what your results can and cannot show.
- **Provenance.** The history of a result, linking it back to the script, the data and the sources it came from.
- **Test.** A small script that checks your analysis still runs and still gives the expected results.

---

## How to use this template

Follow the steps in order. Each step links to a folder with more detailed instructions.

1. **Copy the repository.** On GitHub, fork it, or download it as a zip file. Open the `.Rproj` file in RStudio. RStudio then treats the folder as your project, so all file paths start from it. Rename the `.Rproj` file to the name of your project.
2. **Set up your R packages.** Run `source("script/helper/helper-00-setup-environment.R")` in the RStudio console. The first time, this installs the exact package versions listed in `renv.lock`. See [Keep your R packages reproducible with renv](#keep-your-r-packages-reproducible-with-renv) below.
3. **Add your data** to `data/`. Remove names, phone numbers and other personal information first. Describe every column in a data dictionary in `metadata/` (see [data/README.md](data/README.md)).
4. **Write your analysis** in numbered scripts in `script/`, e.g. `01-clean-data.R`, `02-fit-model.R`. Start each script with a short header saying what question it answers, which files it reads and which files it writes. Copy the header of the example script (see [script/README.md](script/README.md)).
5. **Record the software you used.** Add the session information lines to each script (see [Record which software each script used](#record-which-software-each-script-used) below).
6. **Explain your decisions.** For each script, copy `decisions/_template.md` and answer its questions in plain words (see [decisions/README.md](decisions/README.md)).
7. **Write a test** for each script in `tests/`. GitHub runs all tests every time you push (see [tests/README.md](tests/README.md)).
8. **Register provenance.** Add each script, its input data and its outputs to `metadata/provenance.json`. Copy the example entries and change the names.
9. **Complete the metadata.** Fill in `metadata/project-metadata.xlsx` and run the helper scripts to create `CITATION.cff` and the DataCite file (see [metadata/README.md](metadata/README.md)).
10. **Publish to Zenodo.**
    - Log in to Zenodo with your GitHub account and switch on your repository in the [Zenodo GitHub settings](https://zenodo.org/account/settings/github/).
    - On GitHub, create a release. Zenodo archives it and gives it a DOI, using the information in `CITATION.cff`.
11. **Delete the example files** once your own work replaces them. The example files all have `example` in their name.

---

## Keep your R packages reproducible with renv

R packages change over time. A script that works today can fail, or give slightly different numbers, after a package is updated. renv prevents this. It gives your project its own private library of packages and records the exact version of each one in `renv.lock`. Anyone who opens your project later can install the same versions with one command.

This template already includes a `renv.lock` for the example analysis.

### The first time you open the project

Run this in the RStudio console.

```r
source("script/helper/helper-00-setup-environment.R")
```

renv reads `renv.lock` and installs the listed package versions into the project library. This can take a few minutes. You only do it once per computer.

### Every time you add or update a package

1. Install the package as usual, e.g. `install.packages("lme4")`.
2. Use it in a script with `library("lme4")`.
3. Record it in the lock file.

```r
renv::snapshot()
```

renv lists what will change and asks you to confirm. Type `y`.

4. Commit and push `renv.lock`, so others get the same versions.

Check at any time whether your library and the lock file agree.

```r
renv::status()
```

### When a colleague shares the project with you

After you download or clone the project, open the `.Rproj` file and run this in the console.

```r
renv::restore()
```

You now have the same package versions as your colleague.

### Which files to commit

| File | What it is | Commit it? |
|---|---|---|
| `renv.lock` | The list of packages and their exact versions | Yes |
| `.Rprofile` | Starts renv automatically when you open the project | Yes |
| `renv/activate.R` | The script that `.Rprofile` runs | Yes |
| `renv/settings.json` | renv settings for this project | Yes |
| `renv/library/` | The installed packages themselves | No, `.gitignore` already excludes it |

### If something goes wrong

- **A package fails to install.** It often needs a system library. On Windows, install [Rtools](https://cran.r-project.org/bin/windows/Rtools/). On macOS, install the Xcode command line tools. Then run `renv::restore()` again.
- **renv warns that your R version differs from the lock file.** Packages usually still work. If they do not, install the R version listed at the top of `renv.lock`.
- **You want to stop using renv** in a project of your own. Run `renv::deactivate()`.

---

## Record which software each script used

The lock file says which package versions *should* be installed. Session information records which versions *were actually used* when a script last ran. Together they let anyone check whether a difference in results comes from a difference in software.

Add these lines near the top of every analysis script, after the `library()` calls. Change the file name to match your script.

```r
# record the R and package versions of this run
dir.create("script/session-info", showWarnings = FALSE, recursive = TRUE)

capture.output(print(sessioninfo::session_info()),
               file = "script/session-info/01-name-of-this-script.txt")
```

Each time the script runs, it writes a text file to `script/session-info/` with the date, the R version, the operating system and every package version. Commit these files together with your results.

The `sessioninfo` package gives a clearer report than R's built-in `sessionInfo()`, which also works if you prefer not to install another package.

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

> de Sousa K, Laporte M-A (2026). A FAIR and project-oriented template for open science data workflows. Version v1.3. https://doi.org/10.5281/zenodo.15224388

---

## References

- [FAIR Principles](https://www.go-fair.org/fair-principles/)
- [DataCite Metadata Schema](https://schema.datacite.org/)
- [GitHub and Zenodo integration](https://docs.github.com/en/repositories/archiving-a-github-repository/referencing-and-citing-content)
- [Project-Oriented Workflows in R](https://www.tidyverse.org/blog/2017/12/workflow-vs-script/)
- [renv](https://rstudio.github.io/renv/)
- [ai-ready-documentation](https://github.com/AgrDataSci/ai-ready-documentation)
