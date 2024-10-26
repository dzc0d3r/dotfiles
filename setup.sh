#!/usr/bin/env bash

dependencies=(tmux terminator mpd mpc ncmpcpp )

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
check_and_install_brew() {
    # Check if Homebrew is installed
    if ! command -v brew &> /dev/null; then
        echo "Homebrew is not installed. Installing now..."
        # Install Homebrew
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        # Reload the shell to update the PATH
        echo "Homebrew installed. Reloading shell..."
        exec "$SHELL" --login
    else
        echo "Homebrew is already installed."
    fi

    # Install dependencies from leaves.txt
    if [ -f leaves.txt ]; then
        echo "Checking dependencies from leaves.txt..."
        while IFS= read -r dep; do
            # Check if the dependency is already installed
            if ! brew list --formula | grep -q "^$dep\$"; then
                echo "Installing $dep..."
                brew install "$dep"
            else
                echo "$dep is already installed."
            fi
        done < leaves.txt
    else
        echo "leaves.txt not found. No dependencies to install."
    fi
}


setup() {
    install_dependencies
    check_and_install_brew
    stow .
    
    # Check if the line is already in .zshrc
    if ! grep -q "source ~/.config/zshrc/.zshrc" ~/.zshrc; then
        echo "source ~/.config/zshrc/.zshrc" >> ~/.zshrc
        echo "Added source line to .zshrc."
    else
        echo "Line for .zshrc already exists."
    fi

    # Check if the line is already in .tmux.conf
    if ! grep -q "tmux source ~/.config/tmux/.tmux.conf" ~/.tmux.conf; then
        echo "tmux source ~/.config/tmux/.tmux.conf" >> ~/.tmux.conf
        echo "Added tmux source line to .tmux.conf."
    else
        echo "Line for .tmux.conf already exists."
    fi
}



# Execute the functions

setup

echo "Dotfiles installation complete!"
