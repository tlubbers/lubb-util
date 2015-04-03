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
  google-chrome
  appcleaner
  firefox
  spotify
  vagrant
  iterm2
  sublime-text3
  virtualbox
  mailbox
  vlc
  transmission
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}


# fonts
fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
  font-lobster
  font-lobster-two
  font-league-gothic
  font-open-sans
  font-open-sans-condensed
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}