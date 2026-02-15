#!/usr/bin/env bash
set -euo pipefail

# Temporary Linux helper for rendering structurizr-test.
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

docker run --rm \
  --user "$(id -u):$(id -g)" \
  -v "${SCRIPT_DIR}:/var/model" \
  -w /var/model \
  ghcr.io/avisi-cloud/structurizr-site-generatr \
  generate-site --workspace-file workspace.dsl --output-dir build/site
