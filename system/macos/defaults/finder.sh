#!/bin/bash

# Finder
defaults write com.apple.finder QuitMenuItem -bool true
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
defaults write com.apple.finder "ShowPathbar" -bool "true"
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true"
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"
defaults write com.apple.universalaccess "showWindowTitlebarIcons" -bool "false"
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "true"
defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool "true"
defaults write com.apple.finder FXEnableSnapToGrid -bool true
defaults write NSGlobalDomain com.apple.springing.delay -real 0.0
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
defaults write com.apple.finder FXPreferredViewStyle -string "icnv"
defaults write com.apple.finder FXPreferredGroupBy -string "Name"
defaults write com.apple.finder FXShowInfoLabels -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder WarnOnEmptyTrash -bool false
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder FXInfoPanesExpanded -dict \
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

chflags nohidden ~/Library
sudo chflags nohidden /Volumes
