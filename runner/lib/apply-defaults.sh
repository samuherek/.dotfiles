#!/bin/sh

apply_defaults() {
    default_groups="$1"

    if [ -z "$default_groups" ]; then
        return 0
    fi

    for default_group in $default_groups; do
        default_script="$DOTFILES_ROOT/system/$PLATFORM/defaults/$default_group.sh"
        require_file "$default_script"
        bash "$default_script"
    done
}
