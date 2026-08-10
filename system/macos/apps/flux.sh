#!/bin/bash

defaults write org.herf.Flux darkTheme -bool true
defaults write org.herf.Flux dayColorTemp -int 3700
defaults write org.herf.Flux nightColorTemp -int 2600
defaults write org.herf.Flux lateColorTemp -int 1600
defaults write org.herf.Flux steptime -int 30
defaults write org.herf.Flux transitionSpeed -int 0
defaults write org.herf.Flux wakeNotifyDisabled -bool true
defaults write org.herf.Flux wakeTime -int 450

# Set the defualt location to Slovakia
defaults write org.herf.Flux location -string "48.739460,19.153490"
defaults write org.herf.Flux locationTextField -string "48.7,19.1"

killall Flux &> /dev/null
open -a Flux
