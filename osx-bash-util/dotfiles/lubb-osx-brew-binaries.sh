#!/bin/bash

# Lubb's Brew Binaries
# Installs Essential Binaries 

binaries=(
  ffmpeg
  python
  sshfs
  git
)

echo "installing binaries..."
brew install ${binaries[@]}

brew cleanup