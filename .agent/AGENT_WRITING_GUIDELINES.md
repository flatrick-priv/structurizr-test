# Agent Writing Guidelines

These rules are for AI/LLM agents updating `structurizr-test`.

## Scope

- Change only files relevant to the requested architecture/documentation update.
- Do not rewrite unrelated files.
- Keep this repository Markdown-first.

## DSL rules

- Treat `workspace.dsl` as orchestration only.
- Keep model structure modular under `mySoftware/`.
- Prefer additive changes; avoid renaming identifiers unless required.
- Preserve stable view keys and names unless explicitly asked.
- Keep relationship definitions non-redundant.

## Documentation rules

- Workspace docs go in `_docs/`.
- Element docs go in the element-local `_docs/` directory.
- Use concise headings and concrete content; avoid placeholder text.
- Update docs when model semantics change.

## Verification rules

After DSL/doc changes, run from `structurizr-test/`:

```bash
./verify.sh
```

A change is not complete unless verification passes.
