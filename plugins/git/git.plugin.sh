#!/bin/sh
# Git Shortcuts

alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gsa='git submodule add'
alias gco='git checkout'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.

