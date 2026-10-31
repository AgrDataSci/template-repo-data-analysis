# .......................................
# .......................................
# Set up a reproducible R environment with renv
#
# renv records the exact version of every package in renv.lock, so others
# (people or AI agents) can rebuild the same environment years later.
# Run from the project root, once when you start and again whenever you add
# or update a package.
# .......................................
# .......................................
if (!requireNamespace("renv", quietly = TRUE)) install.packages("renv")

if (file.exists("renv.lock")) {

  # someone already pinned the packages, install the same versions
  renv::restore(prompt = FALSE)

} else {

  # first time, create the project library and pin the packages the
  # scripts use (renv finds them by reading the library() calls)
  renv::init(restart = FALSE)

}

# after adding or updating packages, record them again with
# renv::snapshot()
# then commit renv.lock to the repository
