#!/bin/bash

# Get rid of the annoying border radious in the new macOS !!!!!!!!!!!
# experimental and if it stops working it's because they changed it to something else 
defaults write -g NSConvolutionOverride1 -float 10

# Dock
defaults write com.apple.dock "orientation" -string "left"
defaults write com.apple.dock "tilesize" -int "42" # -> works?
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "autohide-time-modifier" -float "0.4"
defaults write com.apple.dock "show-recents" -bool "false"
defaults write com.apple.dock "mineffect" -string "scale"
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock persistent-apps -array

# Screen
defaults write com.apple.universalaccess reduceTransparency -bool true
defaults write com.apple.universalaccess reduceMotion -bool true
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Mission control
defaults write com.apple.dock wvous-tl-corner -int 2  # Top left → Mission control
defaults write com.apple.dock wvous-tr-corner -int 12 # Top right → Notification Center
defaults write com.apple.dock wvous-bl-corner -int 10 # Bottom left → Put display to sleep
defaults write com.apple.dock wvous-br-corner -int 4  # Bottom right → Desktop

# Menu bar
defaults write NSGlobalDomain _HIHideMenuBar -bool true

# Spaces
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write NSGlobalDomain "AppleSpacesSwitchOnActivate" -bool "true"
defaults write com.apple.dock "expose-group-apps" -bool "false"

# ActivityMonitor
defaults write com.apple.ActivityMonitor "IconType" -int "5" 

# Menubar and control center
defaults write com.apple.controlcenter "NSStatusItem VisibleWiFi" -bool false

# Scroll behavior
defaults write -g AppleScrollerPagingBehavior -bool true # -> works

# Purpose: Ensures that the save panel is expanded by default.
# Impact: When you go to save a document, the detailed save panel (with options for location, tags, etc.) is expanded automatically.
defaults write com.apple.LaunchServices "LSQuarantine" -bool "false"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Purpose: Alters system NVRAM settings.
# Impact: Mutes the startup chime that plays when the Mac boots up.
sudo nvram StartupMute=%01
