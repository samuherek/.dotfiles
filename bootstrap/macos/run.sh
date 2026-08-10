#!/bin/bash

# function to style the echo output red.
red() {
    echo -e "\033[0;31m$1\033[0m"
}

# function to style the echo output green.
green() {
    echo -e "\033[0;32m$1\033[0m"
}


# ----------------
# INITIALIZATION
# ----------------

echo "Hello $(whoami)! Let's get you set up."

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# ask for password up front.
echo "Please provide the password for $(whoami) to get you started:"
sudo -v < /dev/tty

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


if ! xcode-select --print-path &>/dev/null; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install

    # Wait until the Xcode Command Line Tools are installed
    while ! xcode-select --print-path &>/dev/null; do
        sleep 5
    done

    echo "Xcode Command Line Tools installed."
else
    echo "Xcode Command Line Tools already installed."
fi


if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Homebrew installed."
else
    echo "Homebrew already installed."
fi

DOTFILES_DIR="$HOME/.dotfiles"
DOTFILES_REPO="https://github.com/samuherek/.dotfiles"

if [ -d "$DOTFILES_DIR" ]; then
    echo ".dotfiles already exists. Skipping clone."
else
    echo "Cloning .dotfiles into $DOTFILES_DIR..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
    echo ".dotfiles cloned successfully."
fi

echo "Now run:"
echo "cd ~/.dotfiles"
echo "./runner/run.sh apply"

