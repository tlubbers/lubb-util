#!/bin/bash

# Lubb's Show or Hide Hidden Files

STATUS=`defaults read com.apple.finder AppleShowAllFiles` 
if [ $STATUS == TRUE ]; 
then defaults write com.apple.finder AppleShowAllFiles FALSE 
else defaults write com.apple.finder AppleShowAllFiles TRUE 
fi 
killall Finder 