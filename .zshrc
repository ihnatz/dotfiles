fpath=( "$HOME/.zfunctions" $fpath )

source ~/.zfunctions/async
async_init
async_start_worker evals_worker -n

source $HOME/.zfunctions/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zfunctions/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -U promptinit; promptinit
prompt purer

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

alias b='bundle'
alias bi="bundle install"
alias be="bundle exec"
alias s='subl'
alias j='jobs'
alias jjj='cd /Users/ignat/Desktop/GoogleDrive/diary'

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

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$HOME/.bin"

# Go
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/work/go"
export PATH="$PATH:$GOPATH/bin"

# Flutter
export PATH="$PATH:$HOME/work/flutter/bin"

function extract()
{
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1     ;;
          *.tar.gz)    tar xvzf $1     ;;
          *.bz2)       bunzip2 $1      ;;
          *.rar)       unrar x $1      ;;
          *.gz)        gunzip $1       ;;
          *.tar)       tar xvf $1      ;;
          *.tbz2)      tar xvjf $1     ;;
          *.tgz)       tar xvzf $1     ;;
          *.zip)       unzip $1        ;;
          *.Z)         uncompress $1   ;;
          *.7z)        7z x $1         ;;
          *)           echo "'$1' cannot be extracted via >extract<" ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

t() {
  if [ -f .flutter-plugins ]; then
    flutter test $1
  elif [ -f ./bin/rspec ]; then
    bin/rspec --format=progress --no-profile $1
  else
    bundle exec rspec --format=progress --no-profile $1
  fi
}

did() {
  if ! grep --quiet "$(date '+%d %m %Y')" ~/did.txt; then
    echo "\n$(date '+%d %m %Y')" >> ~/did.txt;
  fi
  subl ~/did.txt && subl --command "move_to {\"extend\": false, \"to\": \"eof\"}"
}

export PGHOST=localhost
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

export EDITOR='vim'
export GPG_TTY=$(tty)

# Colorize terminal
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

export N_PREFIX="/usr/local/n"

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

DISABLE_AUTO_UPDATE="true"
eval "$(rbenv init - --no-rehash)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.env ] && export $(cat ~/.env | xargs)


autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

. $HOME/.nix-profile/etc/profile.d/nix.sh
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
source "$HOME/.cargo/env"
