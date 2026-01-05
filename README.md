# Personal Linux Configuration

A comprehensive dotfiles repository for a GNOME-based Linux development environment, featuring custom bash configurations, keyboard remapping, utility scripts, and AI-powered workflow automation.

## Features

### 🎹 Keyboard Remapping with Kanata
- Custom keyboard layouts optimized for Corne and general keyboards
- Multi-layer system (RAISE, LOWER, KEYPAD) for efficient key access
- Tap-hold functionality (e.g., Esc/Ctrl on Caps Lock)
- Systemd service integration for automatic startup

### 🤖 AI-Powered Utilities
- Clipboard processing with LLM integration
- Quick AI commands for shell help, code generation, and explanations
- Integration with multiple AI providers (aichat, Gemini)
- OCR and text extraction from images

### 📅 Calendar Integration
- Google Calendar CLI wrappers and aliases
- Quick event creation, modification, and viewing
- Calendar reminders and agenda views

### 🔧 85+ Utility Scripts
- **Android Development**: ADB pull/push helpers for specific directories
- **File Management**: Smart clipboard operations, file organization
- **Window Management**: Focus and workspace navigation scripts
- **Network Automation**: Auto-switch WiFi, NFS mount management
- **Development Tools**: Python project creation, environment activation

### ⌨️ Enhanced Shell Experience
- Extensive bash aliases for productivity
- FZF integration with custom keybindings
- Clipboard management with xclip
- Custom prompt and terminal configurations

## Quick Start

### Clone the Repository

```bash
git clone <repository-url> ~/.my_config
```

### Install Core Dependencies

```bash
# Run the main installation script
bash ~/.my_config/bash_config/install/install.sh

# Or install individual components
bash ~/.my_config/bash_config/install/kanata.sh
bash ~/.my_config/bash_config/install/tmux.sh
bash ~/.my_config/bash_config/install/neovim.sh
```

### Set Up Bash Configuration

Add to your `~/.bashrc`:

```bash
# Source the configuration
source "$HOME/.my_config/bash_config/bash_path.sh"
source "$HOME/.my_config/bash_config/.bash_aliases"

# Optional: source environment variables if you have .env file
if [ -f "$HOME/.my_config/bash_config/.env" ]; then
    source "$HOME/.my_config/bash_config/.env"
fi
```

Then reload:

```bash
source ~/.bashrc
# or use the alias:
eb
```

### Set Up Kanata Keyboard Remapping

```bash
# Copy the service file
cp ~/.my_config/kanata/kanata_corne.service ~/.config/systemd/user/

# Enable and start the service
systemctl --user enable kanata_corne.service
systemctl --user start kanata_corne.service

# Check status
systemctl --user status kanata_corne.service
```

### Apply GNOME Settings

```bash
# Apply custom keybindings and settings
bash ~/.my_config/bash_config/gnome_setting/.gnome_config.sh
```

## Requirements

### Essential
- Linux (tested on Ubuntu 22.04+)
- Bash 4.0+
- GNOME desktop environment

### Recommended Tools
- **kanata** - Keyboard remapping (installed via cargo)
- **fzf** - Fuzzy finder for file/command selection
- **aichat** - AI CLI tool for LLM integration
- **tmux** - Terminal multiplexer
- **neovim** - Text editor
- **xclip** - Clipboard management
- **gcalcli** - Google Calendar CLI
- **bat** - Enhanced cat with syntax highlighting
- **zoxide** - Smarter cd command
- **ripgrep** - Fast text search

### Optional
- **ghostty** - Terminal emulator
- **yazi** - Terminal file manager
- **scrcpy** - Android screen mirroring
- **ollama** - Local LLM runtime
- Android SDK for ADB scripts

## Key Commands

### Configuration Management

```bash
eb          # Reload bash configuration
ev          # Activate Python virtual environment
ct          # Copy tmux config
cg          # Copy ghostty config
```

### AI Assistants (output copied to clipboard)

