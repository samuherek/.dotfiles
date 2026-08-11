#!/bin/sh

load_host() {
    dotfiles_root="$1"
    host_name="$2"
    host_file="$dotfiles_root/hosts/$host_name.sh"

    require_file "$host_file"

    PLATFORM=""
    ROLES=""

    HOST_STOW=""
    HOST_PACKAGE_GROUPS_MACOS=""
    HOST_DEFAULT_GROUPS_MACOS=""

    source "$host_file"

    require_value "PLATFORM" "$PLATFORM"
    require_value "ROLES" "$ROLES"
}
