#!/bin/bash

if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # homebrew requires us to run this right after install in the next steps
    # It could change in the future. periodically check if it is still up to date.
    echo "Setting up homebrew paths"
    shellenv_path="/Users/$(whoami)/.zprofile"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $shellenv_path 
    eval "$(/opt/homebrew/bin/brew shellenv)"

    echo "Homebrew installed."
else
    echo "Homebrew already installed."
fi


