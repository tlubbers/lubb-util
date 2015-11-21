#!/bin/bash

# Lubb's Brew Binaries
# Installs Essential Binaries

binaries=(
  git
  bash
  bash-completion2
  sshfs
  wget
  mackup
  smlnj
  python
  rust
  jenv
)

echo "installing binaries..."
brew install ${binaries[@]}

brew cleanup