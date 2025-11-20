#!/bin/bash

## Welcome to HyprEco!!!! Hope you enjoy the dots!~
## Installer built for various package managers listed below!

readonly DOTS_REPO="https://github.com/Lynndroid21/Hypreco-dots"
readonly DOTS_NAME="Hypreco-dots"
readonly DOTS_INSTALL_DIR="$HOME/.config"
readonly PATH_TO_GIT_CLONE="$HOME/$DOTS_NAME"

# bash trap command
trap HEexit INT

# bash clear screen command
clear;

# bash trap function is executed when CTRL-C is pressed:
HEexit()
{
    command clear
    echo "No worries hun! Have a good day!~"
    sleep 4
    command clear
    command exit
}

# Logging with gum fallback
info() {
    if command -v gum &>/dev/null; then
        gum style --foreground 10 "❤ $*"
    else
        echo -e "\e[32m❤ $*\e[0m"
    fi
}

warn() {
    if command -v gum &>/dev/null; then
        gum style --foreground 11 "✿  $*"
    else
        echo -e "\e[33m✿  $*\e[0m"
    fi
}

error() {
    if command -v gum &>/dev/null; then
        gum style --foreground 9 "☢ $*" >&2
    else
        echo -e "\e[31m☢ $*\e[0m" >&2
    fi
}

# UI functions
confirm() {
    if command -v gum &>/dev/null; then
        gum confirm "$1"
    else
        echo -n "$1 (y/n): "; read -r r; [[ "$r" =~ ^[Yy]$ ]]
    fi
}

spin() {
    local title="$1"; shift
    if command -v gum &>/dev/null; then
        gum spin --spinner="dot" --title="$title" -- "$@"
    else
        echo "$title"; "$@"
    fi
}

# Install gum if missing
install_gum() {
    local mgr=$(for m in pacman xbps dnf zypper apt; do command -v $m &>/dev/null && { echo ${m%%-*}; break; }; done)

    case $mgr in
        pacman) sudo pacman -S gum ;;
        dnf) sudo dnf install -y gum ;;
        zypper) sudo zypper install -y gum ;;
        xbps) sudo xbps-install -y gum ;;
        # refrence https://github.com/basecamp/omakub/issues/222
        apt)
            sudo mkdir -p /etc/apt/keyrings
            curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
            echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
            sudo apt update && sudo apt install -y gum ;;
        *) error "Sorry hun! We have no idea what package manager this is.... Soooo, we can't install gum T-T"; return 1 ;;
    esac
}

# Check and install gum
check_gum() {
    if ! command -v gum &>/dev/null; then
        warn "Gum isn't on your system, hun. It's much better when you have it!"
        if confirm "Do you wanna install gum? "; then
            install_gum && { info "Restarting with gum.... Gimme a second, hun!"; main; } || warn "Oki!~ We'll go the old fashioned way!"
        fi
    fi
}
check_gum

sleep 2

echo "Welcome to the...."

sleep 4

command clear

sleep 2


