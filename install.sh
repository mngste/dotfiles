#!/bin/sh

set -ex

chezmoi init https://github.com/mngste/dotfiles.git
chezmoi apply
source $HOME/.zshrc
