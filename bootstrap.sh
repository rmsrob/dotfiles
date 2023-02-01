# !/usr/bin/env bash
cp ~/.bashrc{,.bak} ~/.profile{,.bak}

DOTFILES=/home/$USER/Repos/github.com/$USER/dotfiles
chmod +x $DOTFILES/.local/scripts/*
# chmod +x $HOME/.local/scripts_private/*

ln -sf $DOTFILES/.bashrc $HOME/.bashrc
ln -sf $DOTFILES/.profile $HOME/.profile
ln -sf $DOTFILES/.inputrc $HOME/.inputrc
ln -sf $DOTFILES/.dircolors $HOME/.dircolors
ln -sf $DOTFILES/.tmux.conf $HOME/.tmux.conf
ln -sf $DOTFILES/.vim/vim.vim $HOME/.vimrc
ln -nsvf $DOTFILES/.vim $HOME
ln -nsvf $DOTFILES/.config/alacritty $HOME/.config
ln -nsvf $DOTFILES/.config/lynx $HOME/.config
ln -nsvf $DOTFILES/.config/kitty $HOME/.config
ln -nsvf $DOTFILES/shared/nvim $HOME/.config

touch ~/.env.example
chmod 700 ~/.env.example
source $HOME/.bashrc
