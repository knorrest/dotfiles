export PATH="/usr/local/opt/sphinx-doc/bin:$HOME/bin:$PATH"
export CPATH=`xcrun --show-sdk-path`/usr/include

# command aliases
alias ll='ls -lhA'
alias h='history | tail -n 10'
alias hh='history | tail -n 20'
alias hhh='history | tail -n 30'
alias hhhh='history | tail -n 40'
alias hgrep='history | grep'
alias hless='history | less'
alias ls='ls -GFh'

alias hcr='history -c; history -r' # reread history
alias hr='history -r' # read history
alias ha='history -a'

alias tmuxd='new-session -s Default || tmux new-session -t Default'

# directory aliases
alias empear='cd ~/github/empear-analytics'
alias knorrest='cd ~/github/knorrest'
alias github='cd ~/github'
alias gitlab='cd ~/gitlab'
alias bitbucket='cd ~/bitbucket'
alias codescene='cd ~/codescene'

# use vi for command line editing
set -o vi

# git stuff
source /usr/local/git/contrib/completion/git-completion.bash
source /usr/local/git/contrib/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true

# colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# prompt - two lines with git branch and history nbr
#PROMPT_COMMAND='__git_ps1 "\[\033[34m\w\[\033[0m" "\n!\! \$ "'
PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007";__git_ps1 "\[\033[34m\w\[\033[0m" "\n!\! \$ "'
# history
shopt -s histappend
shopt -s cmdhist
export HISTCONTROL=ignoreboth
export HISTIGNORE="ls:ps:history:h:hh:hhh:hgrep:hless"
export HISTSIZE=3000

# added by travis gem
[ -f /Users/kalle/.travis/travis.sh ] && source /Users/kalle/.travis/travis.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
