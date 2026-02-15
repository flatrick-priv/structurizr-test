# ADR-0001: Modular Structurizr DSL + Markdown Docs + Site Generation

Status: Accepted  
Date: 2026-02-15

## Context

This repository is a learning and reference workspace for Structurizr DSL.
As usage grows, single-file models and ad-hoc documentation become difficult to maintain.

## Decision

We use the following baseline approach:

- Modular DSL split by concern under `mySoftware/`.
- Stable, explicit view keys (`SystemContext`, `Containers`, `DatabaseComponents`).
- Markdown documentation only.
- Element-scoped docs using `_docs/` at workspace/system/container/component levels.
- Docker-based `structurizr-site-generatr` scripts for generation/serving.
- `verify.sh` as a mandatory local quality gate.

## Consequences

Positive:

- Smaller, easier-to-review changes.
- Predictable rendered output and navigation.
- Repeatable local verification for humans and AI agents.

Trade-offs:

- Requires discipline to keep view keys stable.
- Requires documentation updates alongside DSL updates.

## Follow-up rules

- Any intentional view-key rename must update `verify.sh` and be documented in a new ADR.
- Any structural modeling change should include corresponding documentation updates.
