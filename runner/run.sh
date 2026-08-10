#!/bin/bash

set -euo pipefail

RUNNER_DIR="$(CDPATH= cd -- "$(dirname "$0")" && pwd)"
DOTFILES_ROOT="$(CDPATH= cd -- "$RUNNER_DIR/.." && pwd)"

source "$RUNNER_DIR/lib/common.sh"
source "$RUNNER_DIR/lib/merge-lists.sh"
source "$RUNNER_DIR/lib/load-host.sh"
source "$RUNNER_DIR/lib/load-roles.sh"
source "$RUNNER_DIR/lib/apply-stow.sh"
source "$RUNNER_DIR/lib/state.sh"

help_command() {
    cat <<'EOF'
dotfiles <command> [host]

Commands:
  help           Show this help
  status         Show current applied dotfiles state
  host           Show current stored host name
  apply          Apply using stored host, or prompt if none exists
  apply <host>   Apply using the given host
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

apply_command() {
    HOST_NAME="$(resolve_host_name "${1:-}")"

    load_host "$DOTFILES_ROOT" "$HOST_NAME"
    load_roles "$DOTFILES_ROOT" "$PLATFORM" "$ROLES"

    FINAL_STOW="$(merge_lists \
        "$(prefix_list "shared" "$ROLE_STOW_SHARED")" \
        "$(prefix_list "$PLATFORM" "$ROLE_STOW_PLATFORM")" \
        "$HOST_STOW"
    )"

    load_state
    apply_stow "$STATE_STOW" "$FINAL_STOW"

    printf 'Host: %s\n' "$HOST_NAME"
    printf 'Platform: %s\n' "$PLATFORM"
    printf 'Roles: %s\n' "$ROLES"
    printf 'Stow: %s\n' "$FINAL_STOW"

    save_state "$HOST_NAME" "$PLATFORM" "$FINAL_STOW"
}

status_command() {
    load_state

    if [ -z "$STATE_HOST_NAME" ]; then
        fail "no dotfiles state found"
    fi

    printf 'Host: %s\n' "$STATE_HOST_NAME"
    printf 'Platform: %s\n' "$STATE_PLATFORM"
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
    help|-h|--help)
        help_command
        ;;
    status)
        status_command
        ;;
    host)
        host_command
        ;;
    *)
        fail "unknown command: $COMMAND"
        ;;
esac
