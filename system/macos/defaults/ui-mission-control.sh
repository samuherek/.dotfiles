#!/bin/bash

# Mission control
# COMMENT: I am separating this because I want to use it in alfred
# where I disable corners and restore defaults for gaming purposes
defaults write com.apple.dock wvous-tl-corner -int 2  # Top left → Mission control
defaults write com.apple.dock wvous-tr-corner -int 12 # Top right → Notification Center
defaults write com.apple.dock wvous-bl-corner -int 10 # Bottom left → Put display to sleep
defaults write com.apple.dock wvous-br-corner -int 4  # Bottom right → Desktop
