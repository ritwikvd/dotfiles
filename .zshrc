eval "$(starship init zsh)"

function set_win_title(){
	echo -ne "\033]0; Let's Rock! \007"
}

precmd_functions+=(set_win_title)

bindkey -v
bindkey '^[b' backward-word
bindkey '^R' history-incremental-search-backward

# ZSH Aliases
alias -g ls="ls -Flsah"
alias -g cddash="cd ~/Desktop/personal/pushowl/dashboard/"
alias -g lctl="launchctl"
alias -g cl="clear"
alias -g fd="fd -c never"
alias -g tm="tmux"
