########## Walid

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/config.toml
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


# Function to switch Neovim configuration using fzf and ripgrep
# Function to select a nvim config symlink
vv() {
  local selected
  selected=$(find ~/.config -type l -name 'nvim*' | sort | fzf --height 8 --pointer '👉' --layout=reverse )
  
  if [ -n "$selected" ]; then
    NVIM_APPNAME=$(basename "$selected") nvim "$@"
  else
    echo "No selection made."
  fi
}

export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# Android SDK
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH=$PATH:$ANDROID_HOME/emulator


export PATH="$HOME/.local/bin:$PATH"


alias vim="vv"
alias nvim="vv"
. "/home/walid/.deno/env"