echo "                                                                  _____                                                                                                              _____                                                                 ";
echo "                                                                 ( ___ )                                                                                                            ( ___ )                                                                ";
echo "                                                                  |   |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|   |                                                                 ";
echo "                                                                  |   |                                                                                                              |   |                                                                 ";
echo "                                                                  |   |           █████   █████ █████ █████ ███████████  ███████████   ██████████   █████████     ███████            |   |                                                                 ";
echo "                                                                  |   |          ░░███   ░░███ ░░███ ░░███ ░░███░░░░░███░░███░░░░░███ ░░███░░░░░█  ███░░░░░███  ███░░░░░███          |   |                                                                 ";
echo "                                                                  |   |           ░███    ░███  ░░███ ███   ░███    ░███ ░███    ░███  ░███  █ ░  ███     ░░░  ███     ░░███         |   |                                                                 ";
echo "                                                                  |   |           ░███████████   ░░█████    ░██████████  ░██████████   ░██████   ░███         ░███      ░███         |   |                                                                 ";
echo "                                                                  |   |           ░███░░░░░███    ░░███     ░███░░░░░░   ░███░░░░░███  ░███░░█   ░███         ░███      ░███         |   |                                                                 ";
echo "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⠤⢦⠴⠤⠦⠄⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    |   |           ░███    ░███     ░███     ░███         ░███    ░███  ░███ ░   █░░███     ███░░███     ███          |   |   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⠤⢦⠴⠤⠦⠄⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ";
echo "   ⠀⠀⣀⣤⡤⢤⣄⣀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⠶⠖⣲⡴⠞⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠶⣄⡤⠤⠤⠤⣤⣀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣤⣄⣀⠀⠀    |   |           █████   █████    █████    █████        █████   █████ ██████████ ░░█████████  ░░░███████░           |   |   ⠀⠀⣀⣤⡤⢤⣄⣀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⠶⠖⣲⡴⠞⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠶⣄⡤⠤⠤⠤⣤⣀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣤⣄⣀⠀⠀   ";
echo "   ⠀⣾⠋⠀⠀⠀⠀⠁⠉⠐⠶⠶⠶⠚⠛⠉⠁⠀⠀⠼⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢝⡦⠀⠀⠀⠉⠙⠛⠓⠶⠶⠞⠛⠉⠀⠀⠀⠀⠙⢷⠀    |   |          ░░░░░   ░░░░░    ░░░░░    ░░░░░        ░░░░░   ░░░░░ ░░░░░░░░░░   ░░░░░░░░░     ░░░░░░░             |   |   ⠀⣾⠋⠀⠀⠀⠀⠁⠉⠐⠶⠶⠶⠚⠛⠉⠁⠀⠀⠼⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢝⡦⠀⠀⠀⠉⠙⠛⠓⠶⠶⠞⠛⠉⠀⠀⠀⠀⠙⢷⠀   ";
echo "   ⠸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡁    |   |                                                                                                              |   |   ⠸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡁   ";
echo "   ⠀⢿⡀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠆⠀⠀⠀⢠⣴⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⡀⠀⠀⣲⡐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠀    |   |                                                                                                              |   |   ⠀⢿⡀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠆⠀⠀⠀⢠⣴⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⡀⠀⠀⣲⡐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠀   ";
echo "   ⠀⠀⠙⢶⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡏⠀⠀⠀⠀⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠉⢷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡞⠁⠀    |   |                               ██████████      ███████    ███████████  █████████                              |   |   ⠀⠀⠙⢶⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡏⠀⠀⠀⠀⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠉⢷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡞⠁⠀   ";
echo "   ⠀⠀⠀⠀⠈⠛⠀⠀⠠⠤⣤⣤⢤⠤⠖⢻⡆⠀⠀⠀⠂⠈⠁⠀⠀⠀⠷⣇⣠⣦⣄⣴⠀⠀⠀⠈⠁⠀⠀⠀⠀⢸⡏⠉⠓⠶⠦⣤⢤⠤⠶⠖⠂⠀⠀⠀⠀⠀⠀    |   |                              ░░███░░░░███   ███░░░░░███ ░█░░░███░░░█ ███░░░░░███                             |   |   ⠀⠀⠀⠀⠈⠛⠀⠀⠠⠤⣤⣤⢤⠤⠖⢻⡆⠀⠀⠀⠂⠈⠁⠀⠀⠀⠷⣇⣠⣦⣄⣴⠀⠀⠀⠈⠁⠀⠀⠀⠀⢸⡏⠉⠓⠶⠦⣤⢤⠤⠶⠖⠂⠀⠀⠀⠀⠀⠀   ";
echo "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣤⣀⠀⠀⢀⣠⣀⡀⠀⠀⠈⠁⠀⠈⠁⠀⢀⣠⣀⡀⠀⠀⠀⣠⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    |   |                               ░███   ░░███ ███     ░░███░   ░███  ░ ░███    ░░░                              |   |   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣤⣀⠀⠀⢀⣠⣀⡀⠀⠀⠈⠁⠀⠈⠁⠀⢀⣠⣀⡀⠀⠀⠀⣠⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ";
echo "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⢻⡟⠉⠉⠙⣷⢦⣤⣤⣤⣤⣤⣾⠋⠉⠉⢻⡆⠸⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    |   |                               ░███    ░███░███      ░███    ░███    ░░█████████                              |   |   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⢻⡟⠉⠉⠙⣷⢦⣤⣤⣤⣤⣤⣾⠋⠉⠉⢻⡆⠸⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ";
echo "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⠿⠶⠶⠾⣉⢆⠛⣷⣶⡟⠭⣘⠛⡶⠶⡟⢿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    |   |                               ░███    ░███░███      ░███    ░███     ░░░░░░░░███                             |   |   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⠿⠶⠶⠾⣉⢆⠛⣷⣶⡟⠭⣘⠛⡶⠶⡟⢿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ";
echo "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⢃⡌⢣⡙⢢⠅⡎⢜⡠⢃⡜⢢⡑⠎⡔⢣⠜⣨⠻⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    |   |                               ░███    ███ ░░███     ███     ░███     ███    ░███                             |   |   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⢃⡌⢣⡙⢢⠅⡎⢜⡠⢃⡜⢢⡑⠎⡔⢣⠜⣨⠻⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ";
echo "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣿⢢⠘⡥⢌⠣⢜⡈⠦⡑⢣⡘⡔⡸⢘⠌⠦⡩⢄⢻⡷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    |   |                               ██████████   ░░░███████░      █████   ░░█████████                              |   |   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣿⢢⠘⡥⢌⠣⢜⡈⠦⡑⢣⡘⡔⡸⢘⠌⠦⡩⢄⢻⡷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ";
echo "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣦⠩⡔⢊⡱⢊⠬⡑⢬⢡⠒⡜⡰⣉⢌⡓⡘⢤⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    |   |                              ░░░░░░░░░░      ░░░░░░░       ░░░░░     ░░░░░░░░░                               |   |   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣦⠩⡔⢊⡱⢊⠬⡑⢬⢡⠒⡜⡰⣉⢌⡓⡘⢤⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ";
echo "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣷⡈⠧⡰⢉⠦⣉⠖⣨⠑⠦⡑⡔⡊⡔⣩⣾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    |   |                                                                                                              |   |   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣷⡈⠧⡰⢉⠦⣉⠖⣨⠑⠦⡑⡔⡊⡔⣩⣾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ";
echo "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢿⣶⠁⡏⡰⢆⠾⣀⠹⢆⠱⣆⢱⣸⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    |   |                                                                                                              |   |   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢿⣶⠁⡏⡰⢆⠾⣀⠹⢆⠱⣆⢱⣸⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ";
echo "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢷⣬⡑⢎⡒⢌⠲⣉⣲⣬⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    |   |                                                                                                              |   |   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢷⣬⡑⢎⡒⢌⠲⣉⣲⣬⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ";
echo "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⢶⣎⣬⡷⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    |   |  █████ ██████   █████  █████████  ███████████   █████████   █████       █████       ██████████ ███████████   |   |   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⢶⣎⣬⡷⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ";
echo "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    |   | ░░███ ░░██████ ░░███  ███░░░░░███░█░░░███░░░█  ███░░░░░███ ░░███       ░░███       ░░███░░░░░█░░███░░░░░███  |   |   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ";
echo "                                                                  |   |  ░███  ░███░███ ░███ ░███    ░░░ ░   ░███  ░  ░███    ░███  ░███        ░███        ░███  █ ░  ░███    ░███  |   |                                                                 ";
echo "                                                                  |   |  ░███  ░███░░███░███ ░░█████████     ░███     ░███████████  ░███        ░███        ░██████    ░██████████   |   |                                                                 ";
echo "                                                                  |   |  ░███  ░███ ░░██████  ░░░░░░░░███    ░███     ░███░░░░░███  ░███        ░███        ░███░░█    ░███░░░░░███  |   |                                                                 ";
echo "                                                                  |   |  ░███  ░███  ░░█████  ███    ░███    ░███     ░███    ░███  ░███      █ ░███      █ ░███ ░   █ ░███    ░███  |   |                                                                 ";
echo "                                                                  |   |  █████ █████  ░░█████░░█████████     █████    █████   █████ ███████████ ███████████ ██████████ █████   █████ |   |                                                                 ";
echo "                                                                  |   | ░░░░░ ░░░░░    ░░░░░  ░░░░░░░░░     ░░░░░    ░░░░░   ░░░░░ ░░░░░░░░░░░ ░░░░░░░░░░░ ░░░░░░░░░░ ░░░░░   ░░░░░  |   |                                                                 ";
echo "                                                                  |___|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|___|                                                                 ";
echo "                                                                 (_____)                                                                                                            (_____)                                                                ";

