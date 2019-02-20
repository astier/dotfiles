#!/usr/bin/env bash

[[ $- != *i* ]] && return

# Bash
HISTCONTROL=ignoreboth
PS1="\[\e[32m\][\W]\$\[\e[m\] "
set -o vi
shopt -s autocd cdspell

# Defaults
alias cal='cal -m'
alias df="df -h"
alias grep="grep --color"
alias ls="ls --color --group-directories-first -h"
alias pacman="sudo pacman"
alias rm="rm -fr"
cd() { builtin cd "$@" && ls -A; }

# Directories
alias jp="cd ~/Projects/"
alias jdo="cd ~/Downloads/"
alias ja="cd ~/Projects/arch-installer/"
alias jd="cd $DOTFILES"
alias jdm="cd ~/Projects/dmenu/"
alias jdw="cd ~/Projects/dwm/"
alias js="cd ~/Projects/st/"
alias jm="cd ~/Dropbox/ISY/S3/MYO/"
alias jn="cd ~/Dropbox/Notes/"

# Files
alias ob="$EDITOR $DOTFILES/.bashrc && . ~/.bashrc"
alias ox="$EDITOR $DOTFILES/.xinitrc"
alias ov="$EDITOR $DOTFILES/nvim/init.vim"
alias oa="$EDITOR ~/Projects/arch-installer/arch_desktop.sh"
alias on="$EDITOR ~/Dropbox/Notes/notes"

# Templates
TMP="$HOME/Projects/templates"
alias tla="cp $TMP/latex/article.tex ."
alias tlb="cp $TMP/latex/beamer.tex ."

# Git
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gbv="git branch -v"
alias gbvv="git branch -vv"
alias gc="git commit"
alias gcl="git clone"
alias gcam="git commit -am"
alias gcm="git commit -m"
alias gd="git diff"
alias gl="git log"
alias glo="git log --oneline"
alias gg="git log --all --graph --decorate --oneline -n16"
alias gga="git log --all --graph --decorate --oneline"
alias go-="git checkout --"
alias go="git checkout"
alias gob="git checkout -b"
alias gp="git push"
alias gpl="git pull"
alias gs="git status"

# Misc
alias -- -="cd -"
alias c="cd"
alias cl="clear"
alias l="ls -A"
alias m="sudo reflector -p https -l32 -f16 --score 8 --sort rate --save /etc/pacman.d/mirrorlist; cat /etc/pacman.d/mirrorlist"
alias sa="source activate"
alias sd="conda deactivate"
alias u='yay'
alias v="nvim"
