#!/usr/bin/env zsh

local base="${0:A:h}"

# Core — always load
for f in "$base"/core/*.zsh; do
  source "$f"
done

# Tools — conditionally loaded (each file guards itself)
for f in "$base"/tools/*.zsh; do
  source "$f"
done
