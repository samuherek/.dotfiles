#!/bin/sh

STATE_DIR="$HOME/.local/state/dotfiles"
STATE_FILE="$STATE_DIR/state.sh"

load_state() {
    STATE_HOST_NAME=""
    STATE_PLATFORM=""
    STATE_STOW=""
    STATE_PACKAGES=""
    STATE_DEFAULTS=""

    if [ -f "$STATE_FILE" ]; then
        . "$STATE_FILE"
    fi
}

save_state() {
    state_host_name="$1"
    state_platform="$2"
    state_stow="$3"
    state_packages="$4"
    state_defaults="$5"

    mkdir -p "$STATE_DIR"

    cat > "$STATE_FILE" <<EOF
STATE_HOST_NAME="$state_host_name"
STATE_PLATFORM="$state_platform"
STATE_STOW="$state_stow"
STATE_PACKAGES="$state_packages"
STATE_DEFAULTS="$state_defaults"
EOF
}
