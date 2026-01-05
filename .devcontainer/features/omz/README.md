# Oh My Zsh plugins (omz-plugin)

This feature installs and activates Oh My Zsh plugins and supports adding custom plugins.

Options (from `devcontainer-feature.json`)

- `preInstalledPlugins` (string): comma-separated list of plugins to activate (default: `git`).
- `customPlugins` (string): comma-separated `name:url` pairs for custom plugins (zip or git URL).
- `deleteInactive` (boolean): whether to remove inactive plugins (default: `false`).
- `debug` (boolean): enable debug output (internal use).

Enablement example (local):

```json
"features": {
  "./.devcontainer/features/omz": {
    "preInstalledPlugins": "git,zsh-syntax-highlighting",
    "customPlugins": "myplugin:https://example.com/myplugin.zip"
  }
}
```

Notes

- This feature depends on `common-utils` when used from published registries; ensure dependencies
  are available when referencing a remote feature.
- For troubleshooting, enable `debug` to surface installation logs.