sleep 4

command clear

## Functions

# Install dependencies
install_HEdeps() {
    local mgr=$(for m in pacman xbps dnf zypper apt; do command -v $m &>/dev/null && { echo ${m%%-*}; break; }; done)
    info "Your package manager is: $mgr"

    case $mgr in
        pacman) sudo pacman --needed -S brightnessctl ags-hyprpanel-git hyprpaper wl-paste wl-clipboard hyprlock hypridle fish kitty rofi wlogout pipewire batsignal hyprcursor hyprsettings caffeine hyprsession hyprpolkitagent pywal matugen ;;
        xbps) sudo xbps-install -y brightnessctl ags-hyprpanel-git hyprpaper wl-paste wl-clipboard hyprlock hypridle fish kitty rofi wlogout pipewire batsignal hyprcursor hyprsettings caffeine hyprsession hyprpolkitagent pywal matugen ;;
        dnf) sudo dnf install -y brightnessctl ags-hyprpanel-git hyprpaper wl-paste wl-clipboard hyprlock hypridle fish kitty rofi wlogout pipewire batsignal hyprcursor hyprsettings caffeine hyprsession hyprpolkitagent pywal matugen ;;
        zypper) sudo zypper install -y brightnessctl ags-hyprpanel-git hyprpaper wl-paste wl-clipboard hyprlock hypridle fish kitty rofi wlogout pipewire batsignal hyprcursor hyprsettings caffeine hyprsession hyprpolkitagent pywal matugen ;;
        apt) sudo apt update && sudo apt install -y brightnessctl ags-hyprpanel-git hyprpaper wl-paste wl-clipboard hyprlock hypridle fish kitty rofi wlogout pipewire batsignal hyprcursor hyprsettings caffeine hyprsession hyprpolkitagent pywal matugen ;;
        *) error "Sorry hun, your package manager is unsupported.... T-T"; return 1 ;;
    esac
    info "All the dependencies are now installed! Next step!~"
    ins_HEdeps=true
    sleep 4
    command clear
    sleep 1
}

