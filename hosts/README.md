# Hosts

Hosts define concrete machines.

A host should specify:

- `PLATFORM`
- `ROLES`
- optional host-specific overrides

Example:

```sh
PLATFORM="macos"
ROLES="base developer workstation"

HOST_STOW=""
HOST_PACKAGE_GROUPS_MACOS="golang cloud apple-dev"
HOST_DEFAULT_GROUPS_MACOS=""
HOST_APP_GROUPS_MACOS=""
HOST_HOTKEY_GROUPS_MACOS=""
HOST_SCRIPT_GROUPS_MACOS=""
```

Guidelines:

- put reusable behavior in roles
- keep host files small
- only add overrides that are truly machine-specific
