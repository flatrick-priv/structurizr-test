# Database Schema Container

The database container stores persistent business data for the web application.

## Responsibilities

- Store customer/account metadata.
- Store order lifecycle data.
- Support transactional reads/writes from the web application.

## Components

- `Customers Table`
- `Orders Table`

## Evolution notes

As complexity grows, split components by bounded context and add component-level relationships when behavior matters for understanding risk or ownership.
