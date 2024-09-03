#!/bin/bash
HYPRLAND_PKGS=(
    hyprland
    hypridle
    hyprpaper
    hyprlock
)
HYPRLAND_PKGS_GIT=(
    hyprland-git
    hypridle-git
    hyprpaper-git
    hyprlock-git
)
PKGS=(
    kitty
    google-chrome
    waybar
    fuzzel
    yazi
    thunar
    pavucontrol
    nm-connection-editor
    vesktop-bin
    ttf-jetbrains-mono-nerd
)
check_yay() {
    if ! command -v yay &> /dev/null; then 
        echo "yay is not installed"
        sleep 2
        echo "installing yay from AUR"

    if ! command -v git &> /dev/null; then 
        echo "Git not found, Installing git..."
        sudo pacman -S --noconfirm git 
    fi
    
        git clone https://aur.archlinux.org/yay-bin.git || { echo "Failed to clone Yay Repo"; exit 1;}
        cd yay-bin || { echo "Failed to enter yay-bin directory"; exit 1; }
        makepkg -si --noconfirm || { echo "Failed to build and install yay"; exit 1; }
        echo "Yay was installed !!"
        cd .. || { echo "Failed to return to the original directory"; exit 1; }
    else
        echo "Yay was found"
    fi
}

echo "checking for Yay"
check_yay
echo "Do you want to install Hyprland from git? (y/n)"
read -r CONFIRM
if [[ $CONFIRM =~ ^[Yy]$ ]]; then
    echo "Installing Hyprland from git"
    yay -S --noconfirm "${HYPRLAND_PKGS_GIT[@]}" || { echo "Failed to install packages"; exit 1; }
else
    echo "Installing Hyprland from Arch Repos"
    yay -S --noconfirm "${HYPRLAND_PKGS[@]}" || { echo "Failed to install packages"; exit 1; }
fi

echo "installing rest of packages"
yay -S --noconfirm "${PKGS[@]}" || { echo "Failed to install packages"; exit 1; }

echo "Copying Config files over" 
cp -rf dotconfig ~/.config
cp -rf .bashrc ~/
cp -rf .themes ~/

