# Unified Package Cache (unified-cache)

This devcontainer feature provides a shared, mounted cache volume for common package managers and
build caches to speed up devcontainer startup and dependency installation.

Key behavior (from `devcontainer-feature.json`):

- Feature ID: `unified-cache`
- Version: 1.1.0
- Mounts a Docker volume named `ecoma-unified-cache` at `/cache` inside the container
- Exposes common cache environment variables (for Go, npm, yarn, pnpm, pip, Terraform, Ansible,
  etc.) so tools use the shared volume

Quick enablement

- Local feature (when using this repository as devcontainer definition): add the feature to your
  `devcontainer.json` features. Example (relative/local feature):

```json
"features": {
  "./.devcontainer/features/unified-cache": {}
}
```

- Published feature (if available from a registry): reference the published feature ID and version
  in your `devcontainer.json` `features` section.

Environment variables set by the feature

See `devcontainer-feature.json` for the full list; notable ones include:

- `GOCACHE`, `GOMODCACHE` for Go
- `npm_config_cache`, `YARN_CACHE_FOLDER`, `PNPM_HOME` for Node managers
- `PIP_CACHE_DIR` for pip
- `TF_PLUGIN_CACHE_DIR` for Terraform
- `ANSIBLE_*` paths for Ansible roles/collections

Volume lifecycle and notes

- The feature mounts a named Docker volume `ecoma-unified-cache`. The volume persists across
  container restarts and can be used by multiple repo/devcontainers.
- To inspect or remove the volume locally:

```bash
docker volume ls | grep ecoma-unified-cache
docker volume inspect ecoma-unified-cache
docker volume rm ecoma-unified-cache
```

Known limitations

- Using a shared cache can mask dependency changes; when troubleshooting, try clearing the cache
  volume and rebuilding the container.
- Permission issues: files in the volume are owned by the container user that populated them;
  remounting in other environments may require `chown` or rebuild.
