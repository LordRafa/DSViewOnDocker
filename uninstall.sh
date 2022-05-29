#!/bin/bash

rm -r "$HOME/bin/dsview-onDocker.sh"
rm -r "$HOME/.local/share/icons/hicolor/scalable/apps/dsview-onDocker.svg"
rm -r "$HOME/.local/share/applications/dsview-onDocker.desktop"
rm -r "$HOME/.onDocker/dsview"

docker image rm lordrafa/dsview

