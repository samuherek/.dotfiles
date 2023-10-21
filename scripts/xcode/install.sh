#!/bin/bash

if ! xcode-select --print-path &>/dev/null; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install

    # Wait until the Xcode Command Line Tools are installed
    while ! xcode-select --print-path &>/dev/null; do
        sleep 5
    done

    echo "Xcode Command Line Tools installed."
else
    echo "Xcode Command Line Tools already installed."
fi


