# Roles

Roles define reusable machine traits.

They should contain reusable group selections, not machine-specific values.

Current role concerns include:

- stow groups
- package groups
- defaults groups
- app groups
- hotkey groups
- script groups

Example:

```sh
ROLE_NAME="workstation"

ROLE_STOW_MACOS="wezterm yabai skhd hammerspoon"
ROLE_PACKAGE_GROUPS_MACOS="gui workstation-apps browsers networking"
ROLE_APP_GROUPS_MACOS="flux"
ROLE_HOTKEY_GROUPS_MACOS="hotkeys"
ROLE_SCRIPT_GROUPS_MACOS="ensure-yabai-spaces start-yabai start-skhd"
```

Keep roles reusable. If something is only true for one machine, put it in the host instead.
