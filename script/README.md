# script

All scripts used in the analysis go here. Run them from the project root, with paths relative to it.

Hint 1. Put your scripts in numeric order, so everybody knows where to start. Give each script's test (`tests/`) and decision record (`decisions/`) the same number.

- 01-data-cleaning-bean-yield.R
- 02-analysis-yield-estimation.R
- 03-produce-maps.R

Hint 2. Start each script with a header naming its question, inputs, outputs, decision record and test. See `01-example-plackett-luce-concept-testing.R`.

Hint 3. Write comments that explain scientific intent and choices, not only what the code does.

Hint 4. Use `=` for assignment.

## helper

Helper scripts are not part of the analysis. They set up the environment and generate metadata.

- `helper-00-setup-environment.R` pins package versions with renv.
- `helper-01-parse-metadata-as-cff.R` writes `CITATION.cff` from `metadata/project-metadata.xlsx`.
- `helper-02-parse-metadata-as-json.R` validates the metadata and writes `metadata/project-metadata.json` for DataCite.

## session-info

Analysis scripts write the R and package versions of their last run to `script/session-info/`, so results can be traced to the software that produced them.
