fpath=( "$HOME/.zfunctions" $fpath )

autoload -U compinit; compinit
autoload -U promptinit; promptinit
prompt pure

zstyle ':completion:*' menu select

# Colorize terminal
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

alias l='ls -G'
alias ls='ls -G'
alias ll='ls -lG'

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

alias b='bundle'
alias bi="bundle install"
alias s='subl'
alias j='jobs'

alias tree='tree -C'
alias t='bundle exec rspec'

export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

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

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

export GOPATH=$HOME/Work/gocode/
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin:$HOME/.bin:$GOPATH/bin"

export LANG=en_US.UTF-8
export EDITOR='vim'

eval "$(rbenv init -)"

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

[[ -f ~/.docker_config ]] && source ~/.docker_config

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PGHOST=localhost

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export GPG_TTY=$(tty)
