#!/bin/bash

set -euo pipefail

RUNNER_DIR="$(CDPATH= cd -- "$(dirname "$0")" && pwd)"
DOTFILES_ROOT="$(CDPATH= cd -- "$RUNNER_DIR/.." && pwd)"

source "$RUNNER_DIR/lib/common.sh"
source "$RUNNER_DIR/lib/merge-lists.sh"
source "$RUNNER_DIR/lib/load-host.sh"
source "$RUNNER_DIR/lib/load-roles.sh"
source "$RUNNER_DIR/lib/apply-stow.sh"
source "$RUNNER_DIR/lib/apply-packages.sh"
source "$RUNNER_DIR/lib/apply-defaults.sh"
source "$RUNNER_DIR/lib/state.sh"

help_command() {
    cat <<'EOF'
dotfiles <command> [host]

Commands:
  help           Show this help
  status         Show current applied dotfiles state
  host           Show current stored host name
  apply          Install packages and apply stow using stored host, or prompt if none exists
  apply <host>   Install packages and apply stow using the given host
  defaults       Apply defaults only using stored host, or prompt if none exists
  defaults <host> Apply defaults only using the given host
  install        Install packages only using stored host, or prompt if none exists
  install <host> Install packages only using the given host
  stow           Apply stow only using stored host, or prompt if none exists
  stow <host>    Apply stow only using the given host
EOF
}

resolve_host_name() {
    if [ -n "${1:-}" ]; then
        printf '%s\n' "$1"
        return 0
    fi

    load_state

    if [ -n "$STATE_HOST_NAME" ]; then
        printf '%s\n' "$STATE_HOST_NAME"
        return 0
    fi

    printf 'Host name: '
    read -r input_host_name

    if [ -z "$input_host_name" ]; then
        fail "host name is required"
    fi

    printf '%s\n' "$input_host_name"
}

resolve_final_stow() {
    FINAL_STOW="$(merge_lists \
        "$(prefix_list "shared" "$ROLE_STOW_SHARED")" \
        "$(prefix_list "$PLATFORM" "$ROLE_STOW_PLATFORM")" \
        "$HOST_STOW"
    )"
}

resolve_final_packages() {
    case "$PLATFORM" in
        macos)
            FINAL_PACKAGES="$(merge_lists "$ROLE_PACKAGE_GROUPS" "$HOST_PACKAGE_GROUPS_MACOS")"
            ;;
        linux|nas)
            FINAL_PACKAGES=""
            ;;
        *)
            fail "unsupported platform: $PLATFORM"
            ;;
    esac
}

resolve_final_defaults() {
    case "$PLATFORM" in
        macos)
            FINAL_DEFAULTS="$(merge_lists "$ROLE_DEFAULT_GROUPS" "$HOST_DEFAULT_GROUPS_MACOS")"
            ;;
        linux|nas)
            FINAL_DEFAULTS=""
            ;;
        *)
            fail "unsupported platform: $PLATFORM"
            ;;
    esac
}

load_host_config() {
    HOST_NAME="$(resolve_host_name "${1:-}")"

    load_host "$DOTFILES_ROOT" "$HOST_NAME"
    load_roles "$DOTFILES_ROOT" "$PLATFORM" "$ROLES"
    resolve_final_stow
    resolve_final_packages
    resolve_final_defaults
}

print_apply_summary() {
    printf 'Host: %s\n' "$HOST_NAME"
    printf 'Platform: %s\n' "$PLATFORM"
    printf 'Roles: %s\n' "$ROLES"
    printf 'Packages: %s\n' "$FINAL_PACKAGES"
    printf 'Defaults: %s\n' "$FINAL_DEFAULTS"
    printf 'Stow: %s\n' "$FINAL_STOW"
}

apply_command() {
    load_host_config "${1:-}"

    load_state
    apply_packages "$FINAL_PACKAGES"
    apply_defaults "$FINAL_DEFAULTS"
    apply_stow "$STATE_STOW" "$FINAL_STOW"

    print_apply_summary

    save_state "$HOST_NAME" "$PLATFORM" "$FINAL_STOW" "$FINAL_PACKAGES" "$FINAL_DEFAULTS"
}

defaults_command() {
    load_host_config "${1:-}"

    load_state
    apply_defaults "$FINAL_DEFAULTS"

    print_apply_summary

    save_state "$HOST_NAME" "$PLATFORM" "$STATE_STOW" "$STATE_PACKAGES" "$FINAL_DEFAULTS"
}

install_command() {
    load_host_config "${1:-}"

    load_state
    apply_packages "$FINAL_PACKAGES"

    print_apply_summary

    save_state "$HOST_NAME" "$PLATFORM" "$STATE_STOW" "$FINAL_PACKAGES" "$STATE_DEFAULTS"
}

stow_command() {
    load_host_config "${1:-}"

    load_state
    apply_stow "$STATE_STOW" "$FINAL_STOW"

    print_apply_summary

    save_state "$HOST_NAME" "$PLATFORM" "$FINAL_STOW" "$STATE_PACKAGES" "$STATE_DEFAULTS"
}

status_command() {
    load_state

    if [ -z "$STATE_HOST_NAME" ]; then
        fail "no dotfiles state found"
    fi

    printf 'Host: %s\n' "$STATE_HOST_NAME"
    printf 'Platform: %s\n' "$STATE_PLATFORM"
    printf 'Packages: %s\n' "$STATE_PACKAGES"
    printf 'Defaults: %s\n' "$STATE_DEFAULTS"
    printf 'Stow: %s\n' "$STATE_STOW"
}

host_command() {
    load_state

    if [ -z "$STATE_HOST_NAME" ]; then
        fail "no dotfiles state found"
    fi

    printf '%s\n' "$STATE_HOST_NAME"
}

if [ "$#" -lt 1 ]; then
    help_command
    exit 0
fi

COMMAND="$1"
shift

case "$COMMAND" in
    apply)
        apply_command "${1:-}"
        ;;
    defaults)
        defaults_command "${1:-}"
        ;;
    install)
        install_command "${1:-}"
        ;;
    help|-h|--help)
        help_command
        ;;
    status)
        status_command
        ;;
    stow)
        stow_command "${1:-}"
        ;;
    host)
        host_command
        ;;
    *)
        fail "unknown command: $COMMAND"
        ;;
esac
