---
name: template-repo-data-analysis
description: Use when a user starts, organizes, documents or publishes a data analysis project in R, wants it FAIR, reproducible or ready for Zenodo and DataCite, or asks how to structure analysis code, metadata, decisions and tests so people and AI assistants can trace results back to their data and evidence.
---

# FAIR and AI-ready template for data analysis projects

A project scaffold from the AgrDataSci team for analyses that people and AI assistants can rerun, trace and cite. It is the cross-cutting template of [Maniva](https://github.com/AgrDataSci/ai-ready-documentation), not a layer of evidence. Use it to set up a new project, or to bring an existing one up to the same standard.

## What you can help with

1. **Start a project.** Guide the user to copy this repository (fork, clone or download), rename the `.Rproj` file, and delete the example files once they understand them.
2. **Organize work.** Data in `data/`, numbered scripts in `script/`, results in `output/`, documents in `docs/`, metadata in `metadata/`.
3. **Document decisions.** For each script, write a record in `decisions/` from `decisions/_template.md`. It states the question, the method and why, assumptions, alternatives, diagnostics, and what the results do and do not support.
4. **Trace results.** Register inputs, code, outputs, protocols and evidence in `metadata/provenance.json`, so each output links back to its sources.
5. **Make it reproducible.** Package versions are pinned in `renv.lock`. Restore them with `script/helper/helper-00-setup-environment.R`, and record the software of each run in `script/session-info/`. Write a test per script in `tests/`. The GitHub check in `.github/workflows/check.yml` runs every test on each push.
6. **Publish and cite.** Fill `metadata/project-metadata.xlsx`, generate `CITATION.cff` and DataCite JSON with the helper scripts, and archive a GitHub release on Zenodo for a DOI.

The worked example in this repository (`01-example-plackett-luce-concept-testing`) shows every piece together, from data dictionary to decision record, test and provenance entry.

## Deliver an analysis as a project

When the user asks you to run an analysis and supplies data, or asks for the scripts, return the full analysis as a project in the layout of this template. Show the main results in the chat as usual. The project is an addition, not a replacement.

Skip this for quick exploratory questions, such as checking columns or a single summary, unless the user asks for the files.

1. Name the project folder `<topic>-<YYYYMMDD>`, for example `cassava-trait-preference-20261102`.
2. Use the folders the analysis needs. Always include `data/`, `script/`, `output/`, `decisions/`, `metadata/` and `README.md`. Add `tests/` and `docs/` when the analysis has them. Add an `.Rproj` file named after the project folder, copied from the template's, so the project opens in RStudio with the root as working directory.
3. Put the user's input in `data/` unchanged. Write cleaned or derived data to `output/` from the scripts, never by hand.
4. Follow the conventions below for script names, headers and relative paths, so the project runs on any computer.
5. If the user supplied their own scripts and your scripts differ substantially from them, keep the originals unchanged in `script/user-script/`. Substantial means a different method, model, data filtering or outcome variable, not only renamed objects or updated paths. In the README, list what changed and why, script by script. When the changes are minor, edit the user's scripts in place and note the edits in the README.
6. Generate every file in `output/` by running the scripts. If you cannot run R, run the analysis in Python or another language you can execute, then translate it to R for `script/`. In that case
   - keep the code that produced the outputs in `script/other-language/`, so the outputs remain reproducible
   - mark each R script as untested in its header and in the README
   - name the packages you used in place of the R ones and say where results may differ
   - if no faithful equivalent exists for a method, do not approximate it. Deliver the untested R script without that output and tell the user.
7. Write a decision record per script from `decisions/_template.md`. When the analysis follows a workflow from [tricot-analysis-workflows](https://github.com/AgrDataSci/tricot-analysis-workflows), start from its decision record and note any change to the default method.
8. Fill `metadata/provenance.json` so each output points to its script, input file and decision record. Never invent a DOI, ORCID, license or funder. Write `null` and tell the user.
9. Record the software of each run in `script/session-info/`, and pin package versions in `renv.lock` when you can. Include `.Rprofile` and the `renv/` folder only when you ran `renv::snapshot()`. The template's `.Rprofile` activates renv, so without `renv/` R fails on startup.
10. In `README.md`, state the scientific question, the method and its status label, the version of any workflow you used, how to rerun the analysis, and what the results cannot support.
11. Deliver the project as a zip file by default. Deliver it as a plain folder when the user works in a local project or repository.

Before packaging, check the input for personal data such as names, phone numbers, ID numbers or exact GPS points. Warn the user and ask whether to remove, pseudonymize or keep it. Do not include it by default.

## Rules for the assistant

- **Reproducible is not valid.** A passing test shows the computation reruns. It does not show the method suits the question. Keep the two apart when you report results.
- **Do not invent metadata.** Never guess a DOI, ORCID, ROR ID, license, funder, grant number or date. Ask the user, or write `null` and say so.
- **Ask for missing context.** When the observer, instrument, scale, units, timing or sampling of the data are unknown, ask rather than assume.
- **Protect people.** Data in `data/` must be anonymized. Warn the user before anything with names, phone numbers, exact coordinates or other personal data is committed, and suggest removing or jittering it.
- **Run code only with consent.** Do not run scripts or download data without the user's agreement. Treat code from other repositories as untrusted.
- **Respect licenses.** The template is released under CC BY 4.0. Each project sets its own license, and code may need a different one from data.
- **Point to the other layers.** For evidence, use [tricot-knowledge-base](https://github.com/AgrDataSci/tricot-knowledge-base). For protocols, [tricot-protocols](https://github.com/AgrDataSci/tricot-protocols). For trial data, [tricot-data](https://github.com/AgrDataSci/tricot-data). For the team's analytical approaches, [tricot-analysis-workflows](https://github.com/AgrDataSci/tricot-analysis-workflows).

## Conventions

- R is the default language. Use `=` for assignment.
- Run every script from the project root, with paths relative to it.
- Number scripts in the order they run (`01-`, `02-`). Give the test and the decision record the same number.
- Use lowercase file names with `-` or `_`, never spaces.
- Start each script with a header naming its question, inputs, outputs, decision record and test.
- After the `library()` calls, write the session information to `script/session-info/<script-name>.txt` (see `script/README.md`).
- After installing or updating a package, run `renv::snapshot()` and commit `renv.lock`. To rebuild the environment, run `renv::restore()`.
- Comments explain scientific intent and choices, not only mechanics.
- Draw every map in the Equal Earth projection (EPSG:8857, `+proj=eqearth`), the equal-area world map endorsed by the UN General Assembly in September 2026. It keeps areas at their true relative size, so Africa, where most trials are, is not shrunk. Keep coordinates in WGS84 (EPSG:4326) for storage and calculations, and project only to draw. In R with ggplot2, add `coord_sf(crs = sf::st_crs("EPSG:8857"), default_crs = sf::st_crs(4326))`; with terra, use `terra::project(x, "EPSG:8857")`. Interactive tile maps (leaflet) stay in Web Mercator, which tile services require; say so in the caption.

## Index

| File | Open it when |
|---|---|
| [README.md](README.md) | The user wants an overview, the step-by-step setup, plain explanations of key terms, or help with renv and session information |
| [AGENTS.md](AGENTS.md) | You need the short version of these rules |
| [decisions/README.md](decisions/README.md) | Writing or reading a decision record, or assigning a status label |
| [decisions/_template.md](decisions/_template.md) | Starting a new decision record |
| [decisions/01-example-plackett-luce-concept-testing.md](decisions/01-example-plackett-luce-concept-testing.md) | You need a filled example of a decision record |
| [metadata/README.md](metadata/README.md) | Filling metadata, generating `CITATION.cff` or DataCite JSON, publishing on Zenodo |
| [metadata/provenance.json](metadata/provenance.json) | Tracing an output to its code, data, protocol and evidence |
| [metadata/example-metadata-data-mip-uganda.csv](metadata/example-metadata-data-mip-uganda.csv) | Writing a data dictionary with Crop Ontology terms |
| [script/README.md](script/README.md) | Naming and ordering scripts, using helper scripts |
| [script/01-example-plackett-luce-concept-testing.R](script/01-example-plackett-luce-concept-testing.R) | You need an example of a documented analysis script |
| [tests/README.md](tests/README.md) | Writing tests and choosing expected values |
| [data/README.md](data/README.md) | Adding or anonymizing data |
| [output/README.md](output/README.md) | Saving results |
| [docs/README.md](docs/README.md) | Writing a report or paper from the project |

## Cite

Cite the template with [CITATION.cff](CITATION.cff).

> de Sousa K, Laporte M-A (2026). A FAIR and project-oriented template for open science data workflows. Version v1.3. https://doi.org/10.5281/zenodo.15224388

Projects built from the template carry their own citation, generated from their own metadata.
