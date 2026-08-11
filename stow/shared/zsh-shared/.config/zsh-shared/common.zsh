# Shared zsh config sourced by environment-specific zsh profiles.

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

function so() {
    source ~/.zsh_profile
}
