#!/bin/bash

GNOME_CONFIG_PATH="$BASH_CONFIG/gnome_setting"

# if [ -f $GNOME_CONFIG_PATH/wallpaper ]; then
#     . "$GNOME_CONFIG_PATH/wallpaper" 
# else
#     echo "$WALLPAPER_PATH/wallpaper is missing"
# fi

# <Primary> → Ctrl
#
# <Shift> → Shift
#
# <Alt> → Alt
#
# <Super> → Windows (Meta) key
#
# <Hyper> → Rarely used, can be mapped separately
#
# <Mode>
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom1/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom0/ name 'navigate to terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom0/ command 'wmctrl -a workspace'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom0/ binding "<Super>n"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom1/ name 'navigate to Firefox'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom1/ command 'wmctrl -a Firefox'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom1/ binding "<Super>f"

