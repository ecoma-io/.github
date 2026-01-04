<!-- markdownlint-disable -->
<div align="center">

[![License: MIT](https://img.shields.io/badge/License-MIT-orange.svg)](LICENSE.md)
[![CI](https://github.com/ecoma-io/.github/actions/workflows/ci.yaml/badge.svg)](https://github.com/ecoma-io/.github/actions/workflows/ci.yaml)
[![Open in DevContainer](https://img.shields.io/badge/Open-DevContainer-blue.svg)](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/ecoma-io/.github)

</div>
<div align="center">
  <a href="https://ecoma.io">
    <img src=".github/logo.png" alt="Logo" height="60">
  </a>
</div>
<!-- markdownlint-restore -->

# Ecoma Profile Repository

This repository provides common contribute guide, ecoma's profile page and prebuild devcontainer
image used across ecoma's repositories.

![Screenshot](.github/screenshot.png)

## Key Features

The devcontainer in this repository provides a pre-configured development environment for shared use
across ecoma projects.

**Highlights include:**

- **Operating System**: Debian 12 (bookworm).
- **Pre-installed tools**: `git`,`zsh`, `oh my zsh`, `shellcheck`, `shfmt`, `lefthook`, `dprint`,
  `conform`, `yq`, `jq`, `gitleak`, `docker` (docker in docker), `bazel` and some other common tools
- **Languages & runtime**: `go` and `nodejs` lastest version
- **Container-based development support**: Configured for direct opening in VS Code Dev Container
  (see the "Open in DevContainer" button at the top of the README).

## Quick Start Guide

Use image for devcontainer or create image base on `ghcr.io/ecoma-io/devcontainer`

## Contributing

If you want to contribute, open an issue or a PR describing your change. Keep changes focused and
add tests for new behaviors.

Follow [Contributing Guide](CONTRIBUTING.md)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE.md) for more details.
