# Workflow (Human + AI Agent)

This file defines the shared operating loop for evolving `structurizr-test`.
For broader Structurizr + site-generation guidance, also use `STRUCTURIZR_SITE_GENERATR_PLAYBOOK.md`.

## Human workflow

1. Define the change intent (new element, changed relation, or docs update).
2. Update DSL in `mySoftware/` and `workspace.dsl` only if orchestration must change.
3. Update relevant Markdown docs in `_docs/` and element-local `_docs/` folders.
4. Run verification:

```bash
./verify.sh
```

5. Review rendered site locally:

```bash
./serve.sh
```

6. Confirm acceptance checklist before commit:
- expected views still render
- docs navigation includes updated pages
- no placeholder text introduced

## AI/LLM agent workflow

1. Read `workspace.dsl`, relevant files in `mySoftware/`, and `.agent/AGENT_WRITING_GUIDELINES.md`.
2. Propose minimal, targeted edits aligned to requested change.
3. Apply edits without broad refactors unless explicitly requested.
4. Run `./verify.sh` and report pass/fail.
5. Summarize changed files and behavioral impact.

## Definition of done

A Structurizr change is done when:
- DSL compiles and site generation succeeds.
- Expected view keys are present.
- Documentation reflects model semantics.
- Reviewer can run the same commands and reproduce results.
