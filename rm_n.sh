#!/bin/bash

# remove all files in dir larger than n bytes
if [[ $# -ne 2 ]]; then
    echo "usage: $0 <dir> <n>" 1>&2
    exit 0
fi

dir=$1
n=$2

file=$(find ./$dir -type f -size +${n}c -delete)

