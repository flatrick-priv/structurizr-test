db = container "Database Schema" {
    tags "Database"
    !docs _docs/
    !include tableA/component.dsl
    !include tableB/component.dsl
}