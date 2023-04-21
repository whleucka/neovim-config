# My neovim dotfiles
![image](https://user-images.githubusercontent.com/71740767/233647041-d9168187-efe0-4f46-8856-8c6436ab0a2e.png)


<img src="https://media.tenor.com/ETW2DDjY6z0AAAAd/spared-no-expense-jurassic-park.gif" alt='spared no expense'>

### Install
```
curl -s https://raw.githubusercontent.com/whleucka/neovim-config/main/install.sh -H "Cache-Control: no-cache, no-store" | bash -s
```

### Uninstall
If you have stow installed on your machine:
```
cd $HOME/.neovim-config && stow -D nvim
```
or, just unlink:
```
unlink $HOME/.config/nvim
```

If you replaced an existing Neovim config, then you can restore it:
```
mv $HOME/.config/nvim.old $HOME/.config/nvim
```
