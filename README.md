# My Linux Desktop Configuration

Personal dotfiles for my Hyprland desktop environment running on Arch Linux, focused on touch controls and tablet mode support.

## Overview

A highly customized Hyprland configuration with:

- Touch gesture support via hyprgrass plugin
- Automatic screen rotation for tablet mode
- Live wallpapers with pywal color integration
- Custom waybar widgets including mobile device battery status

## Features

### Window Manager: Hyprland

- Touch gestures for common actions:
  - 3-finger swipe for workspace switching
  - 4-finger swipe down to close windows
  - 5-finger tap for application launcher
  - Edge swipes for volume/brightness control
- Automatic screen rotation with tablet mode detection
- Dynamic workspace management
- Live wallpaper using mpvpaper with pywal integration

### Terminal: Kitty

- Catppuccin Mocha theme
- 70% background opacity
- Disabled audio bell

### Shell: ZSH

- Powerlevel10k theme 
- Custom aliases for efficient workflow
- Python virtualenv auto-activation
- Progress bars for file operations via mvg/cpg
- Zoxide integration for smart directory jumping

### Editor: Neovim

- LSP support with mason and lsp-zero
- Treesitter for better syntax highlighting
- Custom formatters for multiple languages
- Tokyo Night theme with transparency

### Appearance

- Catppuccin Mocha as base theme
- Transparency and blur effects throughout
- Pywal integration for dynamic colors
- Custom rounded corners and borders

### Additional Tools

- Clipboard Manager: Clipse with image preview
- Launcher: AnyRun with multiple plugins
- File Manager: Yazi
- Notifications: Dunst with themed styling
- Screen Lock: Hyprlock with live wallpaper blur

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
```

2. Initialize submodules:
```sh
cd ~/.dotfiles
git submodule update --init --recursive
```

3. Create symlinks:
```sh
# You'll need to create symlinks from these configs to their respective locations
ln -s ~/.dotfiles/.config/* ~/.config/
ln -s ~/.dotfiles/.zshrc ~/.zshrc
```

## Dependencies

Main components:
- Hyprland
- Waybar
- Kitty
- ZSH + Oh-My-Zsh
- Powerlevel10k
- MPV
- Dunst
- AnyRun

Additional utilities:
- Yazi (file manager)
- Clipse (clipboard manager)
- Zoxide (directory jumper)
- Progress (mv/cp with progress bars)
- KDE Connect
- Playerctl
- brightnessctl
- wpctl (wireplumber)

## Theme

Using Catppuccin Mocha theme across various applications with custom transparency and blur effects.

## License

MIT