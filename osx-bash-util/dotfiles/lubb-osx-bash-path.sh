#!/bin/bash

# Lubb's Bash Path
# Updates .bash_profile PATH to use coreutils

echo export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH" >> ~/.bash_profile

echo export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH" >> ~/.bash_profile

print "COMPLETE, Restart Terminal and then run command man ls to verify path correctly set."