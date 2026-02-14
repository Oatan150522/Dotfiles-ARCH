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

echo "✅ Listo parcero, setup restaurado 😎"
