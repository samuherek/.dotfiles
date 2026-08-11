#!/bin/bash

# TextEditor
defaults write com.apple.TextEdit "RichText" -bool "false"

# TimeMachine
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool "true"

# Print
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true


# Software
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
defaults write com.apple.commerce AutoUpdate -bool true
defaults write com.apple.commerce AutoUpdateRestartRequired -bool false

# Impact: Disables the crash reporter dialog, which typically appears when an application crashes.
defaults write com.apple.CrashReporter DialogType -string "none"

# Disable all spotlight indexing
sudo mdutil -a -i off


