# tests

Tests check that each analysis script runs and returns the expected results. Write one test file per script, with the same number, e.g. `test-01-...R` for `script/01-...R`.

Run a test from the project root.

```r
source("tests/test-01-example-plackett-luce-concept-testing.R")
```

Every push to GitHub runs all tests through `.github/workflows/check.yml`.

Hint 1. A test proves that the computation is reproducible. It does not prove that the method suits the question. Keep that reasoning in `decisions/`.

Hint 2. State where each expected value comes from, e.g. an independent calculation, a published table or a previous release. Do not copy the value from the output under test.

Hint 3. Test results that are clearly separated. When two estimates are close, test the group they belong to, not their exact order.
