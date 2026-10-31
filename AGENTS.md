# Instructions for AI agents

This repository is a template for FAIR and reproducible data analysis projects. If a user shares it with you, or works in a project built from it, use it as follows.

1. Read `SKILL.md` first. It holds the rules, the conventions and an index of the files.
2. Before changing or running a script, read its decision record in `decisions/`. It states why the method was chosen and what the results cannot support.
3. Use `metadata/provenance.json` to trace any output back to its code, input data, protocol and evidence. Keep it up to date when you add a script or an output.
4. Keep reproducibility and scientific validity apart. A passing test in `tests/` shows the code reruns, not that the method fits the question.
5. Never invent a DOI, ORCID, ROR ID, license, funder or date. Ask the user, or write `null` and say so.
6. Do not run code or download data without the user's agreement. Warn before personal data is committed to `data/`.
7. Write R with `=` for assignment, run scripts from the project root, and number scripts, tests and decision records alike.

For evidence, protocols, trial data and the team's analytical approaches, follow the links in the "Rules for the assistant" section of `SKILL.md`.
