#!/usr/bin/env bash

dependencies=(tmux terminator mpd mpc ncmpcpp )

print_in_red() {
    echo -e "\033[31m$1\033[0m"
}

# Function to install dependencies
install_dependencies() {
    print_in_red "############# Info ###############"
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
        print_in_red "############# Info ###############"
        echo "Homebrew is not installed. Installing now..."
        # Install Homebrew
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        # Reload the shell to update the PATH
        print_in_red "############## Skip ##############"
        echo "Homebrew installed. Reloading shell..."
        exec "$SHELL" --login
    else
        echo "Homebrew is already installed."
    fi

    # Install dependencies from leaves.txt
    if [ -f leaves.txt ]; then
        print_in_red "############## Info ##############"
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
        print_in_red "############# Info ###############"
        echo "source ~/.config/zshrc/.zshrc" >> ~/.zshrc
        echo "Added source line to .zshrc."
    else
        print_in_red "############# Skip ###############"
        echo "Line for .zshrc already exists."
    fi

    # Check if the line is already in .tmux.conf
    
}



# Execute the functions

setup

print_in_red "############# Info ###############"
echo "Dotfiles installation complete!"
