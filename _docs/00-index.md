# Structurizr Test Workspace

This workspace is a reference implementation for modular Structurizr DSL using Markdown documentation and `structurizr-site-generatr`.

## Purpose

- Demonstrate a small but scalable DSL layout.
- Show element-scoped docs (`workspace`, `softwareSystem`, `container`, `component`).
- Provide a repeatable local render + verification loop.

## Workspace structure

- `workspace.dsl`: orchestrates model, views, and configuration.
- `mySoftware/`: domain model files (system, stakeholders, relations, views, containers, components).
- `_docs/`: workspace-level docs.
- `mySoftware/**/_docs/`: element-level docs.
- `build/site/`: generated static site output.

## Modeling conventions

- Use hierarchical identifiers (`!identifiers hierarchical`).
- Keep aliases short and stable (`ss`, `wa`, `db`, `tableA`, `tableB`).
- Keep one relationship per intended abstraction level.
- Keep view names stable (`SystemContext`, `SystemContextAll`, `SystemContextOutboundOnly`, `SystemContextInboundOnly`, `Containers`, `DatabaseComponents`, `OrderCheckoutFlow`, `CallbackAndSettlementFlow`, `LocalDevelopmentDeployment`, `ProductionDeployment`).
- Use relationship tags for dependency direction (`OutboundDependency`, `InboundDependency`).

## How to work

- Human + agent workflow: `WORKFLOW.md`
- Human + agent Structurizr playbook: `STRUCTURIZR_SITE_GENERATR_PLAYBOOK.md`
- Agent authoring rules (non-published): `.agent/AGENT_WRITING_GUIDELINES.md`
- Quick commands: `README.md`
- Architecture decisions: `_docs/architecture/ADR-0001-modeling-approach.md`
- System documentation: `mySoftware/_docs/01-system-documentation.md`
- Tooling compatibility tracker: `_docs/STRUCTURIZR_SITE_GENERATR_COMPATIBILITY.md`
