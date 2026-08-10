#!/bin/sh

contains_word() {
    search_list="$1"
    search_word="$2"

    for search_item in $search_list; do
        if [ "$search_item" = "$search_word" ]; then
            return 0
        fi
    done

    return 1
}

merge_lists() {
    merged_result=""

    for input_list in "$@"; do
        for input_item in $input_list; do
            if ! contains_word "$merged_result" "$input_item"; then
                if [ -z "$merged_result" ]; then
                    merged_result="$input_item"
                else
                    merged_result="$merged_result $input_item"
                fi
            fi
        done
    done

    printf '%s\n' "$merged_result"
}

prefix_list() {
    list_prefix="$1"
    input_list="$2"
    prefixed_result=""

    for input_item in $input_list; do
        prefixed_item="$list_prefix/$input_item"

        if [ -z "$prefixed_result" ]; then
            prefixed_result="$prefixed_item"
        else
            prefixed_result="$prefixed_result $prefixed_item"
        fi
    done

    printf '%s\n' "$prefixed_result"
}
