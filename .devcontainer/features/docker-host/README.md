# Docker Host Access Feature

This feature provides a convenient `docker-host` wrapper command to interact with the host Docker
daemon from within a dev container.

## Usage

The feature automatically:

- Mounts `/var/run/docker.sock` from the host to both `/var/run/docker.sock` and
  `/var/run/docker.host.sock` in the container
- Installs a `docker-host` command wrapper at `/usr/local/bin/docker-host`

### Running Commands

Use `docker-host` just like you would use `docker`, but it will always communicate with the host
Docker daemon:

```bash
# List containers on the host
docker-host ps

# Build an image on the host
docker-host build -t myimage .

# Run a container on the host
docker-host run -it ubuntu bash

# Any docker command works
docker-host images
docker-host network ls
```

## Why Two Sockets?

- `/var/run/docker.sock` - Standard location, may be used by docker-in-docker or other tools
- `/var/run/docker.host.sock` - Explicit host socket, guaranteed to point to the host daemon

The `docker-host` wrapper always uses `/var/run/docker.host.sock` to avoid ambiguity.

## Prerequisites

- The host must have Docker installed and running
- The dev container must have the Docker CLI available (install via `docker-in-docker` or
  `docker-outside-docker` features)

## Example devcontainer.json

```json
{
  "features": {
    "ghcr.io/devcontainers/features/docker-in-docker:latest": {},
    "./features/docker-host": {}
  }
}
```

## Options

This feature currently has no configurable options.
