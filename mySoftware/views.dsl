systemContext ss "SystemContext" {
    include u
    include ss
    include paymentGateway
    include notificationService
    include analyticsPlatform

    animation {
        u
        ss
        paymentGateway notificationService analyticsPlatform
    }

    autolayout lr
}

filtered "SystemContext" include "Element,Relationship" "SystemContextAll" "Unfiltered context view (explicit key for navigation stability)"

filtered "SystemContext" exclude "InboundOnly,InboundDependency" "SystemContextOutboundOnly" "Outbound dependencies focus"

filtered "SystemContext" exclude "OutboundOnly,OutboundDependency" "SystemContextInboundOnly" "Inbound dependencies focus"

container ss "Containers" {
    include u
    include ss.wa
    include ss.db
    autolayout lr
}

component ss.db "DatabaseComponents" {
    include ss.db.tableA
    include ss.db.tableB
    autolayout lr
}

dynamic * "OrderCheckoutFlow" "Main outbound order flow" {
    1: relUserToSystem "User starts checkout"
    2: relSystemToPaymentGateway "Authorize payment"
    3: relPaymentGatewayToSystem "Receive settlement update"
    4: relSystemToAnalyticsPlatform "Publish order event"
    autolayout lr
}

dynamic * "CallbackAndSettlementFlow" "Inbound callback processing flow" {
    1: relNotificationServiceToSystem "Delivery callback received"
    2: relPaymentGatewayToSystem "Settlement callback received"
    3: relSystemToAnalyticsPlatform "Publish callback processing event"
    autolayout lr
}

deployment ss "Local Development" "LocalDevelopmentDeployment" {
    include *
    animation {
        ss.wa
        ss.db
    }
    autolayout lr
}

deployment ss "Production" "ProductionDeployment" {
    include *
    animation {
        ss.wa
        ss.db
    }
    autolayout lr
}

styles {
    element "Person" {
        shape person
        background #0b5ea8
        color #ffffff
    }

    element "Software System" {
        background #1f2a44
        color #ffffff
    }

    element "External" {
        background #6a1b9a
        color #ffffff
    }

    relationship "OutboundDependency" {
        color #1976d2
        thickness 3
    }

    relationship "InboundDependency" {
        color #ef6c00
        thickness 3
        dashed true
    }

    element "Container" {
        background #2e7d32
        color #ffffff
    }

    element "Component" {
        background #546e7a
        color #ffffff
    }

    element "Database" {
        shape cylinder
        background #ad1457
        color #ffffff
    }

    element "DataTable" {
        shape component
        background #37474f
        color #ffffff
    }
}
