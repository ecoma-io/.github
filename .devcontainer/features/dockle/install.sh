#!/usr/bin/env bash
set -e

# Ensure curl is available
if ! type curl > /dev/null 2>&1; then
    apt-get update && apt-get install -y curl
fi

echo "Fetching latest Dockle version..."
VERSION=$(curl --silent "https://api.github.com/repos/goodwithtech/dockle/releases/latest" | \
 grep '"tag_name":' | \
 sed -E 's/.*"v([^"]+)".*/\1/')

if [ -z "$VERSION" ]; then
    echo "Error: Could not determine latest Dockle version."
    exit 1
fi

echo "Installing Dockle v${VERSION}..."
curl -L -o dockle.deb "https://github.com/goodwithtech/dockle/releases/download/v${VERSION}/dockle_${VERSION}_Linux-64bit.deb"
dpkg -i dockle.deb
rm dockle.deb

echo "Dockle installed!"
