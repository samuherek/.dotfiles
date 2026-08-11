# Workstation role: interactive desktop or laptop machine with GUI-oriented tooling.

ROLE_NAME="workstation"

ROLE_STOW_SHARED=""
ROLE_STOW_MACOS="wezterm yabai skhd hammerspoon"
ROLE_STOW_LINUX=""
ROLE_STOW_NAS=""

ROLE_PACKAGE_GROUPS_MACOS="gui workstation-apps browsers networking"
ROLE_DEFAULT_GROUPS_MACOS=""
ROLE_APP_GROUPS_MACOS="flux"
ROLE_HOTKEY_GROUPS_MACOS="hotkeys"
ROLE_SCRIPT_GROUPS_MACOS="ensure-yabai-spaces start-yabai start-skhd"
