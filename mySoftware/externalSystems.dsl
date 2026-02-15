paymentGateway = softwareSystem "Payment Gateway" "Third-party payment authorization and capture provider" {
    tags "External,BidirectionalExternal"
    perspectives {
        "Ownership" "Payments Platform Team"
        "Data Classification" "External/Untrusted"
    }
}

notificationService = softwareSystem "Notification Service" "External service for email and SMS delivery" {
    tags "External,InboundOnly"
    perspectives {
        "Ownership" "Comms Platform Team"
        "Data Classification" "External/Untrusted"
    }
}

analyticsPlatform = softwareSystem "Analytics Platform" "External analytics and event processing service" {
    tags "External,OutboundOnly"
    perspectives {
        "Ownership" "Data Platform Team"
        "Data Classification" "External/Untrusted"
    }
}
