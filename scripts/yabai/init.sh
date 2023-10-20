#!/bin/bash

echo "Yabai will need privacy permissions."
echo "Please allow yabai in your settings and come back to restart the service."

yabai --start-service

while true; do
    echo -n "Ready to restart service? [y/n]: "
    read yabai_answer

    case $yabai_answer in 
        [Yy]* )
            yabai --start-service
            break
            ;;
        [Nn]* )
            green "Skipping restart. Make sure to restart manually when you are ready."
            break
            ;;
        * )
            echo "Invalid answer. Please respond with 'y' or 'n'."
            ;;
    esac
done

