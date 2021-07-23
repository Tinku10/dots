#! /usr/bin/bash

# comment out the ones if not required installation
# declare -A installs=(

#   [alacritty] = ""

#   [emacs]  = ""

#   [fish] =  ""

#   [i3] = ""

#   [kitty] = ""
  
#   [lazygit] = ""

#   [nvim] = ""

#   [polybar] = ""

#   [shell] = ""

#   [vim] = ""

#   [vscode] = ""
# )

# add or remove folders which do not need stow
folders=(
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

# install each software in the installs array
# for intallation in ${installs[@]}; do
#   for line in ${installation[@]}; do
#     $line
# done

# stow each of the folder in folders
for folder in ${folders[@]}; do
  stow folder
done


