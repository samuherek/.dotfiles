#!/bin/sh

load_roles() {
    dotfiles_root="$1"
    platform="$2"
    roles="$3"

    ROLE_STOW_SHARED_ACCUM=""
    ROLE_STOW_PLATFORM_ACCUM=""
    ROLE_PACKAGE_GROUPS_ACCUM=""
    ROLE_DEFAULT_GROUPS_ACCUM=""

    for role in $roles; do
        role_file="$dotfiles_root/roles/$role.sh"
        require_file "$role_file"

        ROLE_NAME=""
        ROLE_STOW_SHARED=""
        ROLE_STOW_MACOS=""
        ROLE_STOW_LINUX=""
        ROLE_STOW_NAS=""
        ROLE_PACKAGE_GROUPS_MACOS=""
        ROLE_DEFAULT_GROUPS_MACOS=""

        . "$role_file"

        ROLE_STOW_SHARED_ACCUM="$(merge_lists "$ROLE_STOW_SHARED_ACCUM" "$ROLE_STOW_SHARED")"

        case "$platform" in
            macos)
                ROLE_STOW_PLATFORM_ACCUM="$(merge_lists "$ROLE_STOW_PLATFORM_ACCUM" "$ROLE_STOW_MACOS")"
                ROLE_PACKAGE_GROUPS_ACCUM="$(merge_lists "$ROLE_PACKAGE_GROUPS_ACCUM" "$ROLE_PACKAGE_GROUPS_MACOS")"
                ROLE_DEFAULT_GROUPS_ACCUM="$(merge_lists "$ROLE_DEFAULT_GROUPS_ACCUM" "$ROLE_DEFAULT_GROUPS_MACOS")"
                ;;
            linux)
                ROLE_STOW_PLATFORM_ACCUM="$(merge_lists "$ROLE_STOW_PLATFORM_ACCUM" "$ROLE_STOW_LINUX")"
                ;;
            nas)
                ROLE_STOW_PLATFORM_ACCUM="$(merge_lists "$ROLE_STOW_PLATFORM_ACCUM" "$ROLE_STOW_NAS")"
                ;;
            *)
                fail "unsupported platform: $platform"
                ;;
        esac
    done

    ROLE_STOW_SHARED="$ROLE_STOW_SHARED_ACCUM"
    ROLE_STOW_PLATFORM="$ROLE_STOW_PLATFORM_ACCUM"
    ROLE_PACKAGE_GROUPS="$ROLE_PACKAGE_GROUPS_ACCUM"
    ROLE_DEFAULT_GROUPS="$ROLE_DEFAULT_GROUPS_ACCUM"
}
