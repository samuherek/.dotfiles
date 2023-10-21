#!/bin/bash

# This does not seem to work unless we disable the system integrity
# for macOS. 
# Creating spaces this way will create error.

echo $(command -v yabai)
echo $(command -v jq)

if ! command -v yabai $> /dev/null; then 
    echo "Yabai command not found. Please intall yabai first."
    echo "Instalation guide can be found here https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)"
    #exit 1
fi

if ! command -v jq $> /dev/null; then
    echo "jq command not found. Please intall jq first."
    echo "You can install it with 'brew install jq'"
    #exit 1
fi

# Get the number of current spaces
spaces_count=$(yabai -m query --spaces --display | jq 'length')
echo $spaces_count

# Make sure to create at least 5 spaces if the number is less.
while [ "$spaces_count" -lt 5 ]; do
    yabai -m space --create
    spaces_count=$((spaces_count + 1))
done 

# Make sure to remove uncessary spaces if the number is more than 5.
while [ "$spaces_count" -gt 5 ]; do
    yabai -m space --destroy
    spaces_count=$((spaces_count - 1))
done

# Check if something went wrong and finish the script.
if [ $(yabai -m query --spaces --display | jq 'length') -eq 5 ]; then
    echo "Your desktop should have 5 spaces now."
else
    echo "Something must have gone wrong because there is a different number of spaces than 5"
    #exit 1
fi

