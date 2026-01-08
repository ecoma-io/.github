#!/bin/sh
set -e

CACHE_DIR="/cache"
echo "Initializing agnostic cache directory at $CACHE_DIR"

mkdir -p $CACHE_DIR/go-build \
         $CACHE_DIR/go-mod \
         $CACHE_DIR/npm \
         $CACHE_DIR/yarn \
         $CACHE_DIR/pnpm \
         $CACHE_DIR/terraform \
         $CACHE_DIR/pip \
         $CACHE_DIR/ansible/galaxy \
         $CACHE_DIR/ansible/roles \
         $CACHE_DIR/ansible/collections \
         $CACHE_DIR/dprint

# If a non-root user invoked the installer (via sudo), prefer chowning the cache
# to that user. Fall back to making it writable by everyone if no such user
# is detected.
TARGET_USER="${SUDO_USER:-${USERNAME:-${REMOTE_USER:-}}}"
if [ -n "$TARGET_USER" ] && [ "$TARGET_USER" != "root" ]; then
    echo "Setting ownership of $CACHE_DIR -> $TARGET_USER"
    chown -R "$TARGET_USER":"$TARGET_USER" "$CACHE_DIR" || \
        echo "chown failed; keeping permissive permissions"
    chmod -R u+rwx "$CACHE_DIR" || true
else
    # Safe fallback for unknown environment (CI/container root-only runs)
    chmod -R 0777 "$CACHE_DIR"
fi

echo "Done!"