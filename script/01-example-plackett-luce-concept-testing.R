# .......................................
# .......................................
# Example analysis. Which maize product concepts do farmers in Uganda prefer?
#
# Question   Rank eight video-based maize hybrid concepts by farmer preference.
# Input      data/example-data-mip-uganda.csv, described in
#            metadata/example-metadata-data-mip-uganda.csv
# Output     output/pl-estimates-maize-concepts.csv (log-worth estimates)
#            output/pl-estimates-maize-concepts.pdf (plot of the estimates)
#            script/session-info/01-example-plackett-luce-concept-testing.txt
# Method     Plackett-Luce model on tricot rankings (best, middle, worst).
# Decisions  decisions/01-example-plackett-luce-concept-testing.md states why
#            this model was chosen, its assumptions, alternatives and limits.
# Tests      tests/test-01-example-plackett-luce-concept-testing.R
# Run from the project root, e.g. Rscript script/01-example-plackett-luce-concept-testing.R
# .......................................
# .......................................
library("gosset")
library("PlackettLuce")
library("ggplot2")

dir.create("output", showWarnings = FALSE)

dir.create("script/session-info", showWarnings = FALSE, recursive = TRUE)

# export session info to allow backward compatibility on package versions
capture.output(print(sessioninfo::session_info()),
               file = "script/session-info/01-example-plackett-luce-concept-testing.txt")

# .........................................
# .........................................
# Read and check the data ####
dat = read.csv("data/example-data-mip-uganda.csv")

dat = dat[!is.na(dat$resp_gender), ]

concepts = paste0("video_", letters[1:3])

# put concept names in title case so the same concept is not counted twice
# because of different spelling, e.g. "feed variety" and "Feed Variety"
title_case = function(x) {
  x = tolower(trimws(x))
  gsub("(^|\\s)(\\w)", "\\1\\U\\2", x, perl = TRUE)
}

dat[concepts] = lapply(dat[concepts], title_case)

# each concept should appear a similar number of times, otherwise the
# design is unbalanced and some estimates will be less precise
table(unlist(dat[concepts]))

# keep only complete and coherent rankings, best and worst must differ
keep = dat$variety_preferred %in% LETTERS[1:3] &
  dat$variety_lesspreferred %in% LETTERS[1:3] &
  dat$variety_preferred != dat$variety_lesspreferred

dat = dat[keep, ]

# .........................................
# .........................................
# PlackettLuce model ####
G = rank_tricot(dat,
                concepts,
                c("variety_preferred", "variety_lesspreferred"),
                group = TRUE)

# fit the model, default settings add a small pseudo-ranking (npseudo = 0.5)
# that keeps estimates finite when a concept never wins or never loses
mod = PlackettLuce(G)

summary(mod)

# .........................................
# .........................................
# Export the results ####
est = as.data.frame(summary(mod)$coefficients)

est = cbind(concept = rownames(est), est)

rownames(est) = NULL

write.csv(est, "output/pl-estimates-maize-concepts.csv", row.names = FALSE)

# plot the coefficients
p = plot(mod)

p

ggsave("output/pl-estimates-maize-concepts.pdf",
       plot = p,
       width = 25,
       height = 10,
       units = "cm")
