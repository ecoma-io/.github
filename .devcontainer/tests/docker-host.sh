#!/usr/bin/env bash
set -euo pipefail

printf "Checking docker-host wrapper installation\n"

# Check if docker-host command exists
if command -v docker-host >/dev/null 2>&1; then
  printf "✅ docker-host command is available in PATH\n"
else
  printf "❌ docker-host command not found in PATH\n"
  exit 1
fi

# Check if docker-host is executable
if [ -x /usr/local/bin/docker-host ]; then
  printf "✅ /usr/local/bin/docker-host is executable\n"
else
  printf "❌ /usr/local/bin/docker-host is not executable or doesn't exist\n"
  exit 1
fi

# Check if docker-host script contains the expected Docker socket reference
if grep -q "unix:///var/run/docker.host.sock" /usr/local/bin/docker-host; then
  printf "✅ docker-host wrapper references /var/run/docker.host.sock\n"
else
  printf "❌ docker-host wrapper does not reference the expected socket\n"
  exit 1
fi

# Check if the host socket exists (mounted)
if [ -S /var/run/docker.host.sock ]; then
  printf "✅ /var/run/docker.host.sock socket exists\n"
else
  printf "❌  /var/run/docker.host.sock socket not found (may not be mounted in this environment)\n"
  exit 1
fi

# Check if standard docker.sock exists
if [ -S /var/run/docker.sock ]; then
  printf "✅ /var/run/docker.sock socket exists\n"
else
  printf "❌  /var/run/docker.sock socket not found (may not be mounted in this environment)\n"
  exit 1
fi

# Try to run a harmless docker-host command if docker CLI is available
if docker-host --version >/dev/null 2>&1; then
    version=$(docker-host --version)
    printf "✅ docker-host wrapper executed successfully (Docker version: %s)\n" "$version"
else
    printf "❌ docker-host command exists but cannot connect to Docker daemon (may not be running or accessible)\n"
    exit 1
fi

printf "All docker-host checks passed (or non-fatal warnings reported).\n"
