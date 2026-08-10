#!/bin/sh

STATE_DIR="$HOME/.local/state/dotfiles"
STATE_FILE="$STATE_DIR/state.sh"

load_state() {
    STATE_HOST_NAME=""
    STATE_PLATFORM=""
    STATE_STOW=""

    if [ -f "$STATE_FILE" ]; then
        . "$STATE_FILE"
    fi
}

save_state() {
    state_host_name="$1"
    state_platform="$2"
    state_stow="$3"

    mkdir -p "$STATE_DIR"

    cat > "$STATE_FILE" <<EOF
STATE_HOST_NAME="$state_host_name"
STATE_PLATFORM="$state_platform"
STATE_STOW="$state_stow"
EOF
}
