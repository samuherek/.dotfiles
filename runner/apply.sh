#!/bin/sh

set -euo pipefail

RUNNER_DIR="$(CDPATH= cd -- "$(dirname "$0")" && pwd)"
DOTFILES_ROOT="$(CDPATH= cd -- "$RUNNER_DIR/.." && pwd)"

source "$RUNNER_DIR/lib/common.sh"
# source "$RUNNER_DIR/lib/merge-lists.sh"
source "$RUNNER_DIR/lib/load-host.sh"
# source "$RUNNER_DIR/lib/load-roles.sh"
# source "$RUNNER_DIR/lib/state.sh"

if [ "$#" -ne 1 ]; then
    fail "usage: ./runner/apply.sh <host-name>"
fi

HOST_NAME="$1"

load_host "$DOTFILES_ROOT" "$HOST_NAME"
# load_roles "$DOTFILES_ROOT" "$PLATFORM" "$ROLES"

case "$PLATFORM" in
    macos)
        HOST_MODULES_PLATFORM="$HOST_MODULES_MACOS"
        ;;
    linux)
        HOST_MODULES_PLATFORM="$HOST_MODULES_LINUX"
        ;;
    nas)
        HOST_MODULES_PLATFORM="$HOST_MODULES_NAS"
        ;;
    *)
        fail "unsupported platform: $PLATFORM"
        ;;
esac

FINAL_STOW_SHARED="$(merge_lists "$ROLE_MODULES_SHARED" "$HOST_MODULES_SHARED")"
FINAL_STOW_PLATFORM="$(merge_lists "$ROLE_MODULES_PLATFORM" "$HOST_MODULES_PLATFORM")"

