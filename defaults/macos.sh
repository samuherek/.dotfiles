#!/bin/bash


# Dock
defaults write com.apple.dock "orientation" -string "left"
defaults write com.apple.dock "tilesize" -int "42"
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "autohide-time-modifier" -float "0.4"
defaults write com.apple.dock "show-recents" -bool "false"
defaults write com.apple.dock "mineffect" -string "scale"
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock expose-animation-duration -float 0.1

# Screen
defaults write com.apple.universalaccess reduceTransparency -bool true
defaults write com.apple.universalaccess reduceMotion -bool true
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Mission control
defaults write com.apple.dock wvous-tl-corner -int 2  # Top left → Mission control
defaults write com.apple.dock wvous-tr-corner -int 12 # Top right → Notification Center
defaults write com.apple.dock wvous-bl-corner -int 10 # Bottom left → Put display to sleep
defaults write com.apple.dock wvous-br-corner -int 4  # Bottom right → Desktop

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

# Menu bar
defaults write NSGlobalDomain _HIHideMenuBar -bool true

# Spaces
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write NSGlobalDomain "AppleSpacesSwitchOnActivate" -bool "true"
defaults write com.apple.dock "expose-group-apps" -bool "false"

# TextEditor
defaults write com.apple.TextEdit "RichText" -bool "false"

# TimeMachine
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool "true"

# ActivityMonitor
defaults write com.apple.ActivityMonitor "IconType" -int "5" 

# Keyboard
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool "false"
defaults write NSGlobalDomain InitialKeyRepeat -real 15
defaults write NSGlobalDomain KeyRepeat -real 2
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

# Misc
# Purpose: Ensures that the save panel is expanded by default.
# Impact: When you go to save a document, the detailed save panel (with options for location, tags, etc.) is expanded automatically.
defaults write com.apple.LaunchServices "LSQuarantine" -bool "false"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Print
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Menubar and control center
defaults write com.apple.controlcenter "NSStatusItem VisibleWiFi" -bool false

# Software
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
defaults write com.apple.commerce AutoUpdate -bool true
defaults write com.apple.commerce AutoUpdateRestartRequired -bool false

# Impact: Disables the crash reporter dialog, which typically appears when an application crashes.
defaults write com.apple.CrashReporter DialogType -string "none"

# Purpose: Alters system NVRAM settings.
# Impact: Mutes the startup chime that plays when the Mac boots up.
sudo nvram StartupMute=%01

# Disable all spotlight indexing
sudo mdutil -a -i off


killall Dock &> /dev/null
killall Finder &> /dev/null
killall TextEdit &> /dev/null
killall Activity\ Monitor &> /dev/null

