#!/bin/sh

apply_hotkeys() {
    hotkey_groups="$1"

    if [ -z "$hotkey_groups" ]; then
        return 0
    fi

    for hotkey_group in $hotkey_groups; do
        hotkey_script="$DOTFILES_ROOT/system/$PLATFORM/hotkeys/$hotkey_group.sh"
        require_file "$hotkey_script"
        bash "$hotkey_script"
    done
}
