# Contribute Guide

This document provides a concise, organization-wide contribution guide for ecoma-io projects: how to
set up the DevContainer, the signed-commit (GPG) policy, commit message conventions, basic lint/test
commands, and a PR checklist.

## Opening the repository in a DevContainer

- Requirements: Visual Studio Code with the Dev Containers extension and a container runtime such as
  Docker.
- Quick open in container: F1 → "Dev Containers: Clone Repository in Container Volume..." → paste
  repo URL → select branch (commonly `dev`).
- To attach to an already-running container: "Dev Containers: Attach to Running Container".

Why clone-in-volume: it improves file I/O performance compared to working on the host folder. See:
https://code.visualstudio.com/remote/advancedcontainers/improve-performance#_use-clone-repository-in-container-volume

After the container starts:

- Check for a post-create script: `.devcontainer/post-create.sh`.
- Run repository quick checks if provided (for example `./test.sh`, `bats` tests, or `make test`).

## Commit message convention

Organization baseline:

- GPG-signed commits required.
- Common types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`,
  `revert`.
- Header: `type(scope): short imperative lowercase subject`
- Header max length: 89 characters; do not end with a period.
- Body line length: 72 characters max.

Example:

```
feat(ci): add commit signing check
```

Repositories may extend or override these rules—check repo-specific docs before contributing.

## Tools (toolchain) and common commands

Common tools used across ecoma-io projects and typical usage:

- lefthook — manage Git hooks
  - Install hooks: `lefthook install`
  - Run hooks manually: `lefthook run pre-commit`
- dprint — code formatting
  - Format project: `dprint fmt`
- gitleaks — detect secrets
  - Quick scan: `gitleaks detect --source . --report=gitleaks-report.json`
- conform — enforce commit message convention
  - Validate commits: `conform check`
    - Run locally to verify commit message format: `conform check --staged` (checks staged commits)
      or `conform check` for a full branch/history scan.
    - Integrate into hooks/CI: add `conform check` to lefthook pre-commit/pre-push or as a dedicated
      CI step to prevent nonconforming commits.
    - Quick fix: run `conform check` early and amend/squash commits to correct messages before
      pushing.
- bazel - building and testing
  - Use Bazelisk when available: `bazelisk <command>` (or `bazel` if aliased) to ensure consistent
    Bazel versions.
  - Common local checks: prefer `bazel build //...`, `bazel test //... --test_output=errors`, and
    use remote caching per repo .bazelrc.
  - See the "Bazel is the primary monorepo build and test system" section below for full commands
    and best practices.

## Basic PR checklist

Before opening or marking a PR ready for review:

- Ensure all commits are GPG-signed.
- Run and pass unit/integration tests and linters.
- Run `dprint fmt` (or repo formatter) and commit formatting changes.
- Run secret scanning (`gitleaks`) locally if applicable.
- Ensure commit messages follow the convention (use `conform` if available).
- Update changelog or release notes if required by the repo.
- Add a clear PR description, link related issues, and assign reviewers.
- Keep PRs focused and small; rebase/squash if necessary per repo rules.

This guide is an organization-wide baseline — repositories may add or override steps. Always consult
repository-specific contributing docs.
