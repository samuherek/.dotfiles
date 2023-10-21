#!/bin/bash

DOTFILES="$HOME/.dotfiles"

# Define the paths to the default scripts
defaults_files=(
    macos.sh
    hotkeys.sh
)

# Check the existence of each script file
for file in "${defaults_files[@]}"; do
    file_path="$DOTFILES/defaults/$file"
    echo "PATH: $file_path"

    if [ ! -f "$file_path" ]; then
        echo "Error: the $file does not exist." 
        echo "Contact the maintainer of the script to fix it."
        exit 1
    else 
        source "$file_path"
    fi
done
