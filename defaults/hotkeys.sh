#!/bin/bash
#
# Here is "a" list I found documenting different keyboard shortcut representations
# https://web.archive.org/web/20141112224103/http://hintsforums.macworld.com/showthread.php?t=114785
#
#131072: Shift
#262144: Control
#524288: Option
#1048576: Command
#
#Add modifier values together in the 3rd parameter to combine them.
#
#{ AppleSymbolicHotKeys = {
#
## Move focus to the menu bar - Control, F2
#7 = { enabled = 1; value = { parameters = ( 65535, 120, 262144 ); type = standard; }; };
#
## Move focus to the Dock - Control, F3
#8 = { enabled = 1; value = { parameters = ( 65535, 99, 262144 ); type = standard; }; };
#
## Move focus to active or next window - Control, F4
#9 = { enabled = 1; value = { parameters = ( 65535, 118, 262144 ); type = standard; }; };
#
## Move focus to window toolbar - Control, F5
#10 = { enabled = 1; value = { parameters = ( 65535, 96, 262144 ); type = standard; }; };
#
## Move focus to floating window - Control, F6
#11 = { enabled = 1; value = { parameters = ( 65535, 97, 262144 ); type = standard; }; };
#
## ??? - Control, F1
#12 = { enabled = 1; value = { parameters = ( 65535, 122, 262144 ); type = standard; }; };
#
## Change the way Tab moves focus - Control, F7
#13 = { enabled = 1; value = { parameters = ( 65535, 98, 262144 ); type = standard; }; };
#
## Turn zoom on or off - Command, Option, 8
#15 = { enabled = 1; value = { parameters = ( 56, 28, 1572864 ); type = standard; }; };
#
## Zoom in - Command, Option, =
#17 = { enabled = 0; value = { parameters = ( 61, 24, 1572864 ); type = standard; }; };
#
## Zoom out - Command, Option, -
#19 = { enabled = 0; value = { parameters = ( 45, 27, 1572864 ); type = standard; }; };
#
## Reverse Black and White - Command, Control, Option, 8
#21 = { enabled = 1; value = { parameters = ( 56, 28, 1835008 ); type = standard; }; };
#
## Turn image smoothing on or off - Command, Option, \
#23 = { enabled = 0; value = { parameters = ( 92, 42, 1572864 ); type = standard; }; };
#
## Increase Contrast - Command, Control, Option, .
#25 = { enabled = 1; value = { parameters = ( 46, 47, 1835008 ); type = standard; }; };
#
## Decrease Contrast - Command, Control, Option, ','
#26 = { enabled = 1; value = { parameters = ( 44, 43, 1835008 ); type = standard; }; };
#
## Move focus to the next window in application - Command, backtic
#27 = { enabled = 1; value = { parameters = ( 96, 50, 1048576 ); type = standard; }; };
#
## Save picture of screen as file - Command, Shift, 3
#28 = { enabled = 1; value = { parameters = ( 51, 20, 1179648 ); type = standard; }; };
#
## Copy picture of screen to clipboard - Command, Control, Shift, 3
#29 = { enabled = 1; value = { parameters = ( 51, 20, 1441792 ); type = standard; }; };
#
## Save picture of selected area as file - Command, Shift, 4
#30 = { enabled = 1; value = { parameters = ( 52, 21, 1179648 ); type = standard; }; };
#
## Copy picture of selected area to clipboard - Command, Control, Shift, 4
#31 = { enabled = 1; value = { parameters = ( 52, 21, 1441792 ); type = standard; }; };
#
## All Windows - F9
#32 = { enabled = 1; value = { parameters = ( 65535, 101, 0 ); type = standard; }; };
#
## Application Windows - F10
#33 = { enabled = 1; value = { parameters = ( 65535, 109, 0 ); type = standard; }; };
#
## All Windows (Slow) - F9
#34 = { enabled = 1; value = { parameters = ( 65535, 101, 131072 ); type = standard; }; };
#
## Application Windows (Slow) - F10
#35 = { enabled = 1; value = { parameters = ( 65535, 109, 131072 ); type = standard; }; };
#
## Desktop - F11
#36 = { enabled = 1; value = { parameters = ( 65535, 103, 0 ); type = standard; }; };
#
## Desktop (Slow) - F11
#37 = { enabled = 1; value = { parameters = ( 65535, 103, 131072 ); type = standard; }; };
#
## ??? - Command, Option, T
#50 = { enabled = 1; value = { parameters = ( 116, 17, 1572864 ); type = standard; }; };
#
## Move focus to the window drawer - Command, Option, quote
#51 = { enabled = 1; value = { parameters = ( 39, 50, 1572864 ); type = standard; }; };
#
## Turn Dock Hiding On/Off - Command, Option, D
#52 = { enabled = 1; value = { parameters = ( 100, 2, 1572864 ); type = standard; }; };
#
## ??? - F14
#53 = { enabled = 1; value = { parameters = ( 65535, 107, 0 ); type = standard; }; };
#
## ??? - F15
#54 = { enabled = 1; value = { parameters = ( 65535, 113, 0 ); type = standard; }; };
#
## ??? - Option, F14
#55 = { enabled = 1; value = { parameters = ( 65535, 107, 524288 ); type = standard; }; };
#
## ??? - Option, F15
#56 = { enabled = 1; value = { parameters = ( 65535, 113, 524288 ); type = standard; }; };
#
## Move focus to the status menus - Control, F8
#57 = { enabled = 1; value = { parameters = ( 65535, 100, 262144 ); type = standard; }; };
#
## Turn VoiceOver on / off - Command, F5
#59 = { enabled = 1; value = { parameters = ( 65535, 96, 1048576 ); type = standard; }; };
#
## Select the previous input source - Command, Option, Space
#60 = { enabled = 1; value = { parameters = ( 32, 49, 1572864 ); type = standard; }; };
#
## Select the next source in the Input Menu - Command, Option, Shift, Space
#61 = { enabled = 1; value = { parameters = ( 32, 49, 1703936 ); type = standard; }; };
#
## Dashboard - F12
#62 = { enabled = 1; value = { parameters = ( 65535, 111, 0 ); type = standard; }; };
#
## Dashboard (Slow) - F12
#63 = { enabled = 1; value = { parameters = ( 65535, 111, 131072 ); type = standard; }; };
#
## Show Spotlight search field - Command, Shift, Space
#64 = { enabled = 1; value = { parameters = ( 65535, 49, 1179648 ); type = standard; }; };
#
## Show Spotlight window - Control, Shift, Space
#65 = { enabled = 1; value = { parameters = ( 65535, 49, 393216 ); type = standard; }; };
#
## Dictionary MouseOver - Command, Shift, E
#70 = { enabled = 1; value = { parameters = ( 101, 2, 1179648 ); type = standard; }; };
#
## Hide and show Front Row - Command, Esc
#73 = { enabled = 1; value = { parameters = ( 65535, 53, 1048576 ); type = standard; }; };
#
## Activate Spaces - F8
#75 = { enabled = 1; value = { parameters = ( 65535, 100, 0 ); type = standard; }; };
#
## Activate Spaces (Slow) - Shift, F8
#76 = { enabled = 1; value = { parameters = ( 65535, 100, 131072 ); type = standard; }; };
#
## Spaces Left - Control, Left
#79 = { enabled = 1; value = { parameters = ( 65535, 123, 262144 ); type = standard; }; };
#
## Spaces Right - Control, Right
#81 = { enabled = 1; value = { parameters = ( 65535, 124, 262144 ); type = standard; }; };
#
## Spaces Down - Control, Down
#83 = { enabled = 1; value = { parameters = ( 65535, 125, 262144 ); type = standard; }; };
#
## Spaces Up - Control, Up
#85 = { enabled = 1; value = { parameters = ( 65535, 126, 262144 ); type = standard; }; };
#
## Show Help Menu - Command, Shift, /
#91 = { enabled = 0; };
#92 = { enabled = 0; };
#98 = { enabled = 0; value = { parameters = ( 47, 44, 1179648 ); type = standard; }; };
#
## Switch to Space 1 - Control, 1
#118 = { enabled = 1; value = { parameters = ( 65535, 18, 262144 ); type = standard; }; };
#
## Switch to Space 2 - Control, 2
#119 = { enabled = 1; value = { parameters = ( 65535, 19, 262144 ); type = standard; }; };
#
## Switch to Space 3 - Control, 3
#120 = { enabled = 1; value = { parameters = ( 65535, 20, 262144 ); type = standard; }; };
#
## Switch to Space 4 - Control, 4
#121 = { enabled = 1; value = { parameters = ( 65535, 21, 262144 ); type = standard; }; };
#
#122 = { enabled = 0; };
#123 = { enabled = 0; };
#124 = { enabled = 0; };
#125 = { enabled = 0; };
#126 = { enabled = 0; };
#127 = { enabled = 0; };
#128 = { enabled = 0; };
#129 = { enabled = 0; };
#130 = { enabled = 0; };
#131 = { enabled = 0; };
#132 = { enabled = 0; };
#133 = { enabled = 0; };
#134 = { enabled = 0; };
#135 = { enabled = 0; };
#136 = { enabled = 0; };
#137 = { enabled = 0; };
#138 = { enabled = 0; };
#139 = { enabled = 0; };
#140 = { enabled = 0; };
#141 = { enabled = 0; };
#142 = { enabled = 0; };
#143 = { enabled = 0; };
#144 = { enabled = 0; };
#145 = { enabled = 0; };
#146 = { enabled = 0; };
#147 = { enabled = 0; };
#148 = { enabled = 0; };
#149 = { enabled = 0; };
#}; }
#


