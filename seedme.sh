#!/usr/bin/env bash

GHREPOS="$HOME/Repos/github.com/$USER"

mkdir -p "$GHREPOS"
cd "$GHREPOS"
git clone https://github.com/rrobrms/dotfiles.git
chmod +x "$GHREPOS"/bootstrap.sh
chmod +x "$GHREPOS"/.local/scripts/*
