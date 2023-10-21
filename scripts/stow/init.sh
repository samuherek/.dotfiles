#!/bin/bash

GIT_ROOT=$(git rev-parse --show-toplevel)

stow_paths=(
    nvim
    skhd
    tmux
    wezterm
    yabai
    zsh
)

pushd $GIT_ROOT
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

