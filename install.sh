#!/usr/bin/env bash

INSTALL_PATH=$HOME/.neovim-config

nvim_warning() {
	printf "Oops! Install neovim and try again\n"
	exit
}

git_warning() {
	printf "Oops! Install git and try again\n"
	exit
}

stow_warning() {
	printf "Oops! Install stow and try again\n"
	exit
}

stow_error() {
	printf "Error! Couldn't create stow link... :(\n"
	exit
}

rename_dir() {
	mv $HOME/.config/nvim $HOME/.config/nvim.old
	printf "Your neovig config has been transfered to ~/.config/nvim.old\n"
	clone
}

clone() {
	printf "Cloning repository...\n"
	git clone https://github.com/whleucka/neovim-config "$INSTALL_PATH"
}

stow() {
	printf "Stowing nvim...\n"
	cd "$INSTALL_PATH"
	stow nvim/
}

install_packer() {
	printf "Installing packer...\n"
	git clone --depth 1 https://github.com/wbthomason/packer.nvim "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
}

which nvim >/dev/null && (printf "Neovim is installed\n" && sleep 1) || nvim_warning
which git >/dev/null && (printf "Git is installed\n" && sleep 1) || git_warning
which stow >/dev/null && (printf "Stow is installed\n" && sleep 1) || stow_warning

[ -d "$HOME/.config/nvim" ] && rename_dir || clone
[ ! -d "$HOME/.local/share/nvim/site/pack/packer" ] && install_packer
[ -d "$INSTALL_PATH" ] && stow || stow_error

printf "Installing plugins...\n" && sleep 1
$(which nvim) --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

printf "You have successfully installed neovim-config, have a great day!\n"
