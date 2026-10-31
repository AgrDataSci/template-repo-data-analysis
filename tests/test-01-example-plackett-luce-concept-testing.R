# .......................................
# .......................................
# Tests for script/01-example-plackett-luce-concept-testing.R
#
# These tests check reproducibility of the computation, not the scientific
# validity of the interpretation. See decisions/ for the interpretation.
#
# Expected results come from an independent Plackett-Luce fit of the same
# 150 rankings (minorization-maximization algorithm, no pseudo-rankings).
# The order of the top three concepts is close, so the test checks the set
# of the top three and the bottom concept, which are clearly separated.
#
# Run from the project root, e.g. Rscript tests/test-01-example-plackett-luce-concept-testing.R
# .......................................
# .......................................
library("testthat")

run = new.env()

source("script/01-example-plackett-luce-concept-testing.R", local = run)

test_that("the data hold 150 complete rankings of eight concepts", {
  expect_equal(nrow(run$dat), 150)
  expect_length(coef(run$mod), 8)
})

test_that("the model returns finite estimates", {
  expect_true(all(is.finite(coef(run$mod))))
})

test_that("the most and least preferred concepts match the expected results", {
  worth = sort(coef(run$mod), decreasing = TRUE)
  expect_setequal(names(worth)[1:3],
                  c("Drought Avoidance", "Intercropping", "Resilient"))
  expect_equal(names(worth)[length(worth)], "Feed Variety")
})

test_that("the outputs are written to output/", {
  expect_true(file.exists("output/pl-estimates-maize-concepts.csv"))
  expect_true(file.exists("output/pl-estimates-maize-concepts.pdf"))
})

test_that("every file listed in metadata/provenance.json exists", {
  prov = jsonlite::read_json("metadata/provenance.json")
  paths = unlist(lapply(c(prov$inputs, prov$code, prov$outputs, prov$decisions),
                        function(x) x$path))
  expect_true(all(file.exists(paths)), info = paste(paths[!file.exists(paths)], collapse = ", "))
})
