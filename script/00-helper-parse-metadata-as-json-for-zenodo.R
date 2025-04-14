# Load required packages
library("readxl")
library("jsonlite")

# Path to your Excel file
file = "metadata.xlsx"

# --- 1. Read sheets ---
metadata_df = read_excel(file, sheet = "metadata")
authors_df  = read_excel(file, sheet = "authors")
funders_df  = read_excel(file, sheet = "funders")
communities_df = read_excel(file, sheet = "communities")
dates_df    = read_excel(file, sheet = "dates")

# --- 2. Process metadata into named list ---
metadata_list = setNames(as.list(metadata_df$value), metadata_df$key)

# Optional: split semicolon-separated values (e.g., subjects)
split_fields = c("subjects")
for (field in split_fields) {
  if (!is.null(metadata_list[[field]])) {
    metadata_list[[field]] = strsplit(metadata_list[[field]], ";\\s*")[[1]]
  }
}

# --- 3. Process authors ---
process_author = function(i) {
  row = authors_df[i, ]
  # Extract affiliations
  affils = unname(na.omit(unlist(row[ , grepl("^affiliation_", names(row))])))
  affils_list = lapply(affils, function(a) list(name = a))
  
  list(
    person_or_org = list(
      given_name = row$given_name,
      family_name = row$family_name,
      name = paste(row$given_name, row$family_name),
      type = "personal",
      identifiers = list(
        list(
          identifier = row$orcid,
          scheme = "orcid"
        )
      )
    ),
    role = list(
      id = row$role,
      title = list(en = gsub("_", " ", tools::toTitleCase(row$role)))
    ),
    affiliations = affils_list
  )
}
metadata_list$creators = lapply(seq_len(nrow(authors_df)), process_author)

# --- 4. Process funders ---
if (nrow(funders_df) > 0) {
  metadata_list$funding = lapply(seq_len(nrow(funders_df)), function(i) {
    row = funders_df[i, ]
    list(
      funder = list(
        name = row$funder_name,
        identifiers = list(list(identifier = row$funder_identifier, scheme = "ror"))
      ),
      award = list(
        title = row$grant_title,
        number = row$grant_number
      )
    )
  })
}

# --- 5. Process communities ---
if (nrow(communities_df) > 0) {
  metadata_list$communities = lapply(communities_df$community_id, function(id) {
    list(id = id)
  })
}

# --- 6. Process dates ---
if (nrow(dates_df) > 0) {
  metadata_list$dates = lapply(seq_len(nrow(dates_df)), function(i) {
    row = dates_df[i, ]
    list(
      date = as.character(row$date),
      type = list(
        id = row$type,
        title = list(en = tools::toTitleCase(row$type))
      )
    )
  })
}

# --- 7. Final cleanup ---
metadata_list$publication_date = as.character(metadata_list$publication_date)
metadata_list$language = list(id = metadata_list$language, title = list(en = "English"))
metadata_list$resource_type = list(id = metadata_list$resource_type, title = list(en = "Dataset"))
metadata_list$rights = list(
  list(
    id = metadata_list$license,
    title = list(en = "Creative Commons Attribution 4.0 International"),
    description = list(en = "Allows redistribution and reuse with credit to the original author."),
    props = list(
      scheme = "spdx",
      url = "https://creativecommons.org/licenses/by/4.0/legalcode"
    )
  )
)

metadata_list$license = NULL  # already moved to rights

# --- 8. Convert to JSON and export ---
json_output = toJSON(metadata_list, pretty = TRUE, auto_unbox = TRUE)
writeLines(json_output, "metadata.json")
cat(json_output)
