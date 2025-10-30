# Basic setup
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups
setopt autocd notify

unset beep nomatch

# Zinit loader
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

###########
# Completion
###########

autoload -Uz compinit
compinit -C
zstyle ':completion:*' rehash true

#################
# Plugins (turbo)
#################

zinit wait lucid for \
  zsh-users/zsh-completions \
  Aloxaf/fzf-tab \
  zsh-users/zsh-autosuggestions \
  zdharma-continuum/fast-syntax-highlighting

# fzf bindings (faster than `source <(fzf --zsh)`)
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

####################
### Key Bindings ###
####################

bindkey -v
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

alias ls='eza --long --color=always --icons=always --no-user'
alias grep='grep --color'
alias vim='nvim'
alias c='clear'

alias nzo="~/.local/bin/zoxide_openfiles_nvim.sh"

##########################
### SHELL INTEGRATIONS ###
##########################

# if [[ $- == *i* ]] && [[ -z "$TMUX" ]]; then
#     fastfetch
# fi

# ------------Zoxide--------------
eval "$(zoxide init zsh)"

# ------------FZF--------------
eval "$(fzf --zsh)"

# ------------Starship--------------
eval "$(starship init zsh)"
