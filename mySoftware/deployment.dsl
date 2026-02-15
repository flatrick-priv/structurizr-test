deploymentEnvironment "Local Development" {
    deploymentNode "Developer Workstation" "Local machine for development and testing" "Linux/macOS/Windows" {
        localWebApp = containerInstance ss.wa {
            healthCheck "Local web app health" "http://localhost:8080/health"
        }
        localDatabase = containerInstance ss.db
    }
}

deploymentEnvironment "Production" {
    deploymentNode "Cloud Platform" "Managed runtime and data services" "Cloud" {
        prodWebApp = containerInstance ss.wa {
            healthCheck "Production web app health" "https://app.example.com/health"
        }
        prodDatabase = containerInstance ss.db
    }
}
