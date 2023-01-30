# DOTFILES

> Bash first on Linux and Mac

**WARNING I'M DUMB WARNING**

> Tips: 
- work best with bash and not zsh
- `pull` the dotfiles repo inside `/home/<user>/Repos/github.com/<gh-user>/dotfiles`

> Then yu cann aply:
```sh
chmod +x $DOTFILES/.local/scripts/*
rm ~/.bashrc
rm ~/.profile
ln -sv $DOTFILES/.bashrc $HOME/.bashrc
ln -sv $DOTFILES/.profile $HOME/.profile
ln -sv $DOTFILES/.inputrc $HOME/.inputrc
ln -sv $DOTFILES/.dircolors $HOME/.dircolors
ln -sv $DOTFILES/.vim/vim.vim $HOME/.vimrc
ln -sv $DOTFILES/.tmux.conf $HOME/.tmux.conf
ln -nsvf $DOTFILES/.vim $HOME
ln -nsvf $DOTFILES/.config/alacritty $HOME/.config
ln -nsvf $DOTFILES/.config/lynx $HOME/.config
ln -nsvf $DOTFILES/.config/kitty $HOME/.config
ln -nsvf $DOTFILES/shared/nvim $HOME/.config
```