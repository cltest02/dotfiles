#!/usr/bin/env bash

# Load the theme
if [[ $CONFIG_BASH_THEME ]]; then
  source "$REDPILL/themes/$CONFIG_BASH_THEME/$CONFIG_BASH_THEME.theme.bash"
fi