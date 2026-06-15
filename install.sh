#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Setting up dotfiles from $DOTFILES"

# nvim
if [ -e "$HOME/.config/nvim" ] && [ ! -L "$HOME/.config/nvim" ]; then
  echo "Backing up existing ~/.config/nvim to ~/.config/nvim.bak"
  mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak"
fi
mkdir -p "$HOME/.config"
ln -sfn "$DOTFILES/nvim" "$HOME/.config/nvim"
echo "Linked ~/.config/nvim -> $DOTFILES/nvim"

# tmux
if [ -e "$HOME/.tmux.conf" ] && [ ! -L "$HOME/.tmux.conf" ]; then
  echo "Backing up existing ~/.tmux.conf to ~/.tmux.conf.bak"
  mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.bak"
fi
ln -sf "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"
echo "Linked ~/.tmux.conf -> $DOTFILES/tmux/.tmux.conf"

# bash
if ! grep -q "dotfiles/bash/.bashrc" "$HOME/.bashrc"; then
  echo "" >> "$HOME/.bashrc"
  echo "# Dotfiles" >> "$HOME/.bashrc"
  echo '[ -f "$HOME/dotfiles/bash/.bashrc" ] && source "$HOME/dotfiles/bash/.bashrc"' >> "$HOME/.bashrc"
  echo "Added source line to ~/.bashrc"
else
  echo "~/.bashrc already sources custom.sh"
fi

echo "Done. Reload shell with: source ~/.bashrc"
