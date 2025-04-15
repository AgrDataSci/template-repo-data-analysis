# Load required packages
library("readxl")
library("jsonlite")

# Path to your Excel file
file = "metadata/project-metadata.xlsx"

# --- 1. Read sheets ---
metadata = read_excel(file, sheet = "metadata")
authors = read_excel(file, sheet = "authors")
funders = read_excel(file, sheet = "funders")
communities = read_excel(file, sheet = "communities")
dates = read_excel(file, sheet = "dates")

# Check required fields in metadata
required_fields = c("title", "version", "publication_date", "publisher", "description", "language", "resource_type", "license")
missing_fields = setdiff(required_fields, metadata$key)
if (length(missing_fields) > 0) {
  cat("Missing required metadata fields:", paste(missing_fields, collapse = ", "), "\n")
} else {
  cat("All required metadata fields are present.\n")
}

# Check ORCID format
if ("orcid" %in% names(authors)) {
  orcid_invalid = authors[!grepl("^\\d{4}-\\d{4}-\\d{4}-\\d{4}$", authors$orcid), ]
  if (nrow(orcid_invalid) > 0) {
    cat("Invalid ORCID(s):\n")
    print(orcid_invalid[, c("given_name", "family_name", "orcid")])
  } else {
    cat("All ORCIDs are valid.\n")
  }
}

# Check date format
if (!is.null(dates)) {
  bad_dates = dates[!grepl("^\\d{4}-\\d{2}-\\d{2}$", as.character(dates$date)), ]
  if (nrow(bad_dates) > 0) {
    cat("Invalid date format in 'dates' sheet (expected YYYY-MM-DD):\n")
    print(bad_dates)
  } else {
    cat("All dates are in valid format.\n")
  }
}

# Check for missing author names
if (any(is.na(authors$given_name) | is.na(authors$family_name))) {
  cat("Some authors are missing given or family names.\n")
} else {
  cat("All authors have names.\n")
}

cat("Validation complete. You can now proceed to generate the JSON.\n")

# --- 2. Process metadata

# Helper function to extract value from metadata sheet
get_meta = function(key) {
  val = metadata$value[metadata$key == key]
  if (length(val) == 0) return(NULL)
  return(as.character(val))
}

# Build DataCite metadata structure
datacite = list(
  titles = list(list(title = get_meta("title"))),
  publisher = get_meta("publisher"),
  publicationYear = substr(get_meta("publication_date"), 1, 4),
  resourceType = list(
    resourceTypeGeneral = "Dataset",
    resourceType = tools::toTitleCase(get_meta("resource_type"))
  ),
  descriptions = list(list(description = get_meta("description"), descriptionType = "Abstract")),
  version = get_meta("version"),
  language = get_meta("language"),
  rightsList = list(list(
    rights = "Creative Commons Attribution 4.0 International",
    rightsUri = "https://creativecommons.org/licenses/by/4.0/",
    rightsIdentifier = "cc-by-4.0",
    rightsIdentifierScheme = "SPDX"
  )),
  subjects = lapply(strsplit(get_meta("subjects"), ";\\s*")[[1]], function(s) list(subject = s)),
  creators = lapply(seq_len(nrow(authors)), function(i) {
    row = authors[i, ]
    affils = unname(na.omit(unlist(row[ , grepl("^affiliation_", names(row))])))
    list(
      name = paste(row$family_name, row$given_name, sep = ", "),
      nameType = "Personal",
      givenName = row$given_name,
      familyName = row$family_name,
      affiliation = as.list(affils),
      nameIdentifiers = list(list(
        nameIdentifier = paste0("https://orcid.org/", row$orcid),
        nameIdentifierScheme = "ORCID",
        schemeUri = "https://orcid.org"
      ))
    )
  })
)

# Optional: Add dates
if (!is.null(dates)) {
  datacite$dates = lapply(seq_len(nrow(dates)), function(i) {
    row = dates[i, ]
    list(date = as.character(row$date), dateType = tools::toTitleCase(row$type))
  })
}

