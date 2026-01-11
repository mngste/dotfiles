if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Alias

# fzf
alias preview "fzf --preview='bat --color=always --style=numbers --theme OneHalfDark {}' --preview-window=down"
alias fnvim 'nvim $(fzf -m --preview="bat --color=always --style=numbers --theme OneHalfDark {}" --preview-window=down)'
alias fvim 'vim $(fzf -m --preview="bat --color=always --style=numbers --theme OneHalfDark {}" --preview-window=down)'
alias fcd "cd \$(find . -type d | fzf)"  # Fuzzy search directories and cd into them

#System
alias upgrade 'sudo dnf update && sudo dnf upgrade -y' # Upgrade the system
alias q 'exit'
alias c 'clear'
alias mkdir 'mkdir -p'

#System Information
alias al "ls -al"
alias la "ls -la"
alias ll 'ls -lha' # long list all
alias lta "ls -lgha"
alias bat "bat --theme OneHalfDark"
alias cat "bat --theme OneHalfDark -p $argv"

# Docker
alias dk "docker kill (docker ps -q)"
alias dc "docker compose up -d"
alias dprune "docker system prune --filter \"until=720h\" && docker volume prune"

# Podman
alias ps "podman ps"

# Local bin
set -gx PATH "$HOME/.local/bin" $PATH
set -x PATH $PATH $HOME/.bin
