#!/bin/bash

mkdir -p "$HOME/.local/share/icons/hicolor/scalable/apps/"
mkdir -p "$HOME/.local/share/applications/"
mkdir -p "$HOME/bin/"

cp bin/dsview-onDocker.sh "$HOME/bin/"
cp bin/dsview-onDocker.svg "$HOME/.local/share/icons/hicolor/scalable/apps/"
cp bin/dsview-onDocker.desktop "$HOME/.local/share/applications/"

"$HOME/bin/dsview-onDocker.sh" echo "DSView on Docker installed."

echo "Make sure that $HOME/bin is in your PATH at .bashrc or similar."
echo "Application icon may require to logout to show up properly."

