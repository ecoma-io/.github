#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if [ "$#" -eq 0 ]; then
	printf "Usage: %s <tool1> <tool2> ...\n" "$0" >&2
	exit 1
fi

printf "Checking required tools and their versions...\n"

missing=0
for cmd in "$@"; do
	if command -v "$cmd" >/dev/null 2>&1; then
		printf "✅ %s: %s\n" "$cmd" "$(command -v "$cmd")"
	else
		printf "❌ %s is not installed\n" "$cmd" >&2
		missing=1
	fi
done

if [ "$missing" -ne 0 ]; then
	printf "One or more required tools are missing or failed to report versions.\n" >&2
	exit 1
fi

printf "All required checks passed.\n"
