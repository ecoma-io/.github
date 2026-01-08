#!/usr/bin/env bash
set -euo pipefail

printf "Checking cache directories\n"

CACHE_DIR="/cache"
SUBDIRS=(
    "go-build"
    "go-mod"
    "npm"
    "yarn"
    "pnpm"
    "terraform"
    "pip"
    "ansible/galaxy"
    "ansible/roles"
    "ansible/collections"
    "dprint"
)

if [ -d "$CACHE_DIR" ]; then
    printf "✅ Cache directory %s exists\n" "$CACHE_DIR"
else
    printf "❌ Cache directory %s does not exist\n" "$CACHE_DIR"
    exit 1
fi

for d in "${SUBDIRS[@]}"; do
    path="$CACHE_DIR/$d"
    if [ -d "$path" ]; then
        printf "✅ %s exists\n" "$path"
    else
        printf "❌ %s does not exist\n" "$path"
        exit 1
    fi
done

# Check ownership or permissive fallback
owner=$(stat -c %U "$CACHE_DIR")
perms=$(stat -c %a "$CACHE_DIR")

if [ "$owner" != "root" ]; then
    printf "✅ Cache directory is owned by non-root user: %s\n" "$owner"
elif [ "$perms" = "777" ]; then
    printf "✅ Cache directory has permissive fallback permissions: %s\n" "$perms"
else
    printf "❌ Cache directory is root-owned and not writable by all (owner=%s perms=%s)\n" "$owner" "$perms"
    exit 1
fi

# Ensure cache directories are writable by the current user
tmpfail=0
for d in "${SUBDIRS[@]}"; do
    path="$CACHE_DIR/$d"
    if touch "$path/.cache_test_$$" 2>/dev/null; then
        rm -f "$path/.cache_test_$$"
        printf "✅ Writable: %s\n" "$path"
    else
        printf "❌ Not writable: %s\n" "$path"
        tmpfail=1
    fi
done

if [ "$tmpfail" -ne 0 ]; then
    printf "One or more cache subdirectories are not writable by the current user.\n"
    exit 1
fi

# Optional: if pnpm/npm/yarn are installed, report their configured cache locations
# but do not fail the test because install.sh currently only prepares the dirs and
# handles ownership/permissions.
if command -v pnpm >/dev/null 2>&1; then
    pnpm_path=$(pnpm store path 2>/dev/null || true)
    if [ -n "$pnpm_path" ]; then
        if [ "$pnpm_path" = "/cache/pnpm" ]; then
            printf "✅ PNPM store path: %s\n" "$pnpm_path"
        else
            printf "⚠️  PNPM store path is not /cache/pnpm (current: %s)\n" "$pnpm_path"
        fi
    fi
fi

if command -v npm >/dev/null 2>&1; then
    npm_cache=$(npm config get cache 2>/dev/null || true)
    if [ -n "$npm_cache" ]; then
        if [ "$npm_cache" = "/cache/npm" ]; then
            printf "✅ NPM cache: %s\n" "$npm_cache"
        else
            printf "⚠️  NPM cache is not /cache/npm (current: %s)\n" "$npm_cache"
        fi
    fi
fi

if command -v yarn >/dev/null 2>&1; then
    yarn_cache=$(yarn config get cacheFolder 2>/dev/null || true)
    if [ -n "$yarn_cache" ]; then
        if [ "$yarn_cache" = "/cache/yarn" ]; then
            printf "✅ Yarn cache: %s\n" "$yarn_cache"
        else
            printf "⚠️  Yarn cache is not /cache/yarn (current: %s)\n" "$yarn_cache"
        fi
    fi
fi

printf "All cache checks passed (or non-fatal warnings reported).\n"