#!/bin/sh

COLOR_RED="\e[0;31m"
COLOR_GREEN="\e[0;32m"
COLOR_YELLOW="\e[0;33m"
COLOR_RESET="\e[0m"

print_info () {
    echo -e "[INFO] $1"
}

print_warn () {
    echo -e "[${COLOR_YELLOW}WARNING${COLOR_RESET}] $1"
}

print_success () {
    echo -e "[$COLOR_GREEN$COLOR_RESET] $1"
}

print_failure () {
    echo -e "[$COLOR_RED$COLOR_RESET] $1"
}

FAILED_SEGMENTS=""

# ARGS:
#  1: return value of the command
#  2: msg to print
check_print_success() {
    if [[ $? == 0 ]]; then
        print_success "$2"
    else
        print_failure "$2"
        FAILED_SEGMENTS+="$2, "
    fi
}

print_info "Starting.."

# OS specific operations (installing packages etc.)
OSNAME=$(head -n 1 /etc/os-release | cut -d "\"" -f 2)

SOFTINST=""
while ! [[ "$SOFTINST" =~ ^(full|mini|none)$ ]]; do
    echo "Auto install software [full/mini/none]"
    read SOFTINST
done

PKG_LIST=""
if [[ "$SOFTINST" != "none" ]]; then
    case $OSNAME in
        "Arch Linux")
            case $SOFTINST in 
                "mini")
                    PKG_LIST="base-devel git wget stow zsh xorg xclip maim dunst feh"
                    ;;
                "full")
                    PKG_LIST="base-devel git wget stow zsh xorg xclip maim dunst feh \
                              firefox sxiv zathura zathura-pdf-poppler pcmanfm"
            esac

            sudo pacman -S --needed $PKG_LIST
            ;;
        *)
    esac
fi

# The last command in the above case-switch should be the package manger, since we are using
# the return value to determine if software installation succeeded.
check_print_success $? "software installation"

dwm_desktop_entry="
[Desktop Entry]\n\
Encoding=UTF-8\n\
Name=dwm\n\
Comment=Dynamic window manager\n\
Exec=/home/$USER/.scripts/execdwm.sh\n\
Icon=dwm\n\
Type=XSession"
sudo mkdir -p /usr/share/xsessions
echo -e $dwm_desktop_entry | sudo tee /usr/share/xsessions/dwm.desktop
check_print_success $? "create dwm.desktop"

cd .suckless/dwm; sudo make install
check_print_success $? "install dwm"
cd .suckless/st; sudo make install
check_print_success $? "install st"
cd .suckless/dmenu; sudo make install
check_print_success $? "install dmenu"

mkdir -p /home/$USER/.config
mkdir -p /home/$USER/.scripts

stow .
check_print_success $? "stow"

print_info "Installation finished!"
if ! [[ -z ${#FAILED_SEGMENTS} ]]; then
    FAILED_SEGMENTS=${FAILED_SEGMENTS%,*}
    print_warn "FAILED segments:$COLOR_RED $FAILED_SEGMENTS"
fi
