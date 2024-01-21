#!/bin/bash

# Function to check if the OS is Debian, Linux Mint, or Ubuntu
check_os() {
    if grep -q -E 'Debian|Ubuntu|Mint' "/etc/os-release"; then
        return 0
    else
        return 1
    fi
}

# If the OS is Debian, Linux Mint, or Ubuntu, perform the necessary operations
if check_os; then
    # Download the file
    curl https://go.dev/dl/go1.21.6.linux-amd64.tar.gz || wget https://go.dev/dl/go1.21.6.linux-amd64.tar.gz

    # Extract the file
    sudo tar -C /usr/local -xzf go1.21.6.linux-amd64.tar.gz

    # Add the necessary line to .profile
    echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile

    # Update .profile
    source ~/.profile

    # Clone and install Hypr
    git clone https://github.com/vaxerski/Hypr
    cd Hypr
    make clear && make release

    # Move into /usr/bin and add a desktop session
    sudo cp ./build/Hypr /usr/bin
    sudo cp ./example/hypr.desktop /usr/share/xsessions

    echo "2.sh is complete continuing to 3.sh"
    # auto continue to 3.sh
    bash 3.sh
else
    echo "This script is intended for Debian, Linux Mint, or Ubuntu."
fi
