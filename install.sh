#!/bin/bash

echo "📦 Instalando paquetes oficiales..."
sudo pacman -Syu --noconfirm
sudo pacman -S --needed - < pkglist.txt

echo "📦 Instalando paquetes AUR..."
yay -S --needed - < aur-pkglist.txt

echo "🎨 Restaurando configuraciones..."
./restore.sh

echo "🔥 Todo listo, reinicia Hyprland y a disfrutar."
