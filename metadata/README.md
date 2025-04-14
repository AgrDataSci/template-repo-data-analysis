## Metadata

The `metadata/` folder contains structured metadata files that support the **FAIR principles** (Findable, Accessible, Interoperable, and Reusable) for scientific data and software publication. These files are designed to ensure reproducibility, transparency, and proper attribution in open science workflows.

This folder typically includes:
- `CITATION.cff`: Provides citation information in a human- and machine-readable format for GitHub and Zenodo integrations.
- `metadata.json`: A structured JSON file compliant with Zenodo’s API schema, enabling automated and standardized metadata submission.
- `metadata.xlsx`: A user-friendly Excel template that allows contributors to enter metadata in tabular form, which can be parsed into structured formats using accompanying R scripts.
- `README.md`: Explains the purpose and usage of each metadata file, supporting the onboarding of collaborators and data curators.

The structure is designed to:
- Support **versioned data releases** (e.g., through GitHub-Zenodo integrations)
- Enable metadata reuse across different platforms (e.g., DataCite, Dryad, institutional repositories)
- Encourage consistency across projects while allowing customization for specific scientific domains
