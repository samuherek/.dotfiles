#!/bin/bash

set -euo pipefail

RUNNER_DIR="$(CDPATH= cd -- "$(dirname "$0")" && pwd)"
DOTFILES_ROOT="$(CDPATH= cd -- "$RUNNER_DIR/.." && pwd)"

source "$RUNNER_DIR/lib/common.sh"
source "$RUNNER_DIR/lib/merge-lists.sh"
source "$RUNNER_DIR/lib/load-host.sh"
source "$RUNNER_DIR/lib/load-roles.sh"
source "$RUNNER_DIR/lib/apply-stow.sh"
source "$RUNNER_DIR/lib/apply-packages.sh"
source "$RUNNER_DIR/lib/apply-defaults.sh"
source "$RUNNER_DIR/lib/apply-apps.sh"
source "$RUNNER_DIR/lib/apply-hotkeys.sh"
source "$RUNNER_DIR/lib/apply-scripts.sh"
source "$RUNNER_DIR/lib/git-status.sh"
source "$RUNNER_DIR/lib/state.sh"

help_command() {
    cat <<'EOF'
dotfiles <command> [host]

Commands:
  help           Show this help
  help <section> Show section help for packages, roles, or hosts
  packages --help Show package documentation
  roles --help   Show role documentation
  hosts --help   Show host documentation
  status         Show current applied dotfiles state
  host           Show current stored host name
  apply          Install packages and apply stow using stored host, or prompt if none exists
  apply <host>   Install packages and apply stow using the given host
  defaults       Apply defaults and app defaults using stored host, or prompt if none exists
  defaults <host> Apply defaults and app defaults using the given host
  hotkeys        Apply hotkeys only using stored host, or prompt if none exists
  hotkeys <host> Apply hotkeys only using the given host
  install        Install packages only using stored host, or prompt if none exists
  install <host> Install packages only using the given host
  scripts        Apply scripts only using stored host, or prompt if none exists
  scripts <host> Apply scripts only using the given host
  sync           Fetch and fast-forward pull the dotfiles repo if safe
  stow           Apply stow only using stored host, or prompt if none exists
  stow <host>    Apply stow only using the given host
EOF
}

print_section_help() {
    section_name="$1"

    case "$section_name" in
        packages)
            readme_path="$DOTFILES_ROOT/packages/README.md"
            ;;
        roles)
            readme_path="$DOTFILES_ROOT/roles/README.md"
            ;;
        hosts)
            readme_path="$DOTFILES_ROOT/hosts/README.md"
            ;;
        *)
            fail "unknown help section: $section_name"
            ;;
    esac

    require_file "$readme_path"
    cat "$readme_path"
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

resolve_final_stow() {
    FINAL_STOW="$(merge_lists \
        "$(prefix_list "shared" "$ROLE_STOW_SHARED")" \
        "$(prefix_list "$PLATFORM" "$ROLE_STOW_PLATFORM")" \
        "$HOST_STOW"
    )"
}

resolve_final_packages() {
    case "$PLATFORM" in
        macos)
            FINAL_PACKAGES="$(merge_lists "$ROLE_PACKAGE_GROUPS" "$HOST_PACKAGE_GROUPS_MACOS")"
            ;;
        linux|nas)
            FINAL_PACKAGES=""
            ;;
        *)
            fail "unsupported platform: $PLATFORM"
            ;;
    esac
}

resolve_final_defaults() {
    case "$PLATFORM" in
        macos)
            FINAL_DEFAULTS="$(merge_lists "$ROLE_DEFAULT_GROUPS" "$HOST_DEFAULT_GROUPS_MACOS")"
            ;;
        linux|nas)
            FINAL_DEFAULTS=""
            ;;
        *)
            fail "unsupported platform: $PLATFORM"
            ;;
    esac
}

resolve_final_apps() {
    case "$PLATFORM" in
        macos)
            FINAL_APPS="$(merge_lists "$ROLE_APP_GROUPS" "$HOST_APP_GROUPS_MACOS")"
            ;;
        linux|nas)
            FINAL_APPS=""
            ;;
        *)
            fail "unsupported platform: $PLATFORM"
            ;;
    esac
}

resolve_final_hotkeys() {
    case "$PLATFORM" in
        macos)
            FINAL_HOTKEYS="$(merge_lists "$ROLE_HOTKEY_GROUPS" "$HOST_HOTKEY_GROUPS_MACOS")"
            ;;
        linux|nas)
            FINAL_HOTKEYS=""
            ;;
        *)
            fail "unsupported platform: $PLATFORM"
            ;;
    esac
}

resolve_final_scripts() {
    case "$PLATFORM" in
        macos)
            FINAL_SCRIPTS="$(merge_lists "$ROLE_SCRIPT_GROUPS" "$HOST_SCRIPT_GROUPS_MACOS")"
            ;;
        linux|nas)
            FINAL_SCRIPTS=""
            ;;
        *)
            fail "unsupported platform: $PLATFORM"
            ;;
    esac
}

load_host_config() {
    HOST_NAME="$(resolve_host_name "${1:-}")"

    load_host "$DOTFILES_ROOT" "$HOST_NAME"
    load_roles "$DOTFILES_ROOT" "$PLATFORM" "$ROLES"
    resolve_final_stow
    resolve_final_packages
    resolve_final_defaults
    resolve_final_apps
    resolve_final_hotkeys
    resolve_final_scripts
}

