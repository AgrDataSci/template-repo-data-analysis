# Load required package
library("readxl")

# Read metadata and authors from Excel
file = "metadata/project-metadata.xlsx"
metadata = read_excel(file, sheet = "metadata")
authors = read_excel(file, sheet = "authors")

# Convert metadata to named list
meta_list = setNames(as.list(metadata$value), metadata$key)

# Start building the CFF content
cff = c("cff-version: 1.2.0",
        'message: "If you use this dataset or software, please cite it as below."',
        paste0("title: \"", meta_list$title, "\""),
        paste0("version: \"", meta_list$version, "\""),
        paste0("date-released: ", meta_list$publication_date),
        "authors:")

# Process authors
for (i in seq_len(nrow(authors))) {
  row = authors[i, ]
  affiliations = unname(na.omit(unlist(row[ , grepl("^affiliation_", names(row))])))
  affil_string = paste(affiliations, collapse = "; ")
  
  author_block = c(
    paste0("  - family-names: ", row$family_name),
    paste0("    given-names: ", row$given_name),
    paste0("    orcid: https://orcid.org/", row$orcid),
    paste0("    affiliation: \"", affil_string, "\"")
  )
  
  if(is.na(row$orcid)) author_block = author_block[-3]
  
  
  cff = c(cff, author_block)
}

# Add repository, license, and keywords
cff = c(
  cff,
  paste0("repository-code: ", meta_list$github_repo),
  paste0("license: ", toupper(meta_list$license)),
  "keywords:"
)

# Handle keywords (from subjects)
subjects = strsplit(meta_list$subjects, ";\\s*")[[1]]
keywords_block = paste0("  - ", subjects)
cff = c(cff, keywords_block)

# Save to file
writeLines(cff, "CITATION.cff")
