#!/bin/bash
#tool
sudo apt update && apt upgrade -y
sudo apt install -y \
     neovim \
     usbmuxd \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

# setup nvim
cd .config && git clone https://github.com/David1230/nvim.git
mkdir -p nvim/undodir  nvim/plugged
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#docker-ce daemon
# Get the Docker signing key for packages
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -

# Add the Docker official repos
echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
     $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list
    
# Install Docker
sudo apt update
sudo apt install -y --no-install-recommends \
    docker-ce \
    cgroupfs-mount
