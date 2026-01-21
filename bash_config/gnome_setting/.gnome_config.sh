#!/bin/bash

# GNOME Custom Keybindings Configuration
# This script sets up all custom keyboard shortcuts for GNOME desktop

GNOME_CONFIG_PATH="$BASH_CONFIG/gnome_setting"
CUSTOM_KB_BASE="org.gnome.settings-daemon.plugins.media-keys"
CUSTOM_KB_PATH="/org/gnome/settings-daemon/plugins/media-keys"

# Key modifier reference:
# <Primary> → Ctrl
# <Shift>   → Shift
# <Alt>     → Alt
# <Super>   → Windows/Meta key
# <Hyper>   → Rarely used, can be mapped separately

# Helper function to set a custom keybinding
# Usage: set_keybinding INDEX NAME COMMAND BINDING
set_keybinding() {
    local index=$1
    local name=$2
    local command=$3
    local binding=$4
    local path="${CUSTOM_KB_PATH}/custom${index}/"

    gsettings set "${CUSTOM_KB_BASE}.custom-keybinding:${path}" name "$name"
    gsettings set "${CUSTOM_KB_BASE}.custom-keybinding:${path}" command "$command"
    gsettings set "${CUSTOM_KB_BASE}.custom-keybinding:${path}" binding "$binding"
}

# Build the custom keybindings array
# This automatically generates the list of custom keybinding paths
declare -a keybindings
for i in {0..23}; do
    keybindings+=("'${CUSTOM_KB_PATH}/custom${i}/'")
done

# Join array elements with commas and set the custom-keybindings list
kb_list="[$(IFS=,; echo "${keybindings[*]}")]"
gsettings set "${CUSTOM_KB_BASE}" custom-keybindings "$kb_list"

# ============================================================================
# Workspace & Window Navigation
# ============================================================================

set_keybinding 0 \
    "Navigate to terminal workspace" \
    "$BASH_CONFIG/scripts/focusWorkspace.sh" \
    "<Super>k"

set_keybinding 3 \
    "Navigate to sub workspace" \
    "$BASH_CONFIG/scripts/focusSubworkspace.sh" \
    "<Super>i"

set_keybinding 13 \
    "Focus other window" \
    "$BASH_CONFIG/scripts/focusOtherWindow.sh" \
    "<Super>h"

set_keybinding 17 \
    "Move cursor to focused window" \
    "$BASH_CONFIG/scripts/moveCursorToFocus.sh" \
    "<Super>f"

set_keybinding 20 \
    "Set Windows layout" \
    "$BASH_CONFIG/scripts/setWindows.sh" \
    "<Super>z"

# ============================================================================
# Application Focus - Firefox
# ============================================================================

set_keybinding 1 \
    "Focus first Firefox window" \
    "$BASH_CONFIG/scripts/focusFirstFirefox.sh" \
    "<Super>j"

set_keybinding 4 \
    "Focus other Firefox window" \
    "$BASH_CONFIG/scripts/focusOtherFirefox.sh" \
    "<Super>m"

set_keybinding 14 \
    "Focus middle Firefox window" \
    "$BASH_CONFIG/scripts/focusMiddeFirefox.sh" \
    "<Super>u"

set_keybinding 18 \
    "Focus third Firefox window" \
    "$BASH_CONFIG/scripts/focusThirdFirefox.sh" \
    "<Super>y"

# ============================================================================
# Application Focus - PDF
# ============================================================================

set_keybinding 2 \
    "Navigate to PDF viewer" \
    "wmctrl -a pdf" \
    "<Super>l"

set_keybinding 5 \
    "Navigate to second PDF" \
    "$BASH_CONFIG/scripts/focusSecondPdf.sh" \
    "<Super>o"

# ============================================================================
# Screenshots
# ============================================================================

# set_keybinding 6 \
#     "Screenshot (full screen to file)" \
#     "$BASH_CONFIG/scripts/screenshot.sh" \
#     "<Super>p"

set_keybinding 7 \
    "Screenshot by area (to file)" \
    "$BASH_CONFIG/scripts/screenshotbyarea.sh" \
    "<Super><Primary>p"

set_keybinding 10 \
    "Execute PPT script" \
    "$BASH_CONFIG/scripts/ppt.sh" \
    "<Super>p"

# set_keybinding 11 \
#     "Screenshot area and copy to clipboard" \
#     "$BASH_CONFIG/scripts/screenshotbyareacopyimage.sh" \
#     "<Super><Shift><Primary>p"

# ============================================================================
# Android Device Integration
# ============================================================================

set_keybinding 12 \
    "ADB pull latest screenshot" \
    "$BASH_CONFIG/scripts/adbpull.sh" \
    "<Super>d"

set_keybinding 22 \
    "Launch scrcpy (screen mirror)" \
    "scrcpy" \
    "<Super>n"

# ============================================================================
# AI & LLM Tools
# ============================================================================

set_keybinding 21 \
    "Clipboard to LLM" \
    "$BASH_CONFIG/scripts/cursor_llm.sh" \
    "<Super>a"

set_keybinding 15 \
    "Extract text from image (OCR)" \
    "$BASH_CONFIG/scripts/extractTextFromImage.sh" \
    "<Super>t"

set_keybinding 6 \
    "LLM OCR (clipboard path)" \
    "$BASH_CONFIG/scripts/llm_ocr.sh" \
    "<Super><Primary>o"

set_keybinding 11 \
    "PDF to Markdown" \
    "$BASH_CONFIG/scripts/pdf2md.sh" \
    "<Super><Primary>m"

set_keybinding 19 \
    "Speech to Text (SST)" \
    "$BASH_CONFIG/scripts/SST.sh" \
    "<Super>r"

# ============================================================================
# Clipboard & Utilities
# ============================================================================

set_keybinding 9 \
    "Open clipboard menu" \
    "$BASH_CONFIG/scripts/clipboardmenu.sh" \
    "<Super>s"

set_keybinding 16 \
    "Copy image from clipboard to file" \
    "$BASH_CONFIG/scripts/copyimagefromclip.sh" \
    "<Super>e"

set_keybinding 8 \
    "Switch Kanata keyboard layout" \
    "$BASH_CONFIG/scripts/startkanata.sh" \
    "<Super>w"

set_keybinding 23 \
    "Convert LaTeX to PNG" \
    "$BASH_CONFIG/scripts/tex2png.sh" \
    "<Super><Primary>l"

# ============================================================================
# System Media Keys
# ============================================================================

# Volume controls
gsettings set "${CUSTOM_KB_BASE}" volume-down '["<Super><Primary>y"]'
gsettings set "${CUSTOM_KB_BASE}" volume-up '["<Super><Primary>u"]'

# Disable conflicting default keybindings
gsettings set org.gnome.shell.keybindings toggle-quick-settings "[]"
gsettings set "${CUSTOM_KB_BASE}" rotate-video-lock-static "[]"

# Optional: Uncomment to disable application view toggle
# gsettings set org.gnome.shell.keybindings toggle-application-view "[]"

echo "GNOME keybindings configured successfully"
