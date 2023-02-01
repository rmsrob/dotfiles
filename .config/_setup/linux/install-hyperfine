#!/bin/sh

loc=$(curl -o /dev/null -sIw "%{redirect_url}" 'https://github.com/sharkdp/hyperfine/releases/latest')
vers=${loc##*/}
version=${vers#v}
deb=hyperfine_"$version"_amd64.deb
echo "$deb"

uri=${loc%/tag*}/download/$vers/$deb
echo "Downloading $uri"
curl -sL "$uri" -o "/tmp/$deb"

echo "Installing /tmp/$deb"
sudo dpkg -i "/tmp/$deb"
sudo rm -rf /tmp/*
