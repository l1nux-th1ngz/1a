#!/bin/bash

# Function to check if the OS is Debian, Linux Mint, or Ubuntu
check_os() {
    if grep -q -E 'Debian|Ubuntu|Mint' "/etc/os-release"; then
        return 0
    else
        return 1
    fi
}

# If the OS is Debian, Linux Mint, or Ubuntu, install the necessary packages
if check_os; then
    sudo apt-get update
    sudo apt-get install -y rofi synaptic firefox-esr geany geany-plugins vlc mpv stacer nm-applet network-manager \
    nm-connection-editor kitty terminator tilix easyssh alacritty mpd polybar spotify-client i2pd \
    gstreamer0.10-ffmpeg gstreamer0.10-fluendo-mp3 gstreamer0.10-pitfdll gstreamer0.10-plugins-bad \
    gstreamer0.10-plugins-ugly gstreamer0.10-plugins-bad-multiverse gstreamer0.10-plugins-ugly-multiverse \
    icedtea6-plugin libavcodec-extra-52 libmp4v2-0 ttf-mscorefonts-installer unrar zip unzip p7zip

    sudo reboot
else
    echo "This script is intended for Debian, Linux Mint, or Ubuntu."
fi
