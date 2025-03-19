ss = softwareSystem "Software System" {
    !docs _docs/
    !include WebApp/container.dsl
    !include Database/container.dsl
}

