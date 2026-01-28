#!/bin/bash

set -ex

# Setup zsh shell
echo "> Using zsh shell"

# Check if zsh is the default shell
if [ "$SHELL" != "/bin/zsh" ]; then
    #command -v zsh | tee -a /etc/shells
    #sudo chsh -s $(which zsh) $USER
    chsh -s $(which zsh)
    source .zshrc
fi
