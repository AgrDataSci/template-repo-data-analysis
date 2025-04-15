# .......................................
# .......................................
# This script runs the PlackettLuce model 
# to assess farmers preferences on maize concepts
library("gosset")
library("PlackettLuce")
library("ggplot2")
library("ClimMobTools")

dir.create("output/", showWarnings = FALSE)

dir.create("script/session-info/", showWarnings = FALSE, recursive = TRUE)

sessioninfo::session_info()

# export session info to allow backward compatibility on package versions
capture.output(print(sessioninfo::session_info()), 
               file = "script/session-info/01-example-plackett-luce-concept-testing.txt")

# read the data
dat = read.csv('data/example-data-mip-uganda.csv')

dat = dat[!is.na(dat$resp_gender), ]

# put concept names as title case
head(dat[paste0("video_", letters[1:3])])

dat[paste0("video_", letters[1:3])] = lapply(dat[paste0("video_", letters[1:3])], ClimMobTools:::.title_case)

table(unlist(dat[paste0("video_", letters[1:3])]))

# .........................................
# .........................................
# PlackettLuce model ####
G = rank_tricot(dat,
                paste0("video_", letters[1:3]),
                c("variety_preferred", "variety_lesspreferred"),
                group = TRUE)

# fit the modell
mod = PlackettLuce(G)

# plot the coefficients
p = plot(mod)

p

# # write it in the disk
# ggsave("output/pl-estimates-maize.pdf",
#        plot = p,
#        width = 25,
#        height = 10,
#        units = "cm")

