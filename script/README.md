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

- `helper-00-setup-environment.R` installs the package versions listed in `renv.lock`, or creates the lock file if there is none. Run it once when you start. The main README explains renv step by step.
- `helper-01-parse-metadata-as-cff.R` writes `CITATION.cff` from `metadata/project-metadata.xlsx`.
- `helper-02-parse-metadata-as-json.R` validates the metadata and writes `metadata/project-metadata.json` for DataCite.

## session-info

Every analysis script writes the R and package versions of its last run to `script/session-info/`, so results can be traced to the software that produced them. Add these lines near the top of each script, after the `library()` calls, and change the file name to match the script.

```r
# record the R and package versions of this run
dir.create("script/session-info", showWarnings = FALSE, recursive = TRUE)

capture.output(print(sessioninfo::session_info()),
               file = "script/session-info/01-name-of-this-script.txt")
```

Commit the session-info files together with your results. `renv.lock` says which versions should be installed, while these files record which versions were actually used.
