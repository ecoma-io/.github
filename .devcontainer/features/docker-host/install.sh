#!/bin/sh
set -e

echo "Installing docker-host wrapper command..."

# Create the docker-host wrapper script
cat > /usr/local/bin/docker-host <<'EOF'
#!/bin/sh
# docker-host: wrapper to interact with the host Docker daemon
# Usage: docker-host [docker-args...]

exec docker -H unix:///var/run/docker.host.sock "$@"
EOF

# Make it executable
chmod +x /usr/local/bin/docker-host

# Try to set permissions on docker.host.sock if it exists
# This might fail in CI environments, so we make it optional
if [ -e /var/run/docker.host.sock ]; then
  chmod 666 /var/run/docker.host.sock 2>/dev/null || echo "Warning: Could not set permissions on docker.host.sock"
fi

echo "docker-host wrapper installed successfully at /usr/local/bin/docker-host"
echo "Usage: docker-host ps"
