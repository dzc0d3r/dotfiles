########## Walid

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/config.toml
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


# Function to switch Neovim configuration using fzf and ripgrep
# Function to select a nvim config symlink
vv() {
  # Not load the default vimrc and keep vim and nvim completely seperate
  # because of the use of lazyvim, nvchad ...
  unset VIMINIT
  local selected
  selected=$(find ~/.config -type l -name 'nvim*' | sort | nl -w2 -s'. ' | fzf --height 8 --border=rounded --border-label='Select nvim config' --pointer '👉' --layout=reverse )
  
  if [ -n "$selected" ]; then
    NVIM_APPNAME=$(basename "$selected") nvim "$@" && export VIMINIT="source $HOME/.config/vim/.vimrc"
  else
    echo "No selection made."
  fi
}


# Reload ~/.zshrc or restart terminal for changes to take effect

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
export VIMINIT="source $HOME/.config/vim/.vimrc"


alias vi="vim"
alias nvim="vv"
alias tmpv="mpv --no-config --vo=sixel  --profile=sw-fast --really-quiet --vo-sixel-reqcolors=0 --ao='pulse'"

. "/home/walid/.deno/env"
