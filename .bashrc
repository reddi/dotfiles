# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
alias ll='ls -la'
alias sc='sudo systemctl'

PS1='\[\033[01;34m\]\w\[\033[31m\]$(__git_ps1 "[%s]")\[\033[01;32m\]$(__prompt_stgit)\[\033[01;34m\]$\[\033[00m\] '

export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export PROMPT_COMMAND='history -a'
export HISTCONTROL=ignoredups
export HISTFILESIZE=5000
export HISTSIZE=5000
shopt -s histappend

export EDITOR=vim

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

for fname in ~/.bash_sources/*; do
    . $fname
done
