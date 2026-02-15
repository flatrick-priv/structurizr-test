# structurizr-test

Author: flatrick  
Version: v1.0 (2025-03-19)

## structurizr-test

This repo serves as a test-bed for trying to create a template on how to work with the [C4 Model](https://c4model.com/) with the "(Software-)Diagrams-As-Code" language [Structurizr DSL](https://docs.structurizr.com/dsl), using [structurizr-site-generatr](https://github.com/avisi-cloud/structurizr-site-generatr) for creating and serving the static webpage showcasing the model(s).

Key guides:

- Shared workflow (human + AI agent): `WORKFLOW.md`
- Human + agent Structurizr playbook: `STRUCTURIZR_SITE_GENERATR_PLAYBOOK.md`
- Agent-specific authoring rules: `.agent/AGENT_WRITING_GUIDELINES.md`
- Workspace documentation homepage: `_docs/00-index.md`
- Architecture decisions: `_docs/architecture/ADR-0001-modeling-approach.md`
- Tooling compatibility tracker: `_docs/STRUCTURIZR_SITE_GENERATR_COMPATIBILITY.md`

### Setting up the tools

This readme uses Docker-based commands for Linux.

#### structurizr-site-generatr

- Download the latest version as a `.zip` file from [structurizr-site-generatr releases](https://github.com/avisi-cloud/structurizr-site-generatr/releases/latest).
- Unpack it where you want to keep it (for this guide, `C:\tools\structurizr-site-generatr\`).

### Render and test this template (Linux-first)

Run all commands from the `structurizr-test/` folder.

Prerequisite:

- Docker installed and running.

#### 1) Generate static site output (temporary Linux script)

```bash
./generate-site.sh
```

Expected output:

- `build/site/`

#### 2) Serve workspace locally (temporary Linux script)

```bash
./serve.sh
```

Then open:

- `http://localhost:8080`

Optional custom port:

```bash
./serve.sh 18080
```

Use this to validate diagrams/docs while iterating on DSL and content.

#### 3) Verify architecture quality gates

```bash
./verify.sh
```

This runs generation and checks that required views/elements are present in the rendered workspace.

### Stable view keys policy

Keep these view names/keys stable unless there is a deliberate breaking change:

- `SystemContext`
- `SystemContextAll`
- `SystemContextOutboundOnly`
- `SystemContextInboundOnly`
- `Containers`
- `DatabaseComponents`
- `OrderCheckoutFlow`
- `CallbackAndSettlementFlow`
- `LocalDevelopmentDeployment`
- `ProductionDeployment`

If a rename is required, update `verify.sh` and document the rationale in an ADR.

### Change checklist

1. Update DSL with minimal targeted edits.
2. Update related Markdown docs (`_docs/` and element `_docs/`).
3. Run `./verify.sh`.
4. Preview with `./serve.sh`.
5. Confirm no accidental view-key renames or placeholder text.

### Windows fallback scripts

If needed, the original Windows helper scripts are still present:

- `generate-site.cmd`
- `serve.cmd`

### Quick verification checklist

1. `verify.sh` completes without errors.
2. All expected diagrams appear (system context, container, component, deployment).
3. Docs pages under `_docs/` are visible in site navigation.
4. Generated site is created under `build/site/` and opens correctly.
