db = container "Database Schema" "Persists domain data and supports query/reporting workloads" "PostgreSQL" {
    tags "Database"
    !docs _docs/
    !include tableA/component.dsl
    !include tableB/component.dsl
}
