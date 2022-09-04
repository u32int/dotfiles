#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color'
alias ll='ls -l --color'
alias la='ls -alh --color'
alias nv="nvim"
alias py="python"
alias nb="newsboat"
alias mpvyt="mpv --ytdl-format='bestvideo[height<=?1080]+bestaudio/best'"

# aliases related to local network. Irrelevant for other deployments.
# source ~/.shell-local-alias

export COLORTERM="truecolor"

PS1='[\u@\h \W]\$ '
#PS1="\e[36m\u::\e[37m\W $ \e[0m"
