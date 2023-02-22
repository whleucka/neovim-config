#!/usr/bin/env bash
# Installs neovim config

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
	mv "$HOME/.config/nvim" "$HOME/.config/nvim.old"
	printf "Your neovig config has been transfered to ~/.config/nvim.old\n"
	clone
}

clone() {
	if [ ! -d "$INSTALL_PATH" ]; then
		printf "Cloning repository...\n"
		git clone https://github.com/whleucka/neovim-config "$INSTALL_PATH"
	else
		printf "Respository already exists...\n"
	fi
}

symlink() {
	printf "Creating symlink...\n"
	(which stow >/dev/null && cd $INSTALL_PATH && stow nvim && sleep 1) || ln -s "$INSTALL_PATH/nvim/.config/nvim" "$HOME/.config"
}

# Make sure deps exists
(which nvim >/dev/null && (printf "Neovim is installed\n" && sleep 1)) || nvim_warning
(which git >/dev/null && (printf "Git is installed\n" && sleep 1)) || git_warning

# Check paths + hooks
([ -d "$HOME/.config/nvim" ] && rename_dir) || clone
[ -d "$INSTALL_PATH" ] && symlink

# Lazy
printf "Installing plugins...\n" && sleep 1
$(which nvim) --headless "+Lazy! sync" +qa

printf "\n\nYou have successfully installed neovim-config, have a great day!\n"
