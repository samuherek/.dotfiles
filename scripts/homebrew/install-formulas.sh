#!/bin/bash

echo "Installing apps with brew"

formulas=(
    fzf
    git
    tmux
    neovim
    koekeishiya/formulae/skhd
    koekeishiya/formulae/yabai
    tree-sitter
    jq
    stow
    # rust
    diesel
)

is_formula_installed() {
    brew list 2> /dev/null | grep -wq "$1"
}

for formula in "${formulas[@]}"; do
    echo "Check $formula before installation."

    # I need to get the name of the github packages like homebrew calls them
    local name=$(echo "$formula" | awk -F '/' '{print $NF}' )


    if is_formula_installed "$name"; then
        echo "$name already installed."
    else
        brew install "$formula"
        echo "$formula installed."
    fi
done

echo "All formulas installed."
