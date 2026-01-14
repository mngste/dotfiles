alias today='date +%Y-%m-%d'
alias md="mkdir"

#alias cd
alias script='cd $SCRIPTS'
alias nconf='cd $HOME/.config/nvim/'

#alias system info
alias al='ls -al'
alias la='ls -la'
alias ll='ls -lha'
alias lta='ls -lgha'

#repos
alias dot='cd $DOTFILES'

# count files
alias count='find . -type f | wc -l'
alias v='nvim'
alias fv='nvim $(fzfb)'

#tmux alias
alias tns='tmux new -s $(echo $(pwd) | xargs basename)'

#fzf azlias
alias fzfb='fzf --preview "bat --color always --style numbers,changes {}"'

#cat alias
alias cat='bat --paging never --theme DarkNeon --style plain,changes'

#kubectl aliases
alias k='kubectl'
alias kl='kubectl logs'
alias kg='kubectl get $1'
alias kgy='kubectl get $1 $2 -oyaml'
alias kn='kubens'
alias kc='kubectx'

#git aliases
alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gs='git status --short'
alias gst='git status'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gb='git branch'
alias gco='git checkout'
alias gp='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gmg='git merge'
alias gpf='git push --force'
alias lg='lazygit'

# gcap: commit all and push
gcap() {
    git commit -a -m $1
    git push
}

# gmerge: merge current branch to the given branch
gmerge() {
    branch=$(git rev-parse --abbrev-ref HEAD) && \
    echo "merging" $branch "to" $1
    git checkout $1 && \
    git merge $branch
}

# source the zsh config file
alias sc='source $HOME/.zshrc'
# edit the zsh config file
alias ec='$EDITOR $HOME/.zshrc'

# make dir and cd into it
mdcd() {
  mkdir -p -- "$1" && cd -P -- "$1"
}