print_apply_summary() {
    printf 'Host: %s\n' "$HOST_NAME"
    printf 'Platform: %s\n' "$PLATFORM"
    printf 'Roles: %s\n' "$ROLES"
    printf 'Packages: %s\n' "$FINAL_PACKAGES"
    printf 'Defaults: %s\n' "$FINAL_DEFAULTS"
    printf 'Apps: %s\n' "$FINAL_APPS"
    printf 'Hotkeys: %s\n' "$FINAL_HOTKEYS"
    printf 'Scripts: %s\n' "$FINAL_SCRIPTS"
    printf 'Stow: %s\n' "$FINAL_STOW"
}

apply_command() {
    load_host_config "${1:-}"

    load_state
    apply_packages "$FINAL_PACKAGES"
    apply_defaults "$FINAL_DEFAULTS"
    apply_apps "$FINAL_APPS"
    apply_hotkeys "$FINAL_HOTKEYS"
    apply_stow "$STATE_STOW" "$FINAL_STOW"
    apply_scripts "$FINAL_SCRIPTS"

    print_apply_summary

    save_state "$HOST_NAME" "$PLATFORM" "$FINAL_STOW" "$FINAL_PACKAGES" "$FINAL_DEFAULTS" "$FINAL_APPS" "$FINAL_HOTKEYS" "$FINAL_SCRIPTS"
}

defaults_command() {
    load_host_config "${1:-}"

    load_state
    apply_defaults "$FINAL_DEFAULTS"
    apply_apps "$FINAL_APPS"

    print_apply_summary

    save_state "$HOST_NAME" "$PLATFORM" "$STATE_STOW" "$STATE_PACKAGES" "$FINAL_DEFAULTS" "$FINAL_APPS" "$STATE_HOTKEYS" "$STATE_SCRIPTS"
}

hotkeys_command() {
    load_host_config "${1:-}"

    load_state
    apply_hotkeys "$FINAL_HOTKEYS"

    print_apply_summary

    save_state "$HOST_NAME" "$PLATFORM" "$STATE_STOW" "$STATE_PACKAGES" "$STATE_DEFAULTS" "$STATE_APPS" "$FINAL_HOTKEYS" "$STATE_SCRIPTS"
}

install_command() {
    load_host_config "${1:-}"

    load_state
    apply_packages "$FINAL_PACKAGES"

    print_apply_summary

    save_state "$HOST_NAME" "$PLATFORM" "$STATE_STOW" "$FINAL_PACKAGES" "$STATE_DEFAULTS" "$STATE_APPS" "$STATE_HOTKEYS" "$STATE_SCRIPTS"
}

scripts_command() {
    load_host_config "${1:-}"

    load_state
    apply_scripts "$FINAL_SCRIPTS"

    print_apply_summary

    save_state "$HOST_NAME" "$PLATFORM" "$STATE_STOW" "$STATE_PACKAGES" "$STATE_DEFAULTS" "$STATE_APPS" "$STATE_HOTKEYS" "$FINAL_SCRIPTS"
}

stow_command() {
    load_host_config "${1:-}"

    load_state
    apply_stow "$STATE_STOW" "$FINAL_STOW"

    print_apply_summary

    save_state "$HOST_NAME" "$PLATFORM" "$FINAL_STOW" "$STATE_PACKAGES" "$STATE_DEFAULTS" "$STATE_APPS" "$STATE_HOTKEYS" "$STATE_SCRIPTS"
}

status_command() {
    load_state

    if [ -z "$STATE_HOST_NAME" ]; then
        fail "no dotfiles state found"
    fi

    printf 'Host: %s\n' "$STATE_HOST_NAME"
    printf 'Platform: %s\n' "$STATE_PLATFORM"
    printf 'Packages: %s\n' "$STATE_PACKAGES"
    printf 'Defaults: %s\n' "$STATE_DEFAULTS"
    printf 'Apps: %s\n' "$STATE_APPS"
    printf 'Hotkeys: %s\n' "$STATE_HOTKEYS"
    printf 'Scripts: %s\n' "$STATE_SCRIPTS"
    printf 'Stow: %s\n' "$STATE_STOW"
    print_git_status
}

host_command() {
    load_state

    if [ -z "$STATE_HOST_NAME" ]; then
        fail "no dotfiles state found"
    fi

    printf '%s\n' "$STATE_HOST_NAME"
}

sync_command() {
    sync_repo
    print_git_status
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
    defaults)
        defaults_command "${1:-}"
        ;;
    hotkeys)
        hotkeys_command "${1:-}"
        ;;
    install)
        install_command "${1:-}"
        ;;
    scripts)
        scripts_command "${1:-}"
        ;;
    sync)
        sync_command
        ;;
    packages)
        if [ -z "${1:-}" ] || [ "${1:-}" = "--help" ] || [ "${1:-}" = "-h" ]; then
            print_section_help packages
        else
            fail "unknown packages command: ${1:-}"
        fi
        ;;
    roles)
        if [ -z "${1:-}" ] || [ "${1:-}" = "--help" ] || [ "${1:-}" = "-h" ]; then
            print_section_help roles
        else
            fail "unknown roles command: ${1:-}"
        fi
        ;;
    hosts)
        if [ -z "${1:-}" ] || [ "${1:-}" = "--help" ] || [ "${1:-}" = "-h" ]; then
            print_section_help hosts
        else
            fail "unknown hosts command: ${1:-}"
        fi
        ;;
    help|-h|--help)
        if [ -n "${1:-}" ]; then
            print_section_help "$1"
        else
            help_command
        fi
        ;;
    status)
        status_command
        ;;
    stow)
        stow_command "${1:-}"
        ;;
    host)
        host_command
        ;;
    *)
        fail "unknown command: $COMMAND"
        ;;
esac
