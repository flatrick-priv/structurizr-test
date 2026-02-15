# Structurizr DSL + structurizr-site-generatr Playbook

Audience: humans and AI/LLM agents working on this repository.

## Objectives

- Keep Structurizr DSL maintainable as architecture grows.
- Ensure generated static output is accurate and browsable.
- Make changes reproducible and reviewable.

## Source of truth and file roles

- `workspace.dsl`: orchestration only.
- `mySoftware/`: modular model slices (system, relations, views, deployment).
- `_docs/`: published architecture docs.
- `.agent/`: non-published agent operation rules.
- `verify.sh`: required quality gate before completion.

## Human workflow

1. Define change intent and impacted scope.
2. Update DSL minimally in the relevant module file(s).
3. Update docs that explain changed behavior.
4. Run validation:

```bash
./verify.sh
```

5. Run/inspect static site:

```bash
./serve.sh
```

6. Confirm acceptance criteria:
- expected view keys still exist (unless intentionally changed)
- dependencies/deployment/doc pages render correctly
- no placeholder content introduced

## AI/LLM agent workflow

1. Read:
- `workspace.dsl`
- impacted files in `mySoftware/`
- `.agent/AGENT_WRITING_GUIDELINES.md`
- `_docs/STRUCTURIZR_SITE_GENERATR_COMPATIBILITY.md`

2. Propose targeted edits only (no broad refactor unless requested).
3. Keep view-key and alias stability unless change requires a rename.
4. Run `./verify.sh`.
5. Report:
- changed files
- render/compatibility impact
- any newly observed tool limitations

## Compatibility-first modeling rules

- Prefer tested constructs documented in `_docs/STRUCTURIZR_SITE_GENERATR_COMPATIBILITY.md`.
- For unvalidated DSL features, add a probe case and document outcome.
- Keep a record of `Supported`/`Limited` behavior with exact constraints.

## Definition of done

A Structurizr change is done when:

- `./verify.sh` passes.
- static site is browsable via `./serve.sh`.
- docs reflect model behavior.
- compatibility notes are updated if behavior changed.
