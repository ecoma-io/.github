# Dockle

This devcontainer feature installs and configures **Dockle**, a container image linter focused on
security and best-practice checks for Docker images.

Usage

- Enable the feature in your `devcontainer.json` by referencing the local feature path or the
  published feature ID.

Local example:

```json
"features": {
  "./.devcontainer/features/dockle": {}
}
```

Notes

- The feature provides the `dockle` binary in the container PATH. Run `dockle <image>` to lint
  images.
- No additional options are required for the local feature. If using a published version, consult
  the published feature documentation for available options.
