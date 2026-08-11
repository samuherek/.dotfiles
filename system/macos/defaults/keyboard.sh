#!/bin/bash

# Keyboard
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool "false"
defaults write NSGlobalDomain InitialKeyRepeat -real 10
defaults write NSGlobalDomain KeyRepeat -real 1
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 0
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
defaults write com.apple.dock showMissionControlGestureEnabled -int 1
defaults write com.apple.dock showAppExposeGestureEnabled -int 1
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
