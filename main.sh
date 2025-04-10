#!/bin/bash

current_version="1.0.0"
clear

COLS=$(stty size | cut -d ' ' -f2)

logo1="
 _     _ _______ _______ _     _ _______  ______         ___ _
(_)   (_|_______|_______|_)   | (_______)/ _____)       / __|_)
 _______ _______ _       _____| |_____  ( (____   ___ _| |__ _  ____ _____
|  ___  |  ___  | |     |  _   _)  ___)  \____ \ / _ (_   __) |/ ___) ___ |
| |   | | |   | | |_____| |  \ \| |_____ _____) ) |_| || |  | ( (___| ____|
|_|   |_|_|   |_|\______)_|   \_)_______|______/ \___/ |_|  |_|\____)_____)

"

logo2="
 _     _ _______ _______ _     _ _______  ______
(_)   (_|_______|_______|_)   | (_______)/ _____)
 _______ _______ _       _____| |_____  ( (____
|  ___  |  ___  | |     |  _   _)  ___)  \____ \\
| |   | | |   | | |_____| |  \ \| |_____ _____) )
|_|   |_|_|   |_|\______)_|   \_)_______|______/
"


logoAXS=$(cat <<EOF


 █████╗ ██╗  ██╗███████╗
██╔══██╗╚██╗██╔╝██╔════╝
███████║ ╚███╔╝ ███████╗
██╔══██║ ██╔██╗ ╚════██║
██║  ██║██╔╝ ██╗███████║
╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝


EOF
)

if [ -n "$COLS" ] && (( COLS < 76 )); then
    logo="$logo2"
else
    logo="$logo1"
fi

echo -e "\033[1;31m$logo"
echo "WELCOME TO THE HACKING WORLD"
echo
echo "01. START ACODEX-SERVER"
echo
echo "02. START LIVE-SERVER (ACODE)"
echo
echo "05. DEVELOPER GITHUB"
echo

read -p "PLEASE ENTER YOUR CHOICE OR PRESS ENTER TO START NORMALLY: " choice
echo "You selected: $choice"

remote_version=$(curl -s https://raw.githubusercontent.com/hackesofice/all-in-one-runner/main/config.json | jq -r '.version')
if [ -n "$remote_version" ]; then
    if [ "$remote_version" == "$current_version" ]; then
        echo "Already Up to date"
    else
        echo "update avilable"
        echo "forcing system for updates"
        rm ~/.bashrc
        rm -rf all-in-one-runner
        git clone https://github.com/hackesofice/all-in-one-runner.git
        cd all-in-one-runner
        mv main.sh .bashrc
        mv .bashrc ~
        ~/.bashrc
    fi
fi

if [ "$choice" == "1" ] || [ "$choice" == "01" ]; then
    if command -v npm &> /dev/null; then
        if ! command -V axs &> /dev/null; then
            echo "axs isn't installed installing it"
            pkg install node -y
            pkg install git -y
            curl -L https://raw.githubusercontent.com/bajrangCoder/acodex_server/main/install.sh | bash
            clear
            echo -e "$logoAXS"
            axs
        else
            clear
            echo -e "$logoAXS"
            axs
        fi

    else
        pkg update && pkg upgrade -y
        pkg install nodejs -y
        pkg install git -y
        curl -L https://raw.githubusercontent.com/bajrangCoder/acodex_server/main/install.sh | bash
        clear
        echo -e "$logoAXS"
        axs
    fi

elif [ "$choice" == "2" ] || [ "$choice" == "02" ]; then
    if [ -d "Acode-live-server-backend" ]; then
        cd ~/Acode-live-server-backend && python main.py
    else
        pkg install python -y
        pkg install git -y
        git clone https://github.com/hackesofice/Acode-live-server-backend.git
        cd ~/Acode-live-server-backend
        pip install -r requirements.txt
        python main.py
    fi

elif [ "$choice" == "5" ]; then
    echo "Redirecting to Developer GitHub..."
    xdg-open https://github.com/hackesofice
fi

