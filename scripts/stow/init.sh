#!/bin/bash

DOTFILES="$HOME/.dotfiles"

stow_paths=(
    bin
    hammerspoon
    nvim
    skhd
    tmux
    wezterm
    yabai
    zsh
)

pushd $DOTFILES
for dir in "${stow_paths[@]}"; do
    echo "Stow $dir"

    if [ ! -d "$dir" ]; then
        echo "Error: the $dir does not exist."
        echo "Contact the mainter for the script to fix it."
        #exit 1
    else 
        stow -D "$dir"
        stow $dir
    fi
done
popd

