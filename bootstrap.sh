# !/usr/bin/env bash

DOTFILES=/home/$USER/Repos/github.com/$USER/dotfiles
chmod +x $DOTFILES/.local/scripts/*
# chmod +x $HOME/.local/scripts_private/*

declare -a links=(
    ".bashrc $HOME/.bashrc"
    ".profile $HOME/.profile"
    ".inputrc $HOME/.inputrc"
    ".dircolors $HOME/.dircolors"
    ".tmux.conf $HOME/.tmux.conf"
    ".vim/vim.vim $HOME/.vimrc"
    ".vim $HOME"
    ".config/alacritty $HOME/.config"
    ".config/lynx $HOME/.config"
    ".config/kitty $HOME/.config"
    # ".config/nvim $HOME/.config"
)

for link in "${links[@]}"; do
    IFS=' ' read -r source target <<<"$link"
    if [ -e "$target" ]; then
        mv "$target" "$target.bak"
    fi
    ln -nsvf "$DOTFILES/$source" "$target"
done

touch ~/.env.example
chmod 700 ~/.env.example
source $HOME/.bashrc
