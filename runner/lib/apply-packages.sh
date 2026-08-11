#!/bin/sh

apply_packages() {
    package_groups="$1"

    if [ -z "$package_groups" ]; then
        return 0
    fi

    if ! command -v brew >/dev/null 2>&1; then
        fail "homebrew is required to install macOS packages"
    fi

    for package_group in $package_groups; do
        brewfile_path="$DOTFILES_ROOT/packages/macos/$package_group.Brewfile"
        require_file "$brewfile_path"
        brew bundle --file "$brewfile_path"
    done
}
