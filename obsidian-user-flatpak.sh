#!/bin/sh
set -x
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install --user flathub
flatpak install --user flathub md.obsidian.Obsidian
nohup flatpak run --user md.obsidian.Obsidian > ~/.flatpak-obsidian.log 2>&1 &
