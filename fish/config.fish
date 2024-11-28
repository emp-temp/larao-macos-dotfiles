if status is-interactive
    eval $(/opt/homebrew/bin/brew shellenv)
end

# GPG_TTY の設定
set -Ux GPG_TTY (tty)

# alias の設定
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias cat='bat --paging=never'

alias g='git'

# Go のパス設定
set -Ux GOPATH $HOME/go

# PAT の設定（環境変数）
set -Ux PAT $PAT
