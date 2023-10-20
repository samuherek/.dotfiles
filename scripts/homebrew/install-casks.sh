#!/bin/bash

echo "Installing apps with brew --cask"

casks=(
   setapp
   google-chrome
   firefox
   brave-browser
   visual-studio-code
   vlc
   handbrake
   spotify
   flux
   signal
   fork
   hammerspoon
   protonvpn
   slack
   sonos
   synologyassistant
   synology-drive
   wezterm
)

is_cask_installed() {
    brew list --cask 2> /dev/null | grep -wq "$1"
}

for cask in "${casks[@]}"; do
    echo "Check $cask before installation."

    if is_cask_instaappsled "$cask"; then
        echo "$cask already isntalled."
    else 
        brew install --cask "$cask"
        echo "$cask installed."
    fi
done

echo "All brew casks have been installed."
