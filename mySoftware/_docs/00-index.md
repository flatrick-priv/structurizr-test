# My Software Platform

This software system demonstrates how to structure a small model that can scale without becoming monolithic.

## System documentation

- Main system documentation: `mySoftware/_docs/01-system-documentation.md`

## Responsibilities

- Provide a web application (`wa`) for user workflows.
- Persist domain data in a database container (`db`).

## C4 scope in this example

- System context: user and platform boundary.
- Container: application and database responsibilities.
- Component: key database structures (`Customers Table`, `Orders Table`).

## Change guidance

- Add new containers under `mySoftware/<ContainerName>/container.dsl`.
- Add related relationships in `mySoftware/relations.dsl`.
- Add or adjust views in `mySoftware/views.dsl` deliberately (avoid `include *` by default).