PLIST_NAME="com.apple.symbolichotkeys.plist"
PLIST_PATH="$HOME/Library/Preferences/$PLIST_NAME"

# This is a backup convention directory for all backups.
BACKUP_PATH="$HOME/.system_backup"

if [[ ! -d "$BACKUP_PATH" ]]; then
    mkdir -p "$BACKUP_PATH"
    echo "Created missing $BACKUP_PATH backup folder."
fi

# Backup the original plist file
cp "$PLIST_PATH" "$BACKUP_PATH/$PLIST_NAME.backup"

# Create function to insert data
add_space_shotcut() {
    local key="$1"
    local parameters=("${@:2}")

    # Let's remove the key in case it already exists. 
    # Otherwise, it will keep adding things to the parameters array.
    /usr/libexec/PlistBuddy -c "Delete :AppleSymbolicHotKeys:$key" "$PLIST_PATH"

    /usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:"${key}" dict" "$PLIST_PATH"
    /usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:"${key}":enabled bool true" "$PLIST_PATH"
    /usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:"${key}":value dict" "$PLIST_PATH"
    /usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:"${key}":value:type string standard" "$PLIST_PATH"
    /usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:"${key}":value:parameters array" "$PLIST_PATH"

    for (( i=0; i<${#params[@]}; i++ )); do
        /usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:"${key}":value:parameters:$1 integer ${params[(($i + 1))]}" "$PLIST_PATH"
    done
}

# Desktop space 1 -> CMD + 1
add_space_shotcut 118 49 18 1048576
# Desktop space 2 -> CMD + 2
add_space_shotcut 19 50 19 1048576
# Desktop space 3 -> CMD + 3
add_space_shotcut 120 51 20 1048576
# Desktop space 4 -> CMD + 4
add_space_shotcut 121 52 21 1048576
# Desktop space 5 -> CMD + 5
add_space_shotcut 122 53 23 1048576


# Disable "Show Spotlight Search keyboard shortcut"
# Let's remove the key in case it already exists. 
# Otherwise, it will keep adding things to the parameters array.
/usr/libexec/PlistBuddy -c "Delete :AppleSymbolicHotKeys:64" "$PLIST_PATH"

/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:64 dict" "$PLIST_PATH"
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:64:enabled bool false" "$PLIST_PATH"
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:64:value dict" "$PLIST_PATH"
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:64:value:type string standard" "$PLIST_PATH"
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:64:value:parameters array" "$PLIST_PATH"
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:64:value:parameters:0 integer 32" "$PLIST_PATH"
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:64:value:parameters:1 integer 49" "$PLIST_PATH"
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:64:value:parameters:2 integer 1048576" "$PLIST_PATH"


# Disable "Show Finder search window shortcut"
# Let's remove the key in case it already exists. 
# Otherwise, it will keep adding things to the parameters array.
/usr/libexec/PlistBuddy -c "Delete :AppleSymbolicHotKeys:65" "$PLIST_PATH"

/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:65 dict" "$PLIST_PATH"
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:65:enabled bool false" "$PLIST_PATH"
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:65:value dict" "$PLIST_PATH"
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:65:value:type string standard" "$PLIST_PATH"
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:65:value:parameters array" "$PLIST_PATH"
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:65:value:parameters:0 integer 32" "$PLIST_PATH"
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:65:value:parameters:1 integer 49" "$PLIST_PATH"
/usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:65:value:parameters:2 integer 1048576" "$PLIST_PATH"


killall Finder &> /dev/null

echo "These keybaord shortcuts require restart to take effect"
