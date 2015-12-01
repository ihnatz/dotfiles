ZSH=$HOME/.oh-my-zsh
ZSH_THEME="lambda"
plugins=(git)
source $ZSH/oh-my-zsh.sh

alias b='bundle'
alias e='exec'
alias bi="bundle install"
alias s='subl'
alias j='jobs'

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin"
export PATH=$HOME/.bin:$PATH

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
