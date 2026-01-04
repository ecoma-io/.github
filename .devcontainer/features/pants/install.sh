#!/usr/bin/env bash
set -e

curl --proto '=https' --tlsv1.2 -fsSL https://static.pantsbuild.org/setup/get-pants.sh | bash
sudo mv ~/.local/bin/pants /usr/local/bin/pants
