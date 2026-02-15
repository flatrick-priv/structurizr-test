# structurizr-site-generatr Compatibility Notes

This document tracks what has been validated in this repository when rendering Structurizr DSL with `structurizr-site-generatr`.

## Why this exists

`structurizr-site-generatr` may not support every Structurizr DSL feature or may interpret some features differently than other Structurizr runtimes.

Use this file as the source of truth for what is confirmed to work in this template.

## Validation method

Run from `structurizr-test/`:

```bash
./verify.sh
```

Then inspect generated output:

- `build/site/master/workspace.json`

## Compatibility matrix

Status legend:

- `Supported`: validated in this repository output.
- `Limited`: partially supported or requires constraints.
- `Not validated`: not yet tested here.

### Views and navigation

- System context view: `Supported`
- Container view: `Supported`
- Component view: `Supported`
- Deployment views: `Supported`
- Filtered views: `Supported`
- Dynamic views: `Limited`
  - `dynamic <softwareSystem>` can include container-level relationships.
  - `dynamic *` only supports people/software-system level relationships.

### Advanced modeling

- Element tags/styles: `Supported`
- Relationship tags/styles: `Supported`
- Element perspectives: `Supported`
- Relationship properties: `Supported`
- Relationship perspectives: `Supported`
- Archetypes: `Supported`
- `workspace extends`: `Supported`
- `!impliedRelationships`: `Supported`

### Animation

- System context animation: `Supported`
- Deployment view animation: `Limited`
  - `animation` with container identifiers (`ss.wa`, `ss.db`) is supported.
  - `animation` with deployment instance identifiers (`localWebApp`, `prodWebApp`) is not supported in this setup.

### Branding

- Branding (`logo`, `font`): `Supported`
  - Supported syntax in this setup: scalar `font` value (for example, `font "Inter"` or `font "<css-url>"`).
  - Limited syntax: nested `font { name ... url ... }` block did not parse in this environment.

### Deployment operations metadata

- Deployment instance `healthCheck`: `Supported`

### Documentation integration

- Workspace docs via `!docs`: `Supported`
- Element-scoped docs (`!docs` on software system/container/component): `Supported`
- Markdown docs rendering: `Supported`
- ADR integration via `!adrs`: `Supported`

### External dependencies modeling

- Outbound-only dependencies: `Supported`
- Inbound-only dependencies: `Supported`
- Bidirectional dependencies: `Supported`

## Known constraints in this repository setup

1. `dynamic *` cannot use container-level relationships.
2. Deployment animation cannot reference deployment instance identifiers; use container identifiers instead.
3. Agent instruction docs are intentionally kept outside published `!docs` paths.

## Recent probe results (2026-02-15)

- `T1_ADR_navigation`: `Supported`
  - `!adrs` rendered decision data in generated `workspace.json`.
- `T2_Dynamic_container_rel_in_ss_scope`: `Supported`
  - container relationship rendered when scoped as `dynamic ss`.
- `T3_Deployment_animation_instance_ids`: `Limited`
  - parser error when animation referenced `localWebApp`/`localDatabase`.
- `T4_Deployment_animation_container_ids`: `Supported`
  - generation succeeded when animation referenced `ss.wa`/`ss.db`.
- `T5_Deployment_health_check`: `Supported`
  - health check metadata present in generated `workspace.json`.
- `T6_Dynamic_global_scope_container_rel`: `Limited`
  - parser error: `dynamic *` accepted only people/software systems.
- `T7_Workspace_extends`: `Supported`
  - overlay workspace generated and rendered additional view.
- `T8_Archetypes`: `Supported`
  - archetype declaration and usage parsed/rendered successfully.
- `T9_ImpliedRelationships`: `Supported`
  - generation succeeded with `!impliedRelationships true`.
- `T10_Branding_nested_font_block`: `Limited`
  - parser rejected nested `font { name ... url ... }` syntax.
- `T10a_Branding_font_url`: `Supported`
  - scalar `font` with URL parsed/rendered successfully.
- `T10b_Branding_font_name`: `Supported`
  - scalar `font` with family name parsed/rendered successfully.

## Re-test checklist for new DSL features

When adding a new DSL capability:

1. Add the feature in DSL.
2. Run `./verify.sh`.
3. Check `workspace.json` for expected view/element/relationship structures.
4. Update this matrix with `Supported`, `Limited`, or `Not validated`.
5. If `Limited`, document the exact constraint and workaround.

## Static HTML smoke test

Use this to confirm the generated site is actually browsable (not just parseable):

1. Run:

```bash
./verify.sh
./serve.sh 18080
```

2. Open:

- `http://localhost:18080/`
- `http://localhost:18080/master/`

3. Verify expected content:

- Home page renders (`Structurizr Test Workspace`).
- Software systems menu contains external systems and `My Software Platform`.
- `master/workspace.json` includes expected view keys and health-check markers.
