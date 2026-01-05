# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal Linux configuration repository (dotfiles) containing bash scripts, keyboard remapping configs, systemd services, and application configurations for a GNOME-based development environment.

## Directory Structure

- `bash_config/` - Main bash configuration hub
  - `.bash_aliases` - Shell aliases and custom functions
  - `bash_path.sh` - Environment variables and PATH configuration
  - `install/` - Installation scripts for various tools (firefox, kanata, neovim, etc.)
  - `scripts/` - 85+ utility scripts for automation and workflow enhancement
  - `gnome_setting/` - GNOME desktop keybindings and configuration scripts
- `kanata/` - Keyboard remapping configurations (Kanata tool)
  - `config_corne.kbd` - Corne keyboard layout with custom layers
  - `config_general.kbd` - General keyboard configuration
  - `*.service` - Systemd service files for Kanata
- `service/` - Systemd user service and timer files
- `tmux/`, `ghostty/`, `yazi/` - Application-specific configurations
- `fonts/` - Custom fonts

## Key Environment Variables

Defined in `bash_config/bash_path.sh`:
- `$CONFIG` - Points to `~/.my_config`
- `$BASH_CONFIG` - Points to `$CONFIG/bash_config`
- `$SCRIPT_PATH` - Points to `$BASH_CONFIG/scripts` (added to PATH)
- `$GNOME_SETTING` - Points to GNOME configuration scripts
- `$ARCHIVE_PATH` - Points to `~/archive`
- `$REMOTE_PATH` - Mount point for remote NFS shares
- `$PY_HOME` - Python virtual environment location

## Common Commands

### Configuration Management

```bash
# Reload bash configuration
eb                  # Source ~/.bashrc

# Copy configurations to their destinations
ct                  # Copy tmux config
cg                  # Copy ghostty config
ek                  # Copy kanata service

# Activate Python virtual environment
ev                  # Source activateEnv.sh
```

### Kanata Keyboard Remapping

```bash
# Test Kanata configuration manually
kn                  # kanata --cfg config_corne.kbd

# Install as systemd service
cp kanata/kanata_corne.service ~/.config/systemd/user/
systemctl --user enable kanata_corne.service
systemctl --user start kanata_corne.service
```

### GNOME Settings Management

```bash
# Apply GNOME keybindings and settings
bash $GNOME_CONFIG

# Backup current GNOME settings
bash $BASH_CONFIG/gnome_setting/dconfbackup.sh
```

### Systemd Services

```bash
# Install user service/timer
cp service/auto-switch-wifi.service ~/.config/systemd/user/
cp service/auto-switch-wifi.timer ~/.config/systemd/user/
systemctl --user enable auto-switch-wifi.timer
systemctl --user start auto-switch-wifi.timer
```

## Scripts Architecture

The `bash_config/scripts/` directory contains 85+ utility scripts organized by function:

**AI Integration:**
- `clip_llm.sh` - Process clipboard content with LLM (uses Python + Gemini API)
- `cursor_llm.sh`, `llm_ocr.sh` - LLM-powered utilities
- AI aliases in `.bash_aliases`: `what`, `how`, `cli`, `gen` (uses aichat with various roles)

**File Management:**
- `adbpull*.sh` / `adbpush.sh` - Android device file transfer
- `copyimagefromclip.sh` - Save clipboard images
- `deleteAllExcept.sh` - Selective file deletion

**Calendar Integration:**
- `gcal*.sh` - Google Calendar CLI wrappers (requires gcalcli)
- Aliases: `gca` (agenda), `gcm` (month), `gcmo` (modify)

**Window/Workspace Management:**
- `focus*.sh` - Scripts for focusing specific windows/workspaces
- `managewindow.sh` - Window manipulation utilities

**Network:**
- `auto-switch-wifi.sh` - Auto-connect to preferred WiFi when in range
- `dmfs.sh` - Mount and manage NFS remote shares with project selection

All scripts in `$SCRIPT_PATH` are automatically added to PATH.

## Bash Aliases Patterns

The repository uses several patterns in `.bash_aliases`:

**FZF Integration:**
- `Alt+s` - Fuzzy select script from `$SCRIPT_PATH`
- `Alt+a` - Fuzzy select path from `$ARCHIVE_PATH`
- `Alt+k` - Fuzzy select files in current directory
- `nvi` - Open file with nvim using fzf preview

**AI Command Wrappers:**
All AI commands copy output to clipboard using `xclip -sel clip`:
- `what`/`gwhat` - Short answers (uses aichat/gemini)
- `how`/`ghow` - Shell command help with %shell% role
- `cli`/`gcli` - Generate shell commands
- `gen`/`ggen` - Code generation with %code% role

**Git Shortcuts:**
- `gS` - git status
- `gC` - git checkout

## Kanata Configuration Notes

The Kanata keyboard remapper uses layers defined in `kanata/config_corne.kbd`:

- `base` - Default layer
- `RAISE` - Symbol and number layer (activated by space hold)
- `LOWER` - Navigation layer (activated by tab/enter hold)
- `KEYPAD` - Keypad layer

Key aliases follow patterns:
- `esct` - Tap for Esc, hold for Ctrl
- `al_rse1` - Tap for Space, hold for RAISE layer
- `al_nav` - Tap for Tab, hold for LOWER layer
- `sh_*` - Shift + key combinations
- `ct_*` - Ctrl + layer combinations

## Development Workflow

1. **Testing scripts:** Scripts should be executable and use `#!/bin/bash` shebang
2. **Environment access:** Always source `bash_path.sh` for environment variables
3. **Logging:** Scripts that run as services should log to files (see `clip_llm.sh`)
4. **Notifications:** Use `notify-send` for user notifications in background scripts
5. **Error handling:** Check exit codes and provide feedback

## Service Installation Pattern

When creating new systemd user services:

1. Place `.service` and `.timer` files in `service/`
2. Copy to `~/.config/systemd/user/`
3. Enable with `systemctl --user enable <name>.service`
4. Start with `systemctl --user start <name>.service`
5. Check logs with `journalctl --user -u <name>.service -f`

## Dependencies

Key tools used throughout:
- `kanata` - Keyboard remapping (installed via cargo)
- `fzf` - Fuzzy finder
- `aichat` - AI CLI tool with various LLM providers
- `gcalcli` - Google Calendar CLI
- `xclip` - Clipboard management
- `notify-send` - Desktop notifications
- `tmux`, `neovim`, `ghostty` - Terminal workflow
- Python 3.10+ with virtual environment at `$PY_HOME`
