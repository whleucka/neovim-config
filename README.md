# My neovim config
<img src="https://media.tenor.com/ETW2DDjY6z0AAAAd/spared-no-expense-jurassic-park.gif" alt='spared no expense'>

### Install
```
curl -s https://raw.githubusercontent.com/whleucka/neovim-config/main/install.sh -H "Cache-Control: no-cache, no-store" | bash -s
```

### Uninstall
If you have stow installed on your machine:
```
cd ~/.neovim-config && stow -D nvim
```
or, just unlink:
```
unlink $HOME/.config/nvim
```

If you replaced an existing Neovim config, then you can restore it:
```
mv $HOME/.config/nvim.old $HOME/.config/nvim
```
