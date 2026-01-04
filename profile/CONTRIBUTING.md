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

## Tools (toolchain)

**Common tools used across ecoma-io projects and typical usage:**

- **lefthook** — Git hooks manager
  - Install hooks: `lefthook install`
  - Run hooks manually: `lefthook run pre-commit`

- **dprint** — Code formatter
  - Format project: `dprint fmt`

- **gitleaks** — Secret detection
  - Quick scan: `gitleaks detect --source . --report=gitleaks-report.json`

- **conform** — Commit message convention enforcement
  - Validate commits: `conform check`
  - Run locally to verify commit message format: `conform check --staged` (checks staged commits) or
    `conform check` for a full branch/history scan.
  - Integrate into hooks/CI: add `conform check` to lefthook pre-commit/pre-push or as a dedicated
    CI step to prevent nonconforming commits.
  - Quick fix: run `conform check` early and amend/squash commits to correct messages before
    pushing.

- **pants** — Build system & dependency tool ([Pants website](https://www.pantsbuild.org))
  - Format code: `./pants fmt ::`
  - Lint: `./pants lint ::`
  - Test: `./pants test ::`
  - Note: repositories typically pin a Pants version and may provide a `./pants` wrapper; consult
    repo docs for project-specific usage.

**Static analysis tools**

- **Hadolint** — Dockerfile linter
  - Lint Dockerfile: `hadolint Dockerfile`
  - Integrate into CI to catch Dockerfile misconfigurations early.

- **Checkov** — IaC (Infrastructure as Code) static analysis
  - Scan Terraform, CloudFormation, Kubernetes YAML, etc.: `checkov -d .`
  - Commonly used for repositories with infrastructure-as-code.

- **Trivy** — Vulnerability scanner for container images, config files, and source code
  - Scan image: `trivy image <image-name>`
  - Scan config files: `trivy config .`
  - Can be integrated into CI/CD for automated checks.

- **Dive** — Analyze Docker image layers
  - Analyze image: `dive <image-name>`
  - Helps optimize image size and detect unnecessary files.

- **Dockle** — Best-practices auditing for Docker images
  - Check image: `dockle <image-name>`
  - Detects security and configuration issues in images.

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
