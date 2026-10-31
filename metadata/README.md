## metadata

The `metadata/` folder holds structured metadata that make the project Findable, Accessible, Interoperable and Reusable (FAIR). They support reproducibility, transparency and proper attribution, and they let people and AI assistants trace results to their sources.

The folder includes
- `project-metadata.xlsx`, a spreadsheet where contributors enter project metadata by hand,
- `project-metadata.json`, DataCite metadata generated from the spreadsheet,
- `provenance.json`, links from each output to its code, input data, protocol and evidence,
- data dictionaries such as `example-metadata-data-mip-uganda.csv`, one row per variable,
- this `README.md`.

The structure supports versioned data releases through GitHub and Zenodo, reuse of metadata across platforms (DataCite, Dryad, institutional repositories), and consistency across projects while allowing domain-specific additions.

---

## Usage

### Step 1. Fill in `project-metadata.xlsx`

Complete these sheets.
- `metadata` holds general record information (title, version, date, subjects, license, repository).
- `authors` lists contributors with ORCID, affiliations and roles.
- `funders` gives funder name, ROR ID, grant title and grant number.
- `communities` (optional) lists Zenodo community IDs.
- `dates` records important dates (e.g. accepted, submitted) as YYYY-MM-DD.

Leave a cell empty when a value is unknown. Never guess an ORCID, ROR ID or grant number.

### Step 2. Generate `CITATION.cff`

```r
source("script/helper/helper-01-parse-metadata-as-cff.R")
```

This writes `CITATION.cff` at the root of the repository, where GitHub and Zenodo read it. Check that it lists your authors and repository URL.

### Step 3. Validate and generate `project-metadata.json`

```r
source("script/helper/helper-02-parse-metadata-as-json.R")
```

The script first checks required fields, ORCID format, date format and author names, and prints any problem. It then writes [DataCite](https://datacite-metadata-schema.readthedocs.io/en/4.6/) metadata to `project-metadata.json`.

### Step 4. Describe your data

Write a data dictionary for each dataset in `data/`, with the columns `Name`, `Description`, `OntologyID`, `ValueType`, `Unit` and `ControlledVocabulary`. Use [Crop Ontology](https://cropontology.org/) IDs for traits where they exist.

### Step 5. Register provenance in `provenance.json`

For each script, list its inputs, outputs, decision record and test. For each input, give its source, protocol, license, access conditions and citation. Write `null` for anything unknown rather than a guess. The test of each script checks that every file listed here exists.

### Step 6. Publish to Zenodo

- **GitHub release.** Create a release and Zenodo generates a DOI using `CITATION.cff`.
- **Manual upload.** Copy the fields from `project-metadata.json`.
- **API upload.** Send `project-metadata.json` in a request to the Zenodo API.

Update the version in `project-metadata.xlsx` before each release and regenerate both files, so `CITATION.cff`, `project-metadata.json` and `provenance.json` carry the same version.