# Optional: Add fundingReferences
if (!is.null(funders)) {
  datacite$fundingReferences = lapply(seq_len(nrow(funders)), function(i) {
    row = funders[i, ]
    list(
      funderName = row$funder_name,
      funderIdentifier = row$funder_identifier,
      awardTitle = row$grant_title,
      awardNumber = row$grant_number
    )
  })
}

# Write to JSON
write(toJSON(datacite, pretty = TRUE, auto_unbox = TRUE), "metadata/project-metadata.json")


# # --- 2. Process metadata into named list ---
# metadata_list = setNames(as.list(metadata$value), metadata$key)
# 
# # Optional: split semicolon-separated values (e.g., subjects)
# split_fields = c("subjects")
# for (field in split_fields) {
#   if (!is.null(metadata_list[[field]])) {
#     metadata_list[[field]] = strsplit(metadata_list[[field]], ";\\s*")[[1]]
#   }
# }
# 
# # --- 3. Process authors ---
# process_author = function(i) {
#   row = authors[i, ]
#   # Extract affiliations
#   affils = unname(na.omit(unlist(row[ , grepl("^affiliation_", names(row))])))
#   affils_list = lapply(affils, function(a) list(name = a))
#   
#   list(
#     person_or_org = list(
#       given_name = row$given_name,
#       family_name = row$family_name,
#       name = paste(row$given_name, row$family_name),
#       type = "personal",
#       identifiers = list(
#         list(
#           identifier = row$orcid,
#           scheme = "orcid"
#         )
#       )
#     ),
#     role = list(
#       id = row$role,
#       title = list(en = gsub("_", " ", tools::toTitleCase(row$role)))
#     ),
#     affiliations = affils_list
#   )
# }
# metadata_list$creators = lapply(seq_len(nrow(authors)), process_author)
# 
# # --- 4. Process funders ---
# if (nrow(funders) > 0) {
#   metadata_list$funding = lapply(seq_len(nrow(funders)), function(i) {
#     row = funders[i, ]
#     list(
#       funder = list(
#         name = row$funder_name,
#         identifiers = list(list(identifier = row$funder_identifier, scheme = "ror"))
#       ),
#       award = list(
#         title = row$grant_title,
#         number = row$grant_number
#       )
#     )
#   })
# }
# 
# # --- 5. Process communities ---
# if (nrow(communities) > 0) {
#   metadata_list$communities = lapply(communities$community_id, function(id) {
#     list(id = id)
#   })
# }
# 
# # --- 6. Process dates ---
# if (nrow(dates) > 0) {
#   metadata_list$dates = lapply(seq_len(nrow(dates)), function(i) {
#     row = dates[i, ]
#     list(
#       date = as.character(row$date),
#       type = list(
#         id = row$type,
#         title = list(en = tools::toTitleCase(row$type))
#       )
#     )
#   })
# }
# 
# # --- 7. Final cleanup ---
# metadata_list$publication_date = as.character(metadata_list$publication_date)
# metadata_list$language = list(id = metadata_list$language, title = list(en = "English"))
# metadata_list$resource_type = list(id = metadata_list$resource_type, title = list(en = "Dataset"))
# metadata_list$rights = list(
#   list(
#     id = metadata_list$license,
#     title = list(en = "Creative Commons Attribution 4.0 International"),
#     description = list(en = "Allows redistribution and reuse with credit to the original author."),
#     props = list(
#       scheme = "spdx",
#       url = "https://creativecommons.org/licenses/by/4.0/legalcode"
#     )
#   )
# )
# 
# metadata_list$license = NULL  # already moved to rights
# 
# # --- 8. Convert to JSON and export ---
# json_output = toJSON(metadata_list, pretty = TRUE, auto_unbox = TRUE)
# writeLines(json_output, "metadata.json")
# cat(json_output)
