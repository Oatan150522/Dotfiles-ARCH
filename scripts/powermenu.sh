#!/bin/bash

THEME="$HOME/.config/rofi/themes/powermenu.rasi"

menu() {
  echo -en "Shutdown\0icon\x1fsystem-shutdown-symbolic\n"
  echo -en "Reboot\0icon\x1fsystem-reboot-symbolic\n"
  echo -en "Logout\0icon\x1fsystem-log-out-symbolic\n"
  echo -en "Suspend\0icon\x1fsystem-suspend-symbolic\n"
  echo -en "Lock\0icon\x1fsystem-lock-screen-symbolic\n"
}

choice=$(menu | rofi -dmenu -p "" -theme "$THEME")

case "$choice" in
  Shutdown) systemctl poweroff ;;
  Reboot) systemctl reboot ;;
  Logout) hyprctl dispatch exit ;;
  Suspend) systemctl suspend ;;
  Lock) hyprlock ;;
esac
