# exec_nvim

任意のディレクトリをWezTermで開き、上2/3にNeovim・下1/3にシェルを自動配置するスクリプト。

## 前提条件

- [WezTerm](https://wezfurlong.org/wezterm/)
- [Neovim](https://neovim.io/)
- [fish](https://fishshell.com/)

## ファイル構成

```
exec_nvim/
├── nvp              # 起動スクリプト
├── setup_linux.sh   # Linux セットアップ
├── setup_macos.sh   # macOS セットアップ
└── README.md
```

## Linux セットアップ

```bash
bash setup_linux.sh
```

- `~/.local/bin/nvp` にシンボリックリンクを作成
- `~/.local/share/applications/exec-nvim.desktop` を作成（ファイルマネージャーの「アプリケーションで開く」対応）

`~/.local/bin` が PATH に含まれていない場合は `~/.bashrc` や `~/.config/fish/config.fish` に追加してください。

```fish
fish_add_path ~/.local/bin
```

## macOS セットアップ

```bash
bash setup_macos.sh
```

- `~/.local/bin/nvp` にシンボリックリンクを作成
- `~/Applications/NvimProject.app` を生成（Finder の「このアプリケーションで開く」対応）

Finder での使い方：フォルダを右クリック →「このアプリケーションで開く」→「NvimProject」

## 使い方

```fish
# カレントディレクトリを開く
nvp

# 指定ディレクトリを開く
nvp ~/projects/myapp
```