```bash
what <question>     # Get short answer
how <task>          # Get shell command suggestion
cli <description>   # Generate shell command
gen <request>       # Generate code
explain <command>   # Explain shell command
```

Prefix with `g` for Gemini models (e.g., `gwhat`, `ghow`, `gcli`)

### Calendar

```bash
gca         # Show agenda
gcm         # Show month view
gcw         # Show week view
gcmo        # Modify event
```

### FZF Keybindings

- `Alt+s` - Select script from scripts directory
- `Alt+a` - Select path from archive
- `Alt+k` - Select files in current directory
- `Alt+j` - Select files from KakaoTalk downloads

### File Operations

```bash
nvi         # Open file with nvim (fzf preview)
cf          # cd into directory (fzf)
of          # Open file (fzf)
sf          # Copy file path to clipboard (fzf)
```

### Git Shortcuts

```bash
gS          # git status
gC          # git checkout
```

## Directory Structure

```
.my_config/
├── bash_config/
│   ├── .bash_aliases           # Shell aliases and functions
│   ├── bash_path.sh            # Environment variables
│   ├── install/                # Installation scripts
│   ├── scripts/                # 85+ utility scripts
│   ├── gnome_setting/          # GNOME configuration
│   └── source/                 # Additional source files
├── kanata/
│   ├── config_corne.kbd        # Corne keyboard config
│   ├── config_general.kbd      # General keyboard config
│   └── *.service               # Systemd service files
├── service/                    # User systemd services
├── tmux/                       # Tmux configuration
├── ghostty/                    # Ghostty terminal config
├── yazi/                       # Yazi file manager config
└── fonts/                      # Custom fonts
```

## Customization

### Adding New Scripts

1. Create script in `bash_config/scripts/`
2. Make it executable: `chmod +x bash_config/scripts/your_script.sh`
3. Scripts are automatically added to PATH via `bash_path.sh`

### Adding Bash Aliases

Edit `bash_config/.bash_aliases` and reload with `eb`

### Modifying Kanata Layout

1. Edit `kanata/config_corne.kbd`
2. Restart service: `systemctl --user restart kanata_corne.service`
3. Test manually first: `kn` (kanata --cfg config_corne.kbd)

### Creating Systemd Services

1. Create `.service` file in `service/` directory
2. Copy to `~/.config/systemd/user/`
3. Enable: `systemctl --user enable <service-name>.service`
4. Start: `systemctl --user start <service-name>.service`

## Environment Variables

Key variables set in `bash_path.sh`:

- `$CONFIG` - `~/.my_config`
- `$BASH_CONFIG` - `$CONFIG/bash_config`
- `$SCRIPT_PATH` - `$BASH_CONFIG/scripts` (in PATH)
- `$GNOME_SETTING` - GNOME configuration directory
- `$ARCHIVE_PATH` - Personal archive location
- `$REMOTE_PATH` - NFS mount point
- `$PY_HOME` - Python virtual environment

## Backup and Sync

### Backup GNOME Settings

```bash
bash $BASH_CONFIG/scripts/backup_gnomesetting.sh
```

### Git Workflow

```bash
# Check status
gS

# Stage and commit changes
git add .
git commit -m "Update configuration"

# Push to remote
git push
```

## Troubleshooting

### Kanata Not Starting

```bash
# Check service status
systemctl --user status kanata_corne.service

# View logs
journalctl --user -u kanata_corne.service -f

# Test configuration manually
cd ~/.my_config/kanata
kanata --cfg config_corne.kbd
```

### Scripts Not in PATH

```bash
# Verify SCRIPT_PATH is set
echo $SCRIPT_PATH

# Reload bash configuration
source ~/.bashrc
```

### AI Commands Not Working

Ensure `aichat` is installed and configured:

```bash
# Install aichat
cargo install aichat

# Configure API keys (if needed)
aichat --help
```

## License

Personal configuration files - use at your own discretion.

## Contributing

This is a personal configuration repository, but feel free to fork and adapt for your own use.
