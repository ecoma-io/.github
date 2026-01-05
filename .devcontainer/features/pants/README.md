# Pants build system (pants)

This feature installs and configures the Pants build system inside the devcontainer, making it
convenient to run builds, tests, and other Pants tasks during development.

Enablement

Local example (enable the feature from this repository):

```json
"features": {
  "./.devcontainer/features/pants": {}
}
```

Notes

- The feature installs the `pants` binary and configures environment entries where appropriate.
  Refer to your project's Pants configuration for usage details.
- No feature-specific options are defined for the local feature; if using a published feature, check
  its `devcontainer-feature.json` for available options.
