#!/bin/sh

if [ ! -f "$1" ]; then
    echo "Please pass an existing ScanCode JSON file as the argument."
    exit 1
fi

if ! which jq > /dev/null 2>&1; then
    echo "This script depends on https://stedolan.github.io/jq/."
    echo "Please put the 'jq' executable into your PATH."
    exit 2
fi

pushd $(dirname "$1") > /dev/null
jq -r .files[].sha1 $(basename "$1") | sort | tr -d '\n' | sha1sum - | cut -d' ' -f1
popd > /dev/null
