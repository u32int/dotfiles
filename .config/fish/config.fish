if status is-interactive
end

function fish_user_key_bindings
    fish_vi_key_bindings --no-erase insert
end

function fish_greeting
	set_color brblack
	echo -n "[$(whoami)@$(cat /etc/hostname)] "
	set_color brwhite 
	echo -n "$(uname -r) $(uname -o) $(uptime --pretty)"
    echo ""
	set_color normal
end


# partly stolen from https://github.com/jonhoo/configs/

function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color blue
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	# printf '%s ' (__fish_git_prompt) # this is very slow for some reason
	set_color red
	echo -n '| '
	set_color normal
end


# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

abbr -a e nvim
abbr -a r ranger
abbr -a g git
abbr -a f 'xdg-open $(fzf --height 40% --reverse)'

# colored man output
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

setenv FZF_DEFAULT_OPTS '--height 20%'
setenv EDITOR 'nvim'
