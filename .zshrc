# If you come from bash you might have to change your $PATH.
export PATH="/usr/local/opt/sphinx-doc/bin:$HOME/bin:$PATH"
export CPATH=`xcrun --show-sdk-path`/usr/include
export JAVA_HOME=$(/usr/libexec/java_home -v11)

# Path to your oh-my-zsh installation.
export ZSH="/Users/kalle/.oh-my-zsh"

# Oh-my-zsh options
ZSH_THEME="avit"
DISABLE_AUTO_UPDATE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# plugins
plugins=(dotenv)

# plugin options
ZSH_DOTENV_PROMPT=false

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='vim'

bindkey -e

unsetopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
unsetopt HIST_VERIFY
export HISTSIZE=50000
export SAVEHIST=50000

export FZF_DEFAULT_COMMAND='rg --files'

# Make cursor mode-dependant
#let &t_SI.="\e[5 q" "SI = INSERT mode
#let &t_SR.="\e[4 q" "SR = REPLACE mode
#let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

# command aliases

# For some reason, when in tmux oh-my-zsh seems to modify the ls alias
# -> Set it here
alias ls='ls -G' 

alias ctags=/usr/local/bin/ctags

# History aliases
alias h='history | tail -n 10'
alias hh='history | tail -n 20'
alias hhh='history | tail -n 30'
alias hhhh='history | tail -n 40'
alias hgrep='history | grep'
alias hless='history | less'
alias hr='fc -RI'

# Tmux
alias tsd='tmux new-session -s Default || tmux new-session -t Default \; set-option destroy-unattached'

alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

# dotfiles
alias dotfiles='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Aliases for easier directory switching
alias d='dirs -v | head -10'
alias -1='cd -'
alias -2='cd -2'
alias -3='cd -3'
alias -4='cd -4'
alias -5='cd -5'
alias -6='cd -6'
alias -7='cd -7'
alias -8='cd -8'
alias -9='cd -9'

[ -f ~/.zsh_functions ] && source ~/.zsh_functions
[ -f ~/.fzf_functions ] && source ~/.fzf_functions
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#eval "$(direnv hook zsh)"
