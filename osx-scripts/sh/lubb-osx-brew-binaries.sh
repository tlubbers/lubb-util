#!/bin/bash

# Lubb's Brew Binaries
# Installs Essential Binaries

binaries=(
  git
  bash
  bash-completion2
  ffmpeg
  sshfs
  smlnj
  python
)

echo "installing binaries..."
brew install ${binaries[@]}

brew cleanup