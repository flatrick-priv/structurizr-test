workspace "Structurizr Test V2" "Reference workspace for modular C4 modeling patterns" {

    !identifiers hierarchical
    !docs _docs/

    model {
        !include mySoftware/softwareSystem.dsl
        !include mySoftware/stakeholders.dsl
        !include mySoftware/externalSystems.dsl
        !include mySoftware/relations.dsl
        !include mySoftware/deployment.dsl
    }

    views {
        !include mySoftware/views.dsl
    }
    
    configuration {
        !include configuration.dsl
    }
}
