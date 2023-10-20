#!/bin/bash

echo "skhd will need privacy permissions."
echo "Please allow skhd in your settings and come back to restart the service."

skhd --start-service

while true; do
    echo -n "Ready to restart service? [y/n]: "
    read skhd_answer

    case $skhd_answer in 
        [Yy]* )
            skhd --start-service
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

