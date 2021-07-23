#! /usr/bin/bash

# add or remove folders which do not need to be removed 
folders = (
  "alacritty" 
  "emacs" 
  "fish" 
  "i3" 
  "kitty" 
  "lazygit" 
  "nvim" 
  "polybar" 
  "shell" 
  "vim" 
  "vscode"
)

# unstow each of the folder in folders
for folder in ${folders[@]}; do
  stow -D folder
done

