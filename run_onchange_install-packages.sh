#!/bin/bash

# fish
sudo dnf install fish -y
sudo chsh -s /usr/bin/fish $(whoami)

# htop btop
sudo dnf install htop -y
sudo dnf install btop -y

# fzf
sudo dnf install fzf -y

# bat
sudo dnf install bat -y

# make bat by default
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# neovim
sudo dnf install neovim -y

# tmux
sudo dnf install tmux -y

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install timeshift
sudo dnf install timeshift -y

echo "reboot !"
