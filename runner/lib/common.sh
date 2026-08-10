#!/bin/sh

fail() {
    printf 'error: %s\n' "$1" >&2
    exit 1
}

require_file() {
    if [ ! -f "$1" ]; then
        fail "missing file: $1"
    fi
}

require_value() {
    name="$1"
    value="$2"

    if [ -z "$value" ]; then
        fail "missing required value: $name"
    fi
}
