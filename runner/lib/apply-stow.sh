#!/bin/sh

stow_refs_for_namespace() {
    namespace="$1"
    stow_refs="$2"
    namespace_packages=""

    for stow_ref in $stow_refs; do
        case "$stow_ref" in
            "$namespace"/*)
                package_name="${stow_ref#*/}"

                if [ -z "$namespace_packages" ]; then
                    namespace_packages="$package_name"
                else
                    namespace_packages="$namespace_packages $package_name"
                fi
                ;;
        esac
    done

    printf '%s\n' "$namespace_packages"
}

apply_stow_namespace() {
    mode="$1"
    namespace="$2"
    package_list="$3"

    if [ -n "$package_list" ]; then
        stow $mode -d "$DOTFILES_ROOT/stow/$namespace" -t "$HOME" $package_list
    fi
}

apply_stow() {
    old_stow="$1"
    new_stow="$2"

    for namespace in shared macos linux nas; do
        old_packages="$(stow_refs_for_namespace "$namespace" "$old_stow")"
        new_packages="$(stow_refs_for_namespace "$namespace" "$new_stow")"

        apply_stow_namespace "-D" "$namespace" "$old_packages"
        apply_stow_namespace "" "$namespace" "$new_packages"
    done
}
