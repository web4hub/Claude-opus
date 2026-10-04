#!/usr/bin/env bash
set -Eeuo pipefail
readonly DEFAULT_URL="https://www.kaggle.com/api/v1/models/web4app/claudeopus/transformers/default/1/download"
readonly HOME_DIR="${CLAUDE_OPUS_HOME:-$HOME/.cache/claude-opus}"
readonly URL="${CLAUDE_OPUS_URL:-$DEFAULT_URL}"
readonly DOWNLOAD_DIR="$HOME_DIR/downloads"
readonly ARCHIVE="$DOWNLOAD_DIR/model.tar.gz"
readonly CHECKSUM="${CLAUDE_OPUS_SHA256:-}"
mkdir -p "$DOWNLOAD_DIR"
command -v curl >/dev/null 2>&1 || { echo "error: curl is required" >&2; exit 1; }
echo "Downloading Claude Opus model archive..."
curl --fail --location --show-error --silent --retry 4 --retry-delay 2 --output "$ARCHIVE" "$URL"
[[ -s "$ARCHIVE" ]] || { echo "error: downloaded archive is empty" >&2; exit 1; }
if [[ -n "$CHECKSUM" ]]; then
  command -v sha256sum >/dev/null 2>&1 || { echo "error: sha256sum is required when CLAUDE_OPUS_SHA256 is set" >&2; exit 1; }
  printf '%s  %s\n' "$CHECKSUM" "$ARCHIVE" | sha256sum --check --strict -
else
  echo "warning: no SHA-256 supplied; download integrity was not cryptographically verified." >&2
fi
echo "Model archive ready: $ARCHIVE"
