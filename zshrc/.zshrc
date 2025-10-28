# Basic env setup
export EDITOR='nvim'
export SUDO_EDITOR="$EDITOR"

HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups
setopt autocd notify

unset beep nomatch

# Load zinit if not existant
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Load completion plugin
zinit light zsh-users/zsh-completions

# Initialize completion system
autoload -Uz compinit
compinit

# Syntax & suggestion plugins
# zinit light zsh-users/zsh-syntax-highlighting
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light Aloxaf/fzf-tab
source <(fzf --zsh)
zinit light zsh-users/zsh-autosuggestions

####################
### Key Bindings ###
####################

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^y' autosuggest-accept

##########################
### COMPLETION STYLING ###
##########################

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -a --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

###############
### ALIASES ###
###############

alias ls='ls --color'
alias grep='grep --color'
alias vim='nvim'
alias c='clear'

##########################
### SHELL INTEGRATIONS ###
##########################

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
