#!/usr/bin/env bash

# Function to install dependencies
install_dependencies() {
    echo "Installing dependencies..."
    for package in "${dependencies[@]}"; do
        if ! command -v "$package" &> /dev/null; then
            echo "Installing $package..."
            sudo apt-get install -y "$package"
        else
            echo "$package is already installed."
        fi
    done
}

create_symlinks() {
    echo "Creating symlinks in ~/.config  ..."
    for dir in */; do
        # Only process directories
        if [ -d "$dir" ]; then
            stow --target="$XDG_CONFIG_HOME" "$dir"
        fi
    done

    # Create specific symlinks for .zshrc and .tmux.conf
    ln -sf "$(pwd)/.zshrc" "$HOME/.zshrc"
    ln -sf "$(pwd)/.tmux.conf" "$HOME/.tmux.conf"
    ln -sf "$(pwd)/starship.toml" "$HOME/.config/starship.toml"
}


# Execute the functions
install_dependencies
create_symlinks

echo "Dotfiles installation complete!"
