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

dnode() {
  GREEN='\033[0;32m'
  NC='\033[0m' # No Color
  RED='\033[1;31m'
  # Check if --info flag is passed
  if [[ "$1" == "--info" ]]; then
    echo "${GREEN}[INFO]${NC} Calculating size of all node_modules directories in $(pwd)"
    total_size=$(find . -name 'node_modules' -type d -not -path '*/.*' -prune -exec du -b '{}' + 2>/dev/null | awk '{total += $1} END {printf "%.2f GB\n", total/1024/1024/1024}')
    echo "${GREEN}[INFO]${NC}: Total disk usage of all node_modules: ${RED}$total_size${NC}"
    return
  fi

  find . -name 'node_modules' -type d -prune -not -path '*/.*' -print | \
  awk '{print NR, $0}' | \
  fzf --margin 1,1,1,1 --padding 2,1,1,2 --marker='📌' -m --border=rounded --border-label='Delete node_modules' --pointer '👉' --layout=reverse --with-nth=2.. \
  --preview 'tree -L 1 -C $(echo {} | awk "{print \$2}") | head -20; echo ''; du -sh $(echo {} | awk "{print \$2}")' | \
  awk '{$1=""; print $0}' | \
  xargs -I {} rm -rvf '{}'
}
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
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
export FZF_DEFAULT_OPTS='--bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all'
alias nvim="vv"
alias vi="vim"
alias tmpv="mpv --no-config --vo=sixel  --profile=sw-fast --really-quiet --vo-sixel-reqcolors=0 --ao='pulse'"

#alias dnode='find . -name "node_modules" -type d -prune -not -path "*/.*" -print | awk "{print NR, \$0}" | fzf -m --border=rounded --border-label="Delete node_modules" --pointer "👉" --layout=reverse --with-nth=2.. --preview "tree -L 1 -C \$(echo {} | awk '\''{print \$2}'\'') | head -100; du -sh \$(echo {} | awk '\''{print \$2}'\'')" | awk "{\$1=\"\"; print \$0}" | xargs -I {} rm -rvf "{}"'


alias prx="proxychains4"

. "/home/walid/.deno/env"

#export JAVA_HOME="/usr/lib/jvm/default-java"
#export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"
#export PATH="$JAVA_HOME/bin:$PATH"

#export PATH=/usr/local/cuda/bin:$PATH
#export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

if [ -n "$NVIM" ]; then
  WEZTERM_SHELL_SKIP_ALL=1
fi
