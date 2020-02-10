#!/bin/sh

DEFAULT_MAX_LINES=20
if [ $# = 1 ]; then
    count="$1"
else
    count=20
fi
git log --graph --oneline --all --max-count="$count"
