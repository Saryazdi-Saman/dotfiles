#
# ~/.zprofile
#

#------------Basic env------------

export EDITOR='nvim'
export SUDO_EDITOR="$EDITOR"

#------------All PATHS------------
# Add local ~/scripts to the PATH
export PATH="$HOME/.local/bin:$PATH"

# Mason
# export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

# Tmux
export TMUX_CONF="$HOME/.config/tmux/tmux.conf"

# Starship PATH
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# Tealdeer
export TEALDEER_CONFIG_DIR="$HOME/.config/tealdeer/"

#------------Langs------------

# Golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# PNPM
export PNPM_HOME="/home/saman/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

[[ -f ~/.zshrc ]] && . ~/.zshrc

# Auto stary hyprland on login through tty1
if [[ -z $DISPLAY && $(tty) == /dev/tty1 ]]; then
	exec Hyprland
fi
