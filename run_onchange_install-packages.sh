#!/bin/bash

# fish
sudo dnf install fish
sudo chsh -s /usr/bin/fish $(whoami)

# htop btop
sudo dnf install htop
sudo dnf install btop

# fzf
sudo dnf install fzf

# bat
sudo dnf install bat

# make bat by default
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# neovim
sudo dnf install neovim

# tmux
sudo dnf install tmux

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "reboot !"
