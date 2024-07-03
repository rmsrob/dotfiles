# DOTFILES

## Dots for Linux and Mac

> **Warning** **from chatGPT**
>
> *It is always recommended to read and fully understand any script before executing it on your machine, as it can have unintended consequences or security implications. It's also a good practice to ensure that you trust the source of the script and have taken any necessary precautions to protect your system.*

> **Note**
> Copie the dotfiles repo inside `/home/$USER/Repos/github.com/<gh-user>/dotfiles` work best if your `$USER` is the same a your github username.

## Load

```bash
cd /home/$USER/Repos/github.com/$USER/dotfiles
chmod +x $DOTFILES/.local/scripts/*

ln -nsvf $DOTFILES/.profile $HOME/.profile
ln -nsvf $DOTFILES/.inputrc $HOME/.inputrc
ln -nsvf $DOTFILES/.dircolors $HOME/.dircolors
ln -nsvf $DOTFILES/.tmux.conf $HOME/.tmux.conf
ln -nsvf $DOTFILES/.vim/vim.vim $HOME/.vimrc
ln -nsvf $DOTFILES/.vim $HOME
ln -nsvf $DOTFILES/.config/alacritty $HOME/.config
ln -nsvf $DOTFILES/.config/lynx $HOME/.config
ln -nsvf $DOTFILES/.config/nvim $HOME/.config
source $HOME/.bashrc
```
