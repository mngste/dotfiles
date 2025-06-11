# Alias

# fzf
alias preview "fzf --preview='bat --color=always --style=numbers --theme OneHalfDark {}' --preview-window=down"
alias fnvim 'nvim $(fzf -m --preview="bat --color=always --style=numbers --theme OneHalfDark {}" --preview-window=down)'
alias fvim 'vim $(fzf -m --preview="bat --color=always --style=numbers --theme OneHalfDark {}" --preview-window=down)'
alias fcd "cd \$(find . -type d | fzf)"  # Fuzzy search directories and cd into them

#System
alias upgrade 'dnf update && dnf upgrade -y && flatpak update' # Upgrade the system
alias q 'exit'
alias c 'clear'
alias mkdir 'mkdir -p'

#System Information
alias ls "eza --icons"
alias la "eza --icons -lgha --group-directories-first"
alias ll 'eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias lt "eza --icons --tree"
alias lta "eza --icons --tree -lgha"
alias bat "bat --theme OneHalfDark"
alias cat "bat --theme OneHalfDark -p $argv"

# Docker
alias dk "docker kill (docker ps -q)"
alias dc "docker compose up -d"
alias dprune "docker system prune --filter \"until=720h\" && docker volume prune"

# Local bin
set -gx PATH "$HOME/.local/bin" $PATH
set -x PATH $PATH $HOME/.bin
