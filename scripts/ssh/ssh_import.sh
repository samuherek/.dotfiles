#!/bin/bash

while true; do
    echo "Would you like to add an exiting ssh key?" 
    read answer

    case $answer in
        [Yy]* )
            echo "Enter the file name of the key"
            read name 

            dest_private="$HOME/.ssh/$name"
            dest_pub="$HOME/.ssh/$name.pub"

            if  [[ -f "$dest_private" || -f "$dest_pub" ]]; then
                red "The $name key already exists. Please use a different name."
                continue
            fi

            echo "Paste the private key. Then press enter and CTRL + D"
            key_private=""
            while IFS= read -r -s line; do
                key_private+="$line"$'\n'
            done

            echo "Paste the public key. Then press enter and CTRL + D"
            key_pub=""
            while IFS= read -r -s line; do
                key_pub+="$line"$'\n'
            done

            echo "$key_private" > $dest_private
            chmod 600 "$dest_private"

            echo "$key_pub" > $dest_pub
            chmod 600 "$dest_pub"

            green "The $name key added successfully."
            ;;
        [Nn]* )
            green "Done setting up ssh keys."
            break;
            ;;
        * )
            red "Invalid answer. Please respond with 'y' or 'n'."
            ;;
    esac
done
