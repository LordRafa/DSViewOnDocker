#!/bin/bash

rm -r "$HOME/bin/dsview-onDocker.sh"
rm -r "$HOME/.local/share/icons/hicolor/scalable/apps/dsview-onDocker.svg"
rm -r "$HOME/.local/share/applications/dsview-onDocker.desktop"
rm -r "$HOME/.onDocker/dsview"
sudo rm -f "/etc/udev/rules.d/52-DreamSourceLab.rules"
sudo rm -f "/usr/local/bin/dsview-onDocker-udev.sh"

docker image rm lordrafa/dsview

