#!/bin/bash

mkdir -p "$HOME/.local/share/icons/hicolor/scalable/apps/"
mkdir -p "$HOME/.local/share/applications/"
mkdir -p "$HOME/bin/"

cp bin/dsview-onDocker.sh "$HOME/bin/"
cp bin/dsview-onDocker.svg "$HOME/.local/share/icons/hicolor/scalable/apps/"
cp bin/dsview-onDocker.desktop "$HOME/.local/share/applications/"
echo "Root access must be granted in order to install udev rules and scripts to allow usb access"
sudo cp bin/52-DreamSourceLab.rules /etc/udev/rules.d/
sudo cp bin/dsview-onDocker-udev.sh /usr/local/bin/

"$HOME/bin/dsview-onDocker.sh" echo "DSView on Docker installed."

echo "Make sure that $HOME/bin is in your PATH at .bashrc or similar."
echo "Application icon may require to logout to show up properly."

