#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "${SCRIPT_DIR}"

required_doc_files=(
  "_docs/00-index.md"
  "_docs/STRUCTURIZR_SITE_GENERATR_COMPATIBILITY.md"
  "_docs/architecture/ADR-0001-modeling-approach.md"
  ".agent/AGENT_WRITING_GUIDELINES.md"
  "mySoftware/_docs/00-index.md"
  "mySoftware/_docs/01-system-documentation.md"
  "mySoftware/Database/_docs/00-index.md"
  "mySoftware/Database/tableA/_docs/00-index.md"
  "mySoftware/Database/tableB/_docs/00-index.md"
)

for file in "${required_doc_files[@]}"; do
  if [[ ! -f "${file}" ]]; then
    echo "Verification failed: missing required documentation file: ${file}" >&2
    exit 1
  fi
done

./generate-site.sh >/tmp/structurizr-test-generate.log 2>&1

WORKSPACE_JSON="build/site/master/workspace.json"
if [[ ! -f "${WORKSPACE_JSON}" ]]; then
  echo "Verification failed: missing ${WORKSPACE_JSON}" >&2
  exit 1
fi

required_view_keys=(
  '"key" : "SystemContext"'
  '"key" : "SystemContextAll"'
  '"key" : "SystemContextOutboundOnly"'
  '"key" : "SystemContextInboundOnly"'
  '"key" : "Containers"'
  '"key" : "DatabaseComponents"'
  '"key" : "OrderCheckoutFlow"'
  '"key" : "CallbackAndSettlementFlow"'
  '"key" : "LocalDevelopmentDeployment"'
  '"key" : "ProductionDeployment"'
)

for key in "${required_view_keys[@]}"; do
  if ! rg -q "${key}" "${WORKSPACE_JSON}"; then
    echo "Verification failed: expected view key not found: ${key}" >&2
    exit 1
  fi
done

required_element_names=(
  '"name" : "My Software Platform"'
  '"name" : "Payment Gateway"'
  '"name" : "Notification Service"'
  '"name" : "Analytics Platform"'
  '"name" : "Web Application"'
  '"name" : "Database Schema"'
  '"name" : "Customers Table"'
  '"name" : "Orders Table"'
)

for name in "${required_element_names[@]}"; do
  if ! rg -q "${name}" "${WORKSPACE_JSON}"; then
    echo "Verification failed: expected element not found: ${name}" >&2
    exit 1
  fi
done

required_runtime_markers=(
  '"healthChecks" : ['
  '"name" : "Local web app health"'
  '"name" : "Production web app health"'
  '"animations" : ['
)

for marker in "${required_runtime_markers[@]}"; do
  if ! rg -F -q "${marker}" "${WORKSPACE_JSON}"; then
    echo "Verification failed: expected runtime marker not found: ${marker}" >&2
    exit 1
  fi
done

echo "Verification passed."
echo "- Generated site: ${SCRIPT_DIR}/build/site"
echo "- Verified views: SystemContext/SystemContextAll/SystemContextOutboundOnly/SystemContextInboundOnly, Containers, DatabaseComponents, OrderCheckoutFlow, CallbackAndSettlementFlow, LocalDevelopmentDeployment, ProductionDeployment"
echo "- Verified required docs files: ${#required_doc_files[@]}"
echo "- Verified runtime markers: ${#required_runtime_markers[@]}"
