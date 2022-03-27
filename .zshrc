eval "$(starship init zsh)"

function set_win_title(){
	echo -ne "\033]0; Let's Rock! \007"
}

precmd_functions+=(set_win_title)

bindkey '^[b' backward-word

# ZSH Aliases
alias -g ls="ls -Flsah"
