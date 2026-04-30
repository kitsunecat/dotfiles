#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$HOME/.local/bin"
DESKTOP_DIR="$HOME/.local/share/applications"

mkdir -p "$BIN_DIR"
chmod +x "$SCRIPT_DIR/nvp"
ln -sf "$SCRIPT_DIR/nvp" "$BIN_DIR/nvp"
echo "Installed: $BIN_DIR/nvp"

mkdir -p "$DESKTOP_DIR"
cat > "$DESKTOP_DIR/exec-nvim.desktop" << EOF
[Desktop Entry]
Name=NvimProject
Comment=Open directory in WezTerm with Neovim
Exec=$BIN_DIR/nvp %f
Icon=nvim
Type=Application
MimeType=inode/directory;
Categories=Development;
Terminal=false
EOF

update-desktop-database "$DESKTOP_DIR" 2>/dev/null || true
echo "Installed: $DESKTOP_DIR/exec-nvim.desktop"
echo ""
echo "Usage:"
echo "  Terminal : nvp [dir]"
echo "  Nautilus : フォルダ右クリック → 他のアプリケーションで開く → NvimProject"
