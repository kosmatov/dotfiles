ZSH=~/.oh-my-zsh
ZSH_THEME="../../dotfiles/akm"
plugins=(vi-mode history-substring-search)
export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LOGNAME=kosmatov
export USER=kosmatov

set -o vi

alias run_vagrant="(vagrant status | grep running && vagrant ssh) || (vagrant up && ssh-add && vagrant ssh)"
alias box="cd ~/rbox && run_vagrant"
alias rbox="cd ~/rbox && run_vagrant"
alias fbox="cd ~/fbox && run_vagrant"
alias dbox="cd ~/dbox && run_vagrant"
