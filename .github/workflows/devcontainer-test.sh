#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

printf "Checking required tools and their versions...\n"

declare -a tools=(
	zsh go node npm yarn pnpm dprint shellcheck lefthook conform shfmt yq jq unzip zip docker bazel
)

# Some tools may be available under alternate command names
declare -A fallbacks
fallbacks=(
	[node]="nodejs"
)

missing=0
for cmd in "${tools[@]}"; do
	if command -v "$cmd" >/dev/null 2>&1; then
		printf "✅ %s: %s\n" "$cmd" "$(command -v "$cmd")"
	else
		fb=${fallbacks[$cmd]:-}
		if [ -n "$fb" ] && command -v "$fb" >/dev/null 2>&1; then
			printf "✅ %s (via %s): %s\n" "$cmd" "$fb" "$(command -v "$fb")"
		else
			printf "❌ %s is not installed\n" "$cmd" >&2
			missing=1
		fi
	fi
done

if [ "$missing" -ne 0 ]; then
	printf "One or more required tools are missing or failed to report versions.\n" >&2
	exit 1
fi

printf "All required checks passed.\n"
