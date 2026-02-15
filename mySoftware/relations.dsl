relUserToWebApp = u -> ss.wa "Uses to complete workflows"
relUserToSystem = u -> ss "Uses platform capabilities"

relWebAppToDb = ss.wa -> ss.db "Reads from and writes to" "JDBC/TCP"

relSystemToPaymentGateway = ss -> paymentGateway "Uses for payment processing" "HTTPS/JSON" "OutboundDependency" {
    properties {
        "SLA" "99.9%"
    }
    perspectives {
        "Security" "Signed outbound requests"
    }
}

relSystemToAnalyticsPlatform = ss -> analyticsPlatform "Publishes business events for analytics" "HTTPS/Event API" "OutboundDependency" {
    perspectives {
        "Observability" "High-value business telemetry"
    }
}

relPaymentGatewayToSystem = paymentGateway -> ss "Sends payment settlement updates" "HTTPS/Webhook" "InboundDependency" {
    properties {
        "Auth" "Webhook signature validation"
    }
}

relNotificationServiceToSystem = notificationService -> ss "Sends delivery status callbacks" "HTTPS/Webhook" "InboundDependency" {
    properties {
        "Auth" "Webhook signature validation"
    }
}
