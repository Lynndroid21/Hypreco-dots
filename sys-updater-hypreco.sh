#!/bin/bash

## Hypreco Updater! Yayyy!
## Script works only on Arch/Arch-based distros.

readonly DOTS_REPO="https://github.com/Lynndroid21/Hypreco-dots"
readonly DOTS_NAME="Hypreco-dots"
readonly DOTS_INSTALL_DIR="$HOME/.config"
readonly PATH_TO_GIT_CLONE="$HOME/$DOTS_NAME"
readonly PATH_TO_ROFI_THEMES="$HOME/.local/share/rofi/themes"

DotsUpd() {
    echo "Next, we'll update the dotfiles!~"
    echo ""
    read -p "Do you wanna backup your configs? (Y/n): " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo mkdir $DOTS_INSTALL_DIR/backup
        command cp -r -v -i $DOTS_INSTALL_DIR/btop $DOTS_INSTALL_DIR/backup
        command cp -r -v -i $DOTS_INSTALL_DIR/cava $DOTS_INSTALL_DIR/backup
        command cp -r -v -i $DOTS_INSTALL_DIR/fish $DOTS_INSTALL_DIR/backup
        command cp -r -v -i $DOTS_INSTALL_DIR/kitty $DOTS_INSTALL_DIR/backup
        command cp -r -v -i $DOTS_INSTALL_DIR/mako $DOTS_INSTALL_DIR/backup
        command cp -r -v -i $DOTS_INSTALL_DIR/hypr $DOTS_INSTALL_DIR/backup
        command cp -r -v -i $DOTS_INSTALL_DIR/rofi $DOTS_INSTALL_DIR/backup
        command cp -r -v -i $DOTS_INSTALL_DIR/matugen $DOTS_INSTALL_DIR/backup
        command cp -r -v -i $DOTS_INSTALL_DIR/hyprpanel $DOTS_INSTALL_DIR/backup
        command cp -r -v -i $DOTS_INSTALL_DIR/fastfetch $DOTS_INSTALL_DIR/backup
    fi
    echo ""
    echo "Now we're gonna redownload the dots....~"
    echo ""
    install_HEdots
}

install_HEdots() {
    git clone $DOTS_REPO
    echo ""
    echo "Now copying them over....~"
    echo ""
    sleep 2
    command cp -r -v -i $PATH_TO_GIT_CLONE/configs/btop $DOTS_INSTALL_DIR
    command cp -r -v -i $PATH_TO_GIT_CLONE/configs/cava $DOTS_INSTALL_DIR
    command cp -r -v -i $PATH_TO_GIT_CLONE/configs/fastfetch $DOTS_INSTALL_DIR
    command cp -r -v -i $PATH_TO_GIT_CLONE/configs/fish $DOTS_INSTALL_DIR
    command cp -r -v -i $PATH_TO_GIT_CLONE/configs/hypr $DOTS_INSTALL_DIR
    command cp -r -v -i $PATH_TO_GIT_CLONE/configs/hyprpanel $DOTS_INSTALL_DIR
    command cp -r -v -i $PATH_TO_GIT_CLONE/configs/kitty $DOTS_INSTALL_DIR
    command cp -r -v -i $PATH_TO_GIT_CLONE/configs/matugen $DOTS_INSTALL_DIR
    command cp -r -v -i $PATH_TO_GIT_CLONE/configs/rofi $DOTS_INSTALL_DIR
    command cp -v -i $PATH_TO_GIT_CLONE/configs/background.jpg $DOTS_INSTALL_DIR
    command cp -v -i $PATH_TO_GIT_CLONE/configs/starship.toml $DOTS_INSTALL_DIR
    command cp -v -i $PATH_TO_GIT_CLONE/configs/Arch21-default.rasi $PATH_TO_ROFI_THEMES

    info "All the configs are fully Updated! Yay~"
    sleep 4
    command clear
    sleep 1
}

DotsConf() {
    read -p "Do you wish to update the dots, hun? (Y/n): " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        DotsUpd
    fi
}

globUpd() {
    read -p "Updater Loaded! Ready, $USER? (Y/n): " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
    Upd_promHE() {
        echo "Time to get $HOSTNAME fully updated!~"
        local mgr=$(for m in pacman xbps dnf zypper apt; do command -v $m &>/dev/null && { echo ${m%%-*}; break; }; done)

        case $mgr in
            pacman) sudo pacman -Syu ;;
            dnf) sudo dnf update ;;
            zypper) sudo zypper update ;;
            xbps) sudo xbps-install -Su ;;
            apt) sudo apt upgrade ;;
            *) error "Sorry hun! We have no idea what package manager this is...."; return 1 ;;
        esac
    }
    Upd_promHE
    updcomp=true
    else
    if [[ $REPLY =~ ^[Nn]$ ]]; then
        sleep 2
        echo ""
        echo "No worries, hun! Have a good day!"
        sleep 4
        command clear
        command exit
        fi
    fi
}

# Prompt restart
HE_rb() {
    if $updcomp = true; then
        echo "You may have some important stuff to reload!"
        echo ""
        read -p "Wanna restart your system, babe? (Y/n): " -n 1 -r
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            echo ""
            command reboot
        else
            echo ""
            echo "Just be sure to restart later, okay?~" && sleep 4 && echo "3...2..1.~ And Done!"
        fi
    fi
}

# -----------------------------------------------------------------------------------------------------------------------

echo " _____                                                                _____ ";
echo "( ___ )                                                              ( ___ )";
echo " |   |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|   | ";
echo " |   |                                                                |   | ";
echo " |   |                                                                |   | ";
echo " |   |   ░█░█░█░█░█▀█░█▀▄░█▀▀░█▀▀░█▀█░░░█░█░█▀█░█▀▄░█▀█░▀█▀░█▀▀░█▀▄   |   | ";
echo " |   |   ░█▀█░░█░░█▀▀░█▀▄░█▀▀░█░░░█░█░░░█░█░█▀▀░█░█░█▀█░░█░░█▀▀░█▀▄   |   | ";
echo " |   |   ░▀░▀░░▀░░▀░░░▀░▀░▀▀▀░▀▀▀░▀▀▀░░░▀▀▀░▀░░░▀▀░░▀░▀░░▀░░▀▀▀░▀░▀   |   | ";
echo " |   |                                                                |   | ";
echo " |   |                        By Lynndroid21!~                        |   | ";
echo " |   |                                                                |   | ";
echo " |___|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|___| ";
echo "(_____)                                                              (_____)";
echo ""
echo "Preparing.... Gimme a second, babe!~"

sleep 4

globUpd

echo ""

DotsConf

sleep 1

HE_rb

sleep 2

echo "all set bb!"

sleep 4

command clear

exit
