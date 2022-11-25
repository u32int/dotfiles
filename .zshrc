# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "/home/$USER/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# enable bash-like reverse history search
bindkey -v
bindkey '^R' history-incremental-search-backward

setopt promptsubst
autoload -U colors && colors	# Load colors
parse_git_branch() {
    branch=$(git symbolic-ref --short HEAD 2> /dev/null)
    if [[ $branch != "" ]]; then
        echo " $branch"
    fi
}
PROMPT="%B%{$fg[grey]%}%n%{$fg[grey]%}%b %2~ %{$reset_color%}$ "
#RPROMPT='$(parse_git_branch)'
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

# -- Aliases --
alias nv="nvim"
alias ls="ls --color"
alias la="ls -alh --color"
alias ll="ls -lh --color"
alias nb="newsboat"
alias py="python3"
alias fz='xdg-open $(fzf --height 40% --reverse)'

# aliases related to local network. Irrelevant for other deployments.
# source ~/.shell-local-alias

# -- Plugins --
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# -- Path --
# append
path+=('/var/lib/flatpak/exports/bin' "/home/$USER/.cargo/bin" "/home/$USER/.local/bin" "/home/$USER/.scripts" "/home/$USER/.local/share/gem/ruby/3.0.0/bin")
# export to sub-processes (make it inherited by child processes)
export PATH
export EDITOR="nvim"
