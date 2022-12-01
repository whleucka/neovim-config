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

rename_dir() {
	mv $HOME/.config/nvim $HOME/.config/nvim.old
	printf "Your neovig config has been transfered to ~/.config/nvim.old\n"
	clone
}

clone() {
	printf "Cloning repository...\n"
	git clone https://github.com/whleucka/neovim-config "$INSTALL_PATH"
}

symlink() {
	printf "Creating symlink...\n"
	ln -s "$INSTALL_PATH/nvim/.config/nvim" "$HOME/.config"
}

install_packer() {
	printf "Installing packer...\n"
	git clone --depth 1 https://github.com/wbthomason/packer.nvim "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
}

# Make sure deps exists
which nvim >/dev/null && (printf "Neovim is installed\n" && sleep 1) || nvim_warning
which git >/dev/null && (printf "Git is installed\n" && sleep 1) || git_warning

# Check paths + hooks
[ -d "$HOME/.config/nvim" ] && rename_dir || clone
[ ! -d "$HOME/.local/share/nvim/site/pack/packer" ] && install_packer
[ -d "$INSTALL_PATH" ] && symlink

# Packer
printf "Installing plugins...\n" && sleep 1
$(which nvim) --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

printf "\n\nYou have successfully installed neovim-config, have a great day!\n"
cd -
