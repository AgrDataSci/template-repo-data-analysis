# data

All data used in the analysis go here. If a file is too large for GitHub, document it here and give a persistent link (e.g. a Zenodo DOI) to access it.

Describe every dataset in a data dictionary in `metadata/`, one row per variable, with its description, type, unit, allowed values and Crop Ontology ID where one exists. See `metadata/example-metadata-data-mip-uganda.csv`. Register each dataset in `metadata/provenance.json` with its source, protocol, license and access conditions.

Hint 1. Avoid spaces in file names and use "-" or "_" to separate words, e.g. "bean-data-arusha.csv" instead of "Bean data Arusha.csv".

Hint 2. Anonymize before you commit. Remove names, phone numbers and other direct identifiers, and jitter exact coordinates (e.g. with `ClimMobTools::rmGeoIdentity()`). Git keeps the history, so data committed once stays public even after you delete it.

Hint 3. Keep raw data that still need cleaning in a sub-folder `data/raw`, and write the cleaned version to `data/` with a numbered script.
