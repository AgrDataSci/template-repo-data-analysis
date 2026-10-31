# decisions

One decision record per analysis script, with the same number, e.g. `01-...md` for `script/01-...R`. A record states the question, why the method was chosen, its assumptions, the alternatives, and what the results can and cannot support. Code shows how an analysis was done. The record shows why, so a reader or an AI agent can judge whether the same approach suits their own question.

Start a new record from [`_template.md`](_template.md).

## Records

- [01 Farmer preference for maize product concepts](01-example-plackett-luce-concept-testing.md)

## Status labels

Every record carries one label, shared with [tricot-analysis-workflows](https://github.com/AgrDataSci/tricot-analysis-workflows).

- **historical** means the code was used in a past analysis and has not been reviewed since.
- **reviewed-not-executed** means the code and reasoning were reviewed but not run.
- **tested-on-synthetic-data** means the workflow runs and passes its tests on synthetic or example data.
- **validated-against-original-results** means the workflow reproduces the results of the original study.

Hint 1. Write the record while you analyse, not after. Decisions are easiest to explain when you make them.

Hint 2. Separate what the code computes from what you conclude. A passing test supports the first, not the second.
