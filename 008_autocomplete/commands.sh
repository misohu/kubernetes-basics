#!/bin/bash

# Install bash completition
sudo apt install bash-completion

# Add it to your bashrc 
echo "source <(kubectl completion bash)" >> ~/.bashrc

# You can run the same thing for zsh
source <(kubectl completion zsh)

# You can now hit tab while writing kubectl code and it will autocomplete 

# VSCODE setup
# Install VSCode: https://code.visualstudio.com/download
# Install kubernetes addon 
