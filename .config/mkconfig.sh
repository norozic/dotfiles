#!/usr/bin/env bash

CONFIG=~/.config/i3/config
[ -e "$CONFIG" ] && rm -f $CONFIG
cat $CONFIG.*  >> $CONFIG
chmod 444 $CONFIG

CONFIG=~/.config/sway/config
[ -e "$CONFIG" ] && rm -f $CONFIG
cat $CONFIG.*  >> $CONFIG
chmod 444 $CONFIG

CONFIG=~/.config/i3status-rust/config.toml
[ -e "$CONFIG" ] && rm -f $CONFIG
if [ -e /sys/class/power_supply/BAT0 ]; then
  cat $HOME/.config/i3status-rust/config.mobile.toml > $CONFIG
else
  cat $HOME/.config/i3status-rust/config.desktop.toml > $CONFIG
fi
chmod 444 $CONFIG
