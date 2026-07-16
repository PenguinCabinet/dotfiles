#!/bin/bash

for package in vim wezterm bash zsh tmux i3 "Do-not-use-PC"; do
    stow \
      --verbose=2 \
      --target="$HOME" \
      "$package" || printf 'Failed: %s\n' "$package" >&2
done


#stow -v vim wezterm bash zsh tmux i3 "Do-not-use-PC"
