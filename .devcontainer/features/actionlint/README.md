````markdown
# actionlint

This devcontainer feature installs **actionlint**, a linter for GitHub Actions workflow files.

Usage

- Enable the feature in your `devcontainer.json` by referencing the local feature path.

Local example:

```json
"features": {
  "./.devcontainer/features/actionlint": {}
}
```

Notes

- The feature installs the `actionlint` binary to `/usr/local/bin`.
- After the feature runs, verify installation with `actionlint --version`.
````
