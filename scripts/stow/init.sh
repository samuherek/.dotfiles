#!/bin/bash

source ../../stow_paths
DOTFILES="$HOME/.dotfiles"

pushd $DOTFILES
for dir in "${STOW_PATHS[@]}"; do
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

