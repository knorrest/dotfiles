# If you come from bash you might have to change your $PATH.
export PATH="/usr/local/opt/sphinx-doc/bin:$HOME/bin:$PATH"
export CPATH=`xcrun --show-sdk-path`/usr/include
export JAVA_HOME=$(/usr/libexec/java_home -v25)
export GRAALVM_HOME=/Library/Java/JavaVirtualMachines/graalvm-jdk-25.0.1+8.1/Contents/Home

# User configuration

unsetopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
unsetopt HIST_VERIFY
export HISTSIZE=50000
export SAVEHIST=50000

export FZF_DEFAULT_COMMAND='rg --files --hidden'
#export FZF_DEFAULT_OPTS='--tmux 100%'

# Similar to oh-my-zsh?
setopt ALWAYS_TO_END
setopt AUTO_CD
setopt AUTO_PUSHD
setopt COMPLETE_IN_WORD
setopt EXTENDED_HISTORY
# noflowcontrol 
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE
setopt INTERACTIVE_COMMENTS
setopt LONG_LIST_JOBS
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS


# Turn on completion
autoload -Uz compinit && compinit

# Use vim as commandline editor

export EDITOR='vim'
bindkey -v

# Remove mode switching delay.
KEYTIMEOUT=5

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select

_fix_cursor() {
   echo -ne '\e[6 q'
}

precmd_functions+=(_fix_cursor)

# Enable a few readline shortcuts in insert mode
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line

# command aliases
alias ls='ls -G' 
alias ctags=/usr/local/bin/ctags
alias t=todo.sh
alias fzfp='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'

# History aliases
alias history='fc -l 1'
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
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

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

export NVM_DIR=~/.nvm 
source $(brew --prefix nvm)/nvm.sh

alias ctags="$(brew --prefix)/bin/ctags"

# Prompt

PROMPT='
%B%~ %b$(gitprompt)
%(?.%F{green}.%F{red})▶%f '

#LSCOLORS="exfxcxdxbxegedabagacad"
LSCOLORS="gxfxcxdxbxegedabagacad"


[ -f ~/.git_prompt.zsh ] && source ~/.git_prompt.zsh
[ -f ~/.zsh_functions ] && source ~/.zsh_functions
#[ -f ~/.fzf_functions ] && source ~/.fzf_functions
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
#eval "$(direnv hook zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Set up edit-command-line
autoload edit-command-line; zle -N edit-command-line
bindkey '^X^e' edit-command-line
bindkey -M vicmd ' ' edit-command-line

# Add to PATH
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="$PATH:/Users/kalle/.dotnet/tools"
export PATH=$PATH:/Users/kalle/.local/bin
