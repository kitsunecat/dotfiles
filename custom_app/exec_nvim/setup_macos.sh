#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$HOME/.local/bin"
APP_DIR="$HOME/Applications"
APP_NAME="NvimProject.app"
NVP_PATH="$BIN_DIR/nvp"

mkdir -p "$BIN_DIR"
chmod +x "$SCRIPT_DIR/nvp"
ln -sf "$SCRIPT_DIR/nvp" "$NVP_PATH"
echo "Installed: $NVP_PATH"

if ! echo "$PATH" | grep -q "$BIN_DIR"; then
  echo "Warning: $BIN_DIR が PATH に含まれていません。シェルの設定ファイルに追加してください。"
fi

mkdir -p "$APP_DIR"
TMPSCRIPT=$(mktemp /tmp/nvp_XXXXXX.applescript)

cat > "$TMPSCRIPT" << EOF
on open (theItems)
  set thePath to POSIX path of (item 1 of theItems)
  do shell script "$NVP_PATH " & quoted form of thePath
end open

on run
  do shell script "$NVP_PATH"
end run
EOF

osacompile -o "$APP_DIR/$APP_NAME" "$TMPSCRIPT"
rm "$TMPSCRIPT"

echo "Installed: $APP_DIR/$APP_NAME"
echo ""
echo "Usage:"
echo "  Terminal : nvp [dir]"
echo "  Finder   : フォルダ右クリック → このアプリケーションで開く → NvimProject"
