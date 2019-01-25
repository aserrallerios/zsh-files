#!/usr/bin/env zsh

SOURCE="$( cd "$(dirname "$0")" ; pwd -P )"

for file in $SOURCE/src/**/*.zsh; do
  source "$file"
done
