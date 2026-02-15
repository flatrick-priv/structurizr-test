#!/usr/bin/env bash
set -euo pipefail

# Temporary Linux helper for previewing structurizr-test.
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PORT="${1:-8080}"

docker run --rm \
  --user "$(id -u):$(id -g)" \
  -v "${SCRIPT_DIR}:/var/model" \
  -p "${PORT}:8080" \
  -w /var/model \
  ghcr.io/avisi-cloud/structurizr-site-generatr \
  serve --workspace-file workspace.dsl
