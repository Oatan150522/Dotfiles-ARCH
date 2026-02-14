#!/bin/bash

echo "🚀 Restaurando dotfiles..."

# Crear carpetas necesarias
mkdir -p ~/.config

echo "📂 Copiando configuraciones..."
cp -r hypr ~/.config/
cp -r kitty ~/.config/
cp -r rofi ~/.config/
cp -r waybar ~/.config/
cp -r scripts ~/.config/

echo "⚡ Permisos para scripts..."
chmod +x ~/.config/scripts/*.sh

echo "🐚 Restaurando Zsh config..."
cp .zshrc ~/
cp .p10k.zsh ~/

echo "🐚 Instalando Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "🎨 Instalando Powerlevel10k..."
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    $HOME/.oh-my-zsh/custom/themes/powerlevel10k
fi

echo "✅ Listo parcero, setup restaurado completo 😎🔥"
