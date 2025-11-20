#!/bin/bash

## Hypreco Updater! Yayyy!
## Script works only on Arch/Arch-based distros.

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
echo "Updating.... Gimme a second, babe!~"

sleep 4

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
globUpd

echo ""

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
HE_rb

sleep 2

echo "all set bb!"

sleep 4

command clear

exit
