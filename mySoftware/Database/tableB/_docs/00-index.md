# Orders Table

Stores order headers and order state transitions.

## Typical fields

- Order ID
- Customer ID reference
- Order status and timestamps

## Quality considerations

- State transition validity
- Auditability of status changes
- Query/index strategy for reporting and fulfillment paths
