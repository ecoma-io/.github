#!/usr/bin/env bash
set -euo pipefail

# Install prerequisites if missing
if ! type curl > /dev/null 2>&1; then
  apt-get update && apt-get install -y curl
fi

# Download and install latest actionlint
curl -s https://raw.githubusercontent.com/rhysd/actionlint/main/scripts/download-actionlint.bash | bash -s -- latest /tmp
sudo cp /tmp/actionlint /usr/local/bin/actionlint
sudo chmod +x /usr/local/bin/actionlint

echo "actionlint installed: $(/usr/local/bin/actionlint --version 2>/dev/null || echo 'installed')"
