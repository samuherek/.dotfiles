# Packages

`packages/` contains install groups.

For macOS, each group is a Brewfile:

```text
packages/macos/<group>.Brewfile
```

Example groups:

- `dotfiles`
- `terminal`
- `security`
- `workstation-env`
- `gui`
- `browsers`
- `golang`
- `cloud`

Roles and hosts reference package group names, not raw package lists.

Example:

```sh
ROLE_PACKAGE_GROUPS_MACOS="dotfiles terminal security"
HOST_PACKAGE_GROUPS_MACOS="golang cloud"
```

The runner resolves those group names and installs them with `brew bundle --file ...`.
