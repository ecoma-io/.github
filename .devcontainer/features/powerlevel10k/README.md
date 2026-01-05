# Powerlevel10k theme

This feature installs and configures the `powerlevel10k` prompt theme for Zsh inside the
devcontainer and supports providing a remote configuration file.

Options (from `devcontainer-feature.json`)

- `config` (string): URL to a `powerlevel10k` configuration file.
- `version` (string): theme version to install (default: `latest`).
- `deletePreinstalledThemes` (boolean): remove preinstalled themes (default: `false`).
- `debug` (boolean): enable debug output (internal use).

Enablement example (local):

```json
"features": {
  "./.devcontainer/features/powerlevel10k": {
    "config": "https://example.com/p10k.zsh",
    "version": "v1.17.0"
  }
}
```

Notes

- If you supply a `config` URL, the feature will attempt to download and apply it.
- Permission or font issues may affect the visual result; verify your terminal supports the
  Powerline/Nerd fonts for best appearance.
