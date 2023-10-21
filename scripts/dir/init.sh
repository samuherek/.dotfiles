#!/bin/bash

dir_paths=(
    work
    personal
)

pushd $HOME
for dir in "${dir_paths[@]}"; do
    echo "Ensure $dir"

    if [ ! -d "$dir" ]; then
        mkdir $dir
    fi
done
popd

