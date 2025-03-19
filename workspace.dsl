workspace "Name" "Description" {

    !identifiers hierarchical
    !docs _docs/

    model {
        !include mySoftware/softwareSystem.dsl
        !include mySoftware/stakeholders.dsl
        !include mySoftware/relations.dsl
    }

    views {
        !include mySoftware/views.dsl

        // styling...
    }
    
    configuration {
        !include configuration.dsl  
    }
}