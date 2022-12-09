# DOTFILES

> Bash first on Linux and Mac

`WARNING I'M DUMB WARNING`

> Tips: 
- work best with bash and not zsh
- `pull` the dotfiles repo inside `/home/<user>/Repos/github.com/<gh-user>/dotfiles`
- then do this:

```sh
chmod +x $DOTFILES/scripts/*
rm ~/.bashrc
rm ~/.profile
ln -sv $DOTFILES/.bashrc ~/.bashrc
ln -sv $DOTFILES/.profile ~/.profile
ln -sv $DOTFILES/.inputrc ~/.inputrc
ln -sv $DOTFILES/.dircolors ~/.dircolors
ln -sv $DOTFILES/shared/tmux/.tmux.conf ~/.tmux.conf
```