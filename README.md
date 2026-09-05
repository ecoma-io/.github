# ecoma-io/.github

The ecoma-io organization's special repository. GitHub gives the repository
named `.github` two roles, and this one carries both:

- **Organization profile** — [`profile/README.md`](profile/README.md) renders as the
  overview page of [github.com/ecoma-io](https://github.com/ecoma-io).
- **Default community files** — supported files here (`CONTRIBUTING.md`,
  `SECURITY.md`, issue and pull-request templates, …) become the defaults for
  every public repository of the organization that does not define its own.
  A repository's own file always wins.

## What lives where

| Path                       | What it holds                                                            |
| -------------------------- | ------------------------------------------------------------------------ |
| `profile/`                 | The organization's public profile page; ignored as a source of defaults  |
| root, `.github/`, `docs/`  | Organization-wide default community health files, as they are added      |
| `.github/assets/`          | Shared profile assets, such as the banner                                 |
| `AGENTS.md`                | Guidance for AI agents working on this repository                        |

Work in this repository is governed by [`AGENTS.md`](AGENTS.md) plus the
cross-repo rules of the ecoma-io organization.

## License

[Apache-2.0](LICENSE) — everything in this repository, the banner included.
