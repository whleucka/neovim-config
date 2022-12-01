#!/usr/bin/env bash

nvim_warning() {
    printf "Oops! Install neovim and try again\n"
    exit
}

git_warning() {
    echo "Oops! Install git and try again\n"
    exit
}

stow_warning() {
    echo "Oops! Install stow and try again\n"
    exit
}

stow_error() {
    echo "Error! Couldn't create stow link... :(\n"
    exit
}

rename_dir() {
    mv $HOME/.config/nvim $HOME/.config/nvim.old
    echo "Your neovig config has been transfered to ~/.config/nvim.old"
    clone
}

clone() {
    echo "Cloning repository..."
    git clone https://github.com/whleucka/neovim-config ~/neovim-config
}

stow() {
    echo "Stowing nvim..."
    stow ~/neovim-config/nvim
    nvim +PackerSync
}

which nvim >/dev/null && echo "Neovim is installed" || nvim_warning
which git >/dev/null && echo "Git is installed" || git_warning
which stow >/dev/null && echo "Stow is installed" || stow_warning

[ -d "$HOME/.config/nvim" ] && rename_dir || clone
[ -d "$HOME/neovim-config" ] && stow || stow_error

printf "You have successfully installed neovim-config, have a great day!\n"
