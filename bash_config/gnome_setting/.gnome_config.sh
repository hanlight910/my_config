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
# <Alt> → Alt #
# <Super> → Windows (Meta) key
#
# <Hyper> → Rarely used, can be mapped separately
#
# <Mode>
second_firefox="wmctrl -l | grep Firefox | tail -n 1 | awk \"{print \$1}\" | xargs -I {} wmctrl -ia {})"

gsettings set org.gnome.settings-daemon\
.plugins.media-keys custom-keybindings \
"['/org/gnome/settings-daemon/plugins/media-keys/custom0/'
,'/org/gnome/settings-daemon/plugins/media-keys/custom1/',
'/org/gnome/settings-daemon/plugins/media-keys/custom2/',
'/org/gnome/settings-daemon/plugins/media-keys/custom3/',
'/org/gnome/settings-daemon/plugins/media-keys/custom4/',
'/org/gnome/settings-daemon/plugins/media-keys/custom5/',
'/org/gnome/settings-daemon/plugins/media-keys/custom6/',
'/org/gnome/settings-daemon/plugins/media-keys/custom7/',
'/org/gnome/settings-daemon/plugins/media-keys/custom8/',
'/org/gnome/settings-daemon/plugins/media-keys/custom9/',
'/org/gnome/settings-daemon/plugins/media-keys/custom10/',
'/org/gnome/settings-daemon/plugins/media-keys/custom11/',
'/org/gnome/settings-daemon/plugins/media-keys/custom12/'
]"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom0/ name 'navigate to terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom0/ command 'wmctrl -a workspace'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom0/ binding "<Super>k"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom3/ name 'navigate to sub'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom3/ command 'wmctrl -a sub'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom3/ binding "<Super>i"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom1/ name 'navigate to Firefox'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom1/ command 'wmctrl -a Firefox'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom1/ binding "<Super>j"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom4/ name 'navigate to Firefox'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom4/ command "$BASH_CONFIG/scripts/focusSecondFirefox.sh"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom4/ binding "<Super>u"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom2/ name 'navigate to pdf'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom2/ command 'wmctrl -a pdf'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom2/ binding "<Super>l"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom5/ name 'navigate to pdf2'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom5/ command "$BASH_CONFIG/scripts/focusSecondPdf.sh"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom5/ binding "<Super>o"

# ==== === Screenshot
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom6/ name 'custom screenshot'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom6/ command "$BASH_CONFIG/scripts/screenshot.sh"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom6/ binding "<Super>p"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom7/ name 'custom screenshot'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom7/ command "$BASH_CONFIG/scripts/screenshotbyarea.sh"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom7/ binding "<Super><Primary>p"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom8/ name 'switch kanata layout'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom8/ command "$BASH_CONFIG/scripts/startkanata.sh"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom8/ binding "<Super>w"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom9/ name 'open cliboard menu'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom9/ command "$BASH_CONFIG/scripts/clipboardmenu.sh"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom9/ binding "<Super>s"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom10/ name 'screenshot and copy image'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom10/ command "$BASH_CONFIG/scripts/screenshotcopyimage.sh"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom10/ binding "<Super><Shift>p"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom11/ name 'screenshot area and copy image'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom11/ command "$BASH_CONFIG/scripts/screenshotbyareacopyimage.sh"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom11/ binding "<Super><Shift><Primary>p"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom12/ name 'adb pull latest screenshot'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom12/ command "$BASH_CONFIG/scripts/adbpull.sh"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom12/ binding "<Super>d"

gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down '["<Super><Primary>y"]'
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up '["<Super><Primary>u"]'

# gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybinding
gsettings set org.gnome.shell.keybindings toggle-quick-settings []
gsettings set org.gnome.settings-daemon.plugins.media-keys rotate-video-lock-static "[]"

