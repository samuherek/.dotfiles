#!/bin/sh

apply_apps() {
    app_groups="$1"

    if [ -z "$app_groups" ]; then
        return 0
    fi

    for app_group in $app_groups; do
        app_script="$DOTFILES_ROOT/system/$PLATFORM/apps/$app_group.sh"
        require_file "$app_script"
        bash "$app_script"
    done
}
