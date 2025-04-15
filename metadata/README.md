## Metadata

The `metadata/` folder contains structured metadata files that support the **FAIR principles** (Findable, Accessible, Interoperable, and Reusable) for scientific data and software publication. These files are designed to ensure reproducibility, transparency, and proper attribution in open science workflows.

This folder typically includes:
- `metadata.json`: A structured JSON file compliant with Zenodo’s API schema, enabling automated and standardized metadata submission.
- `metadata.xlsx`: A user-friendly Excel template that allows contributors to enter metadata in tabular form, which can be parsed into structured formats using accompanying R scripts.
- `README.md`: Explains the purpose and usage of each metadata file, supporting the onboarding of collaborators and data curators.

The structure is designed to:
- Support **versioned data releases** (e.g., through GitHub-Zenodo integrations)
- Enable metadata reuse across different platforms (e.g., DataCite, Dryad, institutional repositories)
- Encourage consistency across projects while allowing customization for specific scientific domains

---

## Usage Instructions

This folder provides the core metadata structure for your project.

### Step 1: Fill in `metadata.xlsx`
- Open the Excel file and complete the following sheets:
  - `metadata`: General record information (title, version, date, subjects, etc.)
  - `authors`: List of contributors with ORCID, affiliations, and roles
  - `funders`: Funder name, grant number, and ROR ID
  - `communities`: (Optional) Zenodo community IDs
  - `dates`: Important dates (e.g., accepted, submitted)

### Step 2: Edit `CITATION.cff`

Run the accompanying R script to parse Excel metadata into .cff:

```r
source("script/helper/helper-01-parse-metadata-as-cff.")
```

Ensure your `CITATION.cff` file at the root of the repo reflects your authors and repository URL. This enables GitHub-Zenodo citation integration.

### Step 3: Convert to `metadata.json`
Run the accompanying R script to parse Excel metadata into JSON:

```r
source("script/helper/helper-02-parse-metadata-as-json.R")
```

This will generate a [DataCite](https://datacite-metadata-schema.readthedocs.io/en/4.6/) compliant metadata.


### Step 4: Publish to Zenodo
- **GitHub Release**: Make a GitHub release and Zenodo will generate a DOI using `CITATION.cff`.
- **Manual Upload**: Use the metadata fields or paste from the generated JSON file.
- **API Upload**: Use `zenodo_metadata.json` in a POST request to the Zenodo API.

---

## Tip

To validate your metadata before submission, use the validation script (`script/validate_metadata.R`, coming soon).
