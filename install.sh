#!/bin/sh

set -ex

chezmoi init https://github.com/mngste/dotfiles
chezmoi apply
