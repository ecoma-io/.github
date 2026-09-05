# Agent guidance

For working **on** this repository. Read it before the first edit — the rules
below are the ones a diff gets rejected for violating, and most of them are not
inferable from the code.

## What this repository is

`ecoma-io/.github` — the organization's special repository. GitHub treats the
repository named `.github` at an organization's root as two things at once, and
every rule below follows from that:

1. **The default community-health layer.** Every supported file here becomes
   the default for each public repository of ecoma-io that does not carry its
   own file of that type. It is a **fallback layer, never an override layer**:
   a repository's own file always wins, silently — loom's own
   `CODE_OF_CONDUCT.md` and the issue forms loom, action-agents and archkeep
   keep are untouched by anything added here.
2. **The organization's front door.** `profile/README.md` renders as the
   overview README on `github.com/ecoma-io`, visible to anyone. It is a landing
   page for people who have never heard of ecoma — not internal
   documentation — and English-first like every public artifact.

At present the repository holds the profile skeleton, the banner, and this
file; the default layer is yet to be built, and additions follow the placement
table below. There is no code, no toolchain and no CI here, and none belongs
here: the environment that renders these files is GitHub, and only GitHub
verifies them. A change that seems to need a build step is in the wrong
repository. This is org infrastructure, not one of the six product/tool repos
in the cross-repo `CLAUDE.md`; that file governs cross-repo process, this one
governs work here.

## The mechanics a diff is judged on

The supported defaults, and the only places each may sit — from
[GitHub's documentation](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/creating-a-default-community-health-file):

| Default file                                                                     | Where it may sit here                                    |
| -------------------------------------------------------------------------------- | -------------------------------------------------------- |
| `CONTRIBUTING.md`, `SECURITY.md`, `CODE_OF_CONDUCT.md`, `SUPPORT.md`             | root, `.github/` or `docs/` — root, and exactly one copy |
| Issue templates (`*.md`) and `ISSUE_TEMPLATE/config.yml`                         | only `.github/ISSUE_TEMPLATE/`                           |
| `PULL_REQUEST_TEMPLATE.md` (or directory)                                        | root, `.github/` or `docs/` — root                       |
| Discussion templates                                                             | only `.github/DISCUSSION_TEMPLATE/`                      |
| `FUNDING.yml`                                                                    | only root — none here; adding one is a founder decision  |

Three facts that can make a well-intentioned diff a no-op:

- **A wrong name, extension or folder is silently ignored.** `SECURITY.MD`,
  `issue-templates/`, an `ISSUE_TEMPLATE/` at the root — none of them
  propagate, and nothing errors anywhere. Filename exactness is a rule, not a
  style preference.
- **Only the default branch is read.** A default or profile edit on any other
  branch changes nothing until it merges to `main`.
- **This repository must stay public.** A private `.github` serves no
  defaults, and there is no private variant of this repository's function.

## What deliberately does not live here

- **Workflows.** Nothing in this repository's `.github/workflows/` ever runs
  in another repository. Shared CI is not something this repo can offer;
  org-wide automation lives in `action-agents` and is adopted per repo.
- **`CODEOWNERS`.** Not a supported default — it cannot be centralized here;
  each repository declares its own.
- **Issue forms (YAML).** Markdown issue templates propagate as defaults;
  issue forms placed here do not surface in member repositories (a documented
  limitation — see [community discussion
  #118253](https://github.com/orgs/community/discussions/118253)). The org's
  repositories keep their own forms; do not try to centralize them.
- **Anything repo-specific** — a template naming one repo's packages, a
  CONTRIBUTING describing pnpm commands, a PR checklist that only makes sense
  for code. A default here reaches a repository with no toolchain as readily
  as the Rust monorepo: keep every file org-generic, and put the specific
  version in the repository it is specific to.
- **Defaults for private repositories.** `.github` serves public repositories
  only. `ecoma-cloud` and any other private repository will never see anything
  from here; if that is ever wanted, it is a separate `.github-private`
  repository, not a folder in this one.

## `profile/README.md`

- Written for a first-time visitor: what ecoma is, the repositories, where to
  start. English-first, like everything public.
- The banner embeds by **relative path** (`../.github/assets/banner.png`) —
  the profile renders from this repository, so a relative reference resolves
  here and has no host or branch baked into it. Keep profile assets under
  `.github/assets/`.
- Files under `profile/` are **ignored for community-health purposes** — safe
  for scratch content, but never a place to put a file that should propagate.

## Editing a default: blast radius first

A change to a default reaches every public repository that lacks its own copy
of that file — and is invisible to every repository that has one. Before
proposing a change, establish which repositories actually consume it, and name
that in the PR: *"verified visible on X (no copy of its own), correctly
ignored on Y (has its own)."* A default nobody consumes is dead weight; a
default that surprises a consumer is a regression in that repository's
contributor experience.

Changes land through the org gate — issue here, branch, draft PR — as the
cross-repo rules require; not restated here.

## Verifying a change — manual, because there is no CI

- **A default file:** once merged to `main`, open a consuming repository and
  confirm the file appears where GitHub surfaces it — the issue picker for
  issue templates, the PR description box for PR templates, the community
  standards tab for CONTRIBUTING, SECURITY and CODE_OF_CONDUCT. Then confirm a
  repository with its own copy still shows its own.
- **The profile:** visit `github.com/ecoma-io`; rendering follows `main`, and
  the banner and links must resolve from there.

## Filing defects

A defect in one of this repository's files — a broken link in the profile, a
default that renders wrong — is filed here. A defect in a repository's **own**
`.github` wiring (its issue forms, its workflows, its CODEOWNERS) belongs to
that repository even if the template text originated here. GitHub platform
behaviour is not our bug: record it in the PR that hit it and link the
upstream community discussion.

## Conventions

- English for every public artifact; Vietnamese only in conversation.
- `CLAUDE.md` stays the one-line `@AGENTS.md` import — guidance goes in this
  file, where every host reads it.
- No `package.json`, no lockfile, no CI, no dependencies — a repository of
  markdown that builds nothing. Keep it that way.
- Everything here is Apache-2.0 ([`LICENSE`](LICENSE)) — the banner included,
  which is a deliberate choice, not an oversight. Do not add a second or
  conflicting license notice anywhere in the tree.
