eval "$(starship init zsh)"

function set_win_title(){
	echo -ne "\033]0; Let's Rock! \007"
}

precmd_functions+=(set_win_title)

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion) 

bindkey -v
bindkey '^[b' backward-word
# bindkey '^R' history-incremental-search-backward
bindkey '^a' autosuggest-accept
bindkey -s '^e' 'cd $(fd -tH d | fzf)\r'

# ZSH Aliases
alias -g ls="ls -Flsah"
alias -g cddash="cd ~/Desktop/personal/pushowl/dashboard/"
alias -g lctl="launchctl"
alias -g cl="clear"
alias -g fd="fd -c never"
alias -g tm="tmux"
alias -g nv="nvim"
alias -g gbin="cd /usr/local/bin/"
alias -g nconf="cd ~/.config/nvim/ && nv ."

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
