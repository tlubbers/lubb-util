#!/bin/bash

# Lubbs Cask Binaries
# Installs Cask and some essential Binaries and Fonts

# Get sudo auth
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

brew install caskroom/cask/brew-cask

brew tap caskroom/versions

brew tap caskroom/fonts

# Apps
apps=(
  dropbox
  google-drive
  google-chrome
  firefox
  spotify
  iterm2
  sublime-text3
  mailbox
  vlc
  evernote
  flash
  github
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}


# fonts
fonts=(
  font-m-plus
  font-roboto
  font-lobster
  font-lobster-two
  font-league-gothic
  font-open-sans
  font-open-sans-condensed
  font-source-code-pro
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}