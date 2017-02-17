#!/bin/sh

if [ ! -d "$1" ]; then
    echo "Please pass an existing directory as the argument."
    exit 1
fi

find "$1" -type f -print0 | xargs -0 sha1sum | cut -d' ' -f1 | sort | tr -d '\n' | sha1sum - | cut -d' ' -f1
