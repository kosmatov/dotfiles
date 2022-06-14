ZSH=~/.oh-my-zsh
ZSH_THEME=$DOTFILES/akm
plugins=(vi-mode history-substring-search per-directory-history timer)

export EDITOR=vim
export LC_ALL=en_US.UTF-8
export TIMER_FORMAT='[%d] '
export TIMER_PRECISION=2
export TIMER_THRESHOLD=1

set -o vi

source ~/.oh-my-zsh/oh-my-zsh.sh
