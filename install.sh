#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt update

# Install Zsh
echo "Installing Zsh..."
sudo apt install -y zsh

# Change default shell to Zsh
echo "Changing default shell to Zsh..."
chsh -s "$(which zsh)"

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Oh My Posh
echo "Installing Oh My Posh..."
# Make sure you have Go installed
if ! command -v go &> /dev/null; then
    echo "Go is not installed. Installing Go..."
    sudo apt install -y golang
fi

# Install Oh My Posh
go install github.com/JanDeDobbeleer/oh-my-posh@latest

# Add Oh My Posh to Zsh configuration
echo "Configuring Oh My Posh..."
echo 'eval "$(oh-my-posh init zsh --config ~/.poshthemes/your-theme.omp.json)"' >> ~/.zshrc

# Create directory for Oh My Posh themes if it doesn't exist
mkdir -p ~/.poshthemes

echo "Setup complete! Please restart your terminal."

# Installing fonts
echo "Installing fonts..."
sudo cp ./JetBrains/*.ttf /usr/share/fonts/
sudo cp ./Awesome/*.otf /usr/share/fonts/
sudo fc-cache -fv
echo "Fonts are installed successfully."

# Check if the ~/.config/i3 directory exists
if [ -d "$HOME/.config/i3" ]; then
    # Copy the config file
    sudo cp ./config "$HOME/.config/i3/config" && cp ./Buildings.png "$HOME/.config/i3"
else
    # Create the directory and copy the config file if it does not exist
    sudo mkdir -p "$HOME/.config/i3"
    sudo cp ./config "$HOME/.config/i3"
    sudo cp ./Buildings.png "$HOME/.config/i3/"
fi
sudo chmod +x ~/.config/i3/config

# Polybar configuration
if [ -d "$HOME/.config/polybar/" ]; then 
    cp -r polybar/* ~/.config/polybar/ && sudo find ~/.config/polybar/ -type f -exec chmod +x {} +
else
    sudo mkdir -p ~/.config/polybar && sudo cp -r polybar/* ~/.config/polybar/ && sudo find ~/.config/polybar/ -type f -exec chmod +x {} +
fi 

# Rofi configuration
if [ -d "$HOME/.config/rofi/" ]; then 
    cp ./rofi/config.rasi "$HOME/.config/rofi/" && chmod +x "$HOME/.config/rofi/config.rasi"
  else
    sudo cp -r ./rofi/ ~/.config/ && sudo chmod +x ~/.config/rofi/config.rasi 
fi 

# Lock script
if [ -d "$HOME/.config/scripts/" ]; then 
    cp ./lock "$HOME/.config/scripts/lock" && chmod +x "$HOME/.config/scripts/lock"
else
    mkdir -p ~/.config/scripts/ && cp ./lock "$HOME/.config/scripts/lock" && chmod +x "$HOME/.config/scripts/lock"
fi 

# Kitty config
if [ -d "$HOME/.config/kitty/" ]; then 
    cp ./kitty.conf "$HOME/.config/kitty/" && chmod +x "$HOME/.config/kitty/kitty.conf"
else
    mkdir -p ~/.config/kitty/ && cp ./kitty.conf "$HOME/.config/kitty/" && chmod +x "$HOME/.config/kitty/kitty.conf"
fi

#lunching the Polybar 
sudo ~/.config/polybar/launch.sh 
