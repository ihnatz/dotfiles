fpath=( "$HOME/.zfunctions" $fpath )

source ~/.zfunctions/async
source ~/.zfunctions/shrink-path.plugin.zsh

async_init
async_start_worker evals_worker -n

source $HOME/.zfunctions/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zfunctions/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -U promptinit; promptinit
prompt pure

zstyle ':completion:*' menu select

alias ..='cd ..'
alias ...='cd ../..'

alias l='ls  -G'
alias ls='ls -G'
alias ll='ls -lG'

alias less='less -r'

alias g='git'
alias ga='git add'
alias gaa='git add .'
alias gb='git branch'
alias gco='git checkout'
alias gcm='git checkout master'
alias gd='git diff'
alias gst='git status'
alias gp='git push'
alias gl='git pull'

alias s='subl'
alias j='jobs'

alias tree='tree -C'

# Use C-x C-e to edit the current command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

bindkey ' ' magic-space
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

bindkey '^[' kill-whole-line

export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$HOME/.bin"

export PGHOST=localhost
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

export EDITOR='vim'
export GPG_TTY=$(tty)

# Colorize terminal
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.env ] && export $(cat ~/.env | xargs)

autoload -Uz compinit && compinit
