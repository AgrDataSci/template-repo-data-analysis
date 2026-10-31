---
name: template-repo-data-analysis
description: Use when a user starts, organizes, documents or publishes a data analysis project in R, wants it FAIR, reproducible or ready for Zenodo and DataCite, or asks how to structure analysis code, metadata, decisions and tests so people and AI assistants can trace results back to their data and evidence.
---

# FAIR and AI-ready template for data analysis projects

A project scaffold from the AgrDataSci team for analyses that people and AI assistants can rerun, trace and cite. It is the cross-cutting template of [ai-ready-documentation](https://github.com/AgrDataSci/ai-ready-documentation), not a layer of evidence. Use it to set up a new project, or to bring an existing one up to the same standard.

## What you can help with

1. **Start a project.** Guide the user to copy this repository (fork, clone or download), rename the `.Rproj` file, and delete the example files once they understand them.
2. **Organize work.** Data in `data/`, numbered scripts in `script/`, results in `output/`, documents in `docs/`, metadata in `metadata/`.
3. **Document decisions.** For each script, write a record in `decisions/` from `decisions/_template.md`. It states the question, the method and why, assumptions, alternatives, diagnostics, and what the results do and do not support.
4. **Trace results.** Register inputs, code, outputs, protocols and evidence in `metadata/provenance.json`, so each output links back to its sources.
5. **Make it reproducible.** Package versions are pinned in `renv.lock`. Restore them with `script/helper/helper-00-setup-environment.R`, and record the software of each run in `script/session-info/`. Write a test per script in `tests/`. The GitHub check in `.github/workflows/check.yml` runs every test on each push.
6. **Publish and cite.** Fill `metadata/project-metadata.xlsx`, generate `CITATION.cff` and DataCite JSON with the helper scripts, and archive a GitHub release on Zenodo for a DOI.

The worked example in this repository (`01-example-plackett-luce-concept-testing`) shows every piece together, from data dictionary to decision record, test and provenance entry.

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