install_HEdots() {
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
    

    info "All the configs are fully installed! Yay~"
    ins_HEdots=true
    sleep 4
    command clear
    sleep 1
}

run_HEupd() {
    warn "We advise that you update everything before install!"
    sleep 2
    echo ""
    if confirm "Would you like to update your system first, hun?~"; then
    local mgr=$(for m in pacman xbps dnf zypper apt; do command -v $m &>/dev/null && { echo ${m%%-*}; break; }; done)

    case $mgr in
        pacman) sudo pacman -Syu ;;
        dnf) sudo dnf update ;;
        zypper) sudo zypper update ;;
        xbps) sudo xbps-install -Su ;;
        apt) sudo apt upgrade ;;
        *) error "Sorry hun! We have no idea what package manager this is...."; return 1 ;;
    esac
    updcomp=true
    updFin=true
    else
        warn "No worries, hun! Just be aware that install might be wonky.~"
        sleep 4
        command clear
        updFin=true
    fi
}

ins_HEproc() {
    if $updFin = true; then
       if $ins_HEdeps = true; then
            if $ins_HEdots = true; then
                if $updcomp = true; then
                    echo "You have some important stuff to reload!"
                    echo ""
                    if confirm "Wanna restart your system, babe?"; then
                        echo ""
                        sleep 1
                        command reboot
                    else
                        echo ""
                        echo "Just be sure to restart later, okay?~" && sleep 4 && echo "3...2..1.~ And Done!"
                        echo ""
                        sleep 2
                    fi
                info "You're all set, hun! Enjoy your new desktop!~"
                sleep 4
                command clear
                echo exit
                fi
            else
            install_HEdots
            main
            echo "Step (3/3) completed!"
            fi
        else
        install_HEdeps
        main
        echo "Step (2/3) completed!"
        fi
    else
    run_HEupd
    main
    echo "Step (1/3) completed!"
    fi
}
## Loadout

# Main

main() {
    [[ $EUID -eq 0 ]] && { error "Don't run as root! That'll break things...."; exit 1; }
    command -v git &>/dev/null || { error "git is required to use this installer, hun!"; exit 1; }
    
    clear
    while true; do
        if command -v gum &>/dev/null; then
            gum style --bold --padding "0 2" --border double --border-foreground 12 "❤ Hypreco Dots Installer ❤"
        else
            echo -e "\e[36m❤ Hypreco Dots Installer ❤\e[0m"
        fi
    sleep 4
    ins_HEproc
    done
}

main "$@"
