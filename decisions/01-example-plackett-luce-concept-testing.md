# Which maize product concepts do farmers in Uganda prefer?

**Status:** tested-on-synthetic-data (runs and passes its tests on the example data in the GitHub check)
**Script:** `script/01-example-plackett-luce-concept-testing.R`
**Test:** `tests/test-01-example-plackett-luce-concept-testing.R`
**Input data:** `data/example-data-mip-uganda.csv`, described in `metadata/example-metadata-data-mip-uganda.csv`
**Outputs:** `output/pl-estimates-maize-concepts.csv`, `output/pl-estimates-maize-concepts.pdf`

## Scientific question

Which of eight future maize hybrid concepts, presented as short videos, do farmers prefer, and how clearly do the concepts differ?

## Data and protocol

The data are a sample of 150 Ugandan farmers from a video-based product concept testing (VPCT) study by CIMMYT market intelligence with 2,400 farmers in Kenya and Uganda, published as Donovan et al. (2025). Each farmer watched three of the eight concepts, assigned at random, and named the most and least preferred. This is the tricot ranking format. The protocol is described in the paper. It is not yet part of [tricot-protocols](https://github.com/AgrDataSci/tricot-protocols). The file holds no direct identifiers. Free-text reasons are kept as given.

## Method and why

A Plackett-Luce model estimates the log-worth of each concept from partial rankings. It uses the full order of each set of three, accepts incomplete block designs where no farmer sees every concept, and gives estimates on a common scale with standard errors. The default settings add a small pseudo-ranking (`npseudo = 0.5`) that keeps estimates finite when a concept rarely wins or loses.

## Assumptions

- Independence of irrelevant alternatives. The relative preference between two concepts does not depend on the third concept in the set.
- One shared preference order. All farmers are treated as one population, so differences between groups are averaged out.
- Random assignment of concepts to farmers, so set composition does not bias the estimates.

## Alternatives

- Plackett-Luce trees (`pltree`) with covariates such as gender, age or district, when the question is whether groups prefer different concepts.
- Rank-ordered logit with participant covariates, when effects of covariates need to be estimated directly.
- Win and loss counts, as a descriptive check only. They ignore which concepts competed in each set.

## Diagnostics

- Each concept appeared in 51 to 60 of the 150 sets, so the design is close to balanced.
- All 150 rankings are complete and coherent (best differs from worst).
- An independent Plackett-Luce fit of the same rankings gives the same top three and the same last concept as the expected results in the test.

## What the results support

Within this sample, Drought Avoidance, Intercropping and Resilient are the most preferred concepts and Feed Variety the least preferred. The order among the top three is close and should not be over-interpreted. The pattern agrees with the full study, where farmers most often chose resilience in both countries and drought escape in Uganda (Donovan et al. 2025).

## What the results do not support

- Adoption, willingness to pay or market size. Stated preference for a video concept is not purchase behaviour.
- Performance of real varieties in the field. Farmers judged descriptions, not plants.
- Conclusions for all Ugandan maize farmers. The sample is small and was not drawn to be representative.

## Limitations

The example uses one country subset and no covariates, so it shows the workflow rather than a full analysis. Video framing and narration can shape preference. The test checks the computation, not these interpretations.

## References

- Donovan J, Rutsaert P, Mawia H, de Sousa K, van Etten J (2025). Farmers' preferences for the next generation of maize hybrids. Application of product concept testing in Kenya and Uganda. *Experimental Agriculture* 61, e5. https://doi.org/10.1017/S001447972500002X. Evidence card in [tricot-knowledge-base](https://github.com/AgrDataSci/tricot-knowledge-base/blob/main/papers/donovan-2025-expagric.md).
- Turner HL, van Etten J, Firth D, Kosmidis I (2020). Modelling rankings in R. The PlackettLuce package. *Computational Statistics*. https://doi.org/10.1007/s00180-020-00959-3. Evidence card in [tricot-knowledge-base](https://github.com/AgrDataSci/tricot-knowledge-base/blob/main/papers/turner-2020-compstat.md).
