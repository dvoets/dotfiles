#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Useful alias
alias pacman='sudo pacman'
alias ..='cd ..'
alias c.='cd ~'
alias vi='vim'
alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias l.='ls -d .* --color=auto'
alias mkdir='mkdir -p'
## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

PS1='[\u@\h \W]\$ '

export VISUAL="vim"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
