#!/bin/sh

apply_scripts() {
    script_groups="$1"

    if [ -z "$script_groups" ]; then
        return 0
    fi

    for script_group in $script_groups; do
        script_path="$DOTFILES_ROOT/scripts/$PLATFORM/$script_group.sh"
        require_file "$script_path"
        bash "$script_path"
    done
}
