#!/bin/bash

WALL_DIR="$HOME/Pictures/Walpapers"
THEME="$HOME/.config/rofi/themes/wallpapers.rasi"

selected=$(for wall in "$WALL_DIR"/*.{png,jpg,jpeg,webp}; do
    [ -f "$wall" ] && echo -en "$(basename "$wall")\0icon\x1f$wall\n"
done | rofi -dmenu -p "Wallpaper" -theme "$THEME")

[ -z "$selected" ] && exit 0

WALL="$WALL_DIR/$selected"

# Wallpaper instantáneo
swww img "$WALL" --transition-type any --transition-duration 1

# Notificación instantánea
notify-send "Wallpaper changed" "$selected"

# Wal + apps rápido en background
(
    wal -i "$WALL" -n
    kitty @ set-colors -a ~/.cache/wal/colors-kitty.conf 2>/dev/null
    pkill -SIGUSR2 waybar
    pkill rofi 2>/dev/null
) &

# Firefox SOLO si está abierto + sin bloquear
if pgrep firefox >/dev/null; then
    pywalfox update >/dev/null 2>&1 &
fi
