# ショートカットキー一覧

## WezTerm (`_wezterm.lua`)

### コピーモード

| キー | 動作 |
| --- | --- |
| `Ctrl+[` | コピーモードに入る |

### ペイン分割

| キー | 動作 |
| --- | --- |
| `Ctrl+Shift+d` | ペインを上下に分割（垂直分割） |
| `Ctrl+Shift+e` | ペインを左右に分割（水平分割） |

### ペイン移動

| キー | 動作 |
| --- | --- |
| `Ctrl+Shift+h` | 左のペインへ移動 |
| `Ctrl+Shift+j` | 下のペインへ移動 |
| `Ctrl+Shift+k` | 上のペインへ移動 |
| `Ctrl+Shift+l` | 右のペインへ移動 |

### ペインサイズ調整

| キー | 動作 |
| --- | --- |
| `Ctrl+Shift+←` | 左方向に5拡張 |
| `Ctrl+Shift+→` | 右方向に5拡張 |
| `Ctrl+Shift+↑` | 上方向に5拡張 |
| `Ctrl+Shift+↓` | 下方向に5拡張 |

---

## Neovim

> `<leader>` は **スペースキー** に割り当てられています。

### 基本操作 (`keymaps.lua`)

| モード | キー | 動作 |
| --- | --- | --- |
| Normal | `<leader>w` | 保存 (`:w`) |
| Normal | `<leader>q` | 終了 (`:q`) |
| Normal | `<Esc>` | 検索ハイライトをクリア |

### ウィンドウ操作

| モード | キー | 動作 |
| --- | --- | --- |
| Normal | `Ctrl+h` | 左のウィンドウへ移動 |
| Normal | `Ctrl+j` | 下のウィンドウへ移動 |
| Normal | `Ctrl+k` | 上のウィンドウへ移動 |
| Normal | `Ctrl+l` | 右のウィンドウへ移動 |
| Normal | `Ctrl+↑` | ウィンドウ高さを +2 |
| Normal | `Ctrl+↓` | ウィンドウ高さを -2 |
| Normal | `Ctrl+→` | ウィンドウ幅を +2 |
| Normal | `Ctrl+←` | ウィンドウ幅を -2 |

### バッファ

| モード | キー | 動作 |
| --- | --- | --- |
| Normal | `Shift+l` | 次のバッファ |
| Normal | `Shift+h` | 前のバッファ |
| Normal | `<leader>bd` | バッファ削除 |

### インデント（ビジュアル）

| モード | キー | 動作 |
| --- | --- | --- |
| Visual | `<` | インデントを戻す（連続可） |
| Visual | `>` | インデントを進める（連続可） |

### ターミナル (`init.lua`)

| モード | キー | 動作 |
| --- | --- | --- |
| Normal | `Ctrl+` ` | 水平分割でターミナルを開く |
| Terminal | `Esc` | ターミナルモードからノーマルモードへ |

### LSP (`plugins/lsp.lua`)

| キー | 動作 |
| --- | --- |
| `gd` | 定義へジャンプ |
| `gD` | 宣言へジャンプ |
| `gr` | 参照一覧 |
| `K` | ホバードキュメント表示 |
| `<leader>rn` | リネーム |
| `<leader>ca` | コードアクション |
| `<leader>d` | 診断内容をフロートで表示 |
| `[d` | 前の診断へ |
| `]d` | 次の診断へ |

### 補完 nvim-cmp (`plugins/coding.lua`)

| モード | キー | 動作 |
| --- | --- | --- |
| Insert | `Ctrl+d` | ドキュメントを下にスクロール |
| Insert | `Ctrl+f` | ドキュメントを上にスクロール |
| Insert | `Ctrl+Space` | 補完を呼び出す |
| Insert | `Enter` | 補完を確定 |
| Insert/Select | `Tab` | 次の候補選択 / スニペット展開・ジャンプ |

### コメント Comment.nvim

| モード | キー | 動作 |
| --- | --- | --- |
| Normal | `gcc` | 現在行をコメントアウト／解除 |
| Normal/Visual | `gc` | モーション／選択範囲をコメントアウト／解除 |

### Telescope (`plugins/tools.lua`)

| キー | 動作 |
| --- | --- |
| `<leader>ff` | ファイル検索 |
| `<leader>fg` | Live Grep |
| `<leader>fb` | バッファ一覧 |
| `<leader>fs` | ドキュメントシンボル |
| `<leader>fd` | 診断一覧 |

### ファイルツリー nvim-tree

| キー | 動作 |
| --- | --- |
| `<leader>e` | ファイルツリーをトグル |

### Git gitsigns

| キー | 動作 |
| --- | --- |
| `]c` | 次の変更箇所（hunk） |
| `[c` | 前の変更箇所（hunk） |
| `<leader>hs` | hunk をステージ |
| `<leader>hr` | hunk をリセット |
| `<leader>hp` | hunk をプレビュー |
| `<leader>hb` | 行の blame 表示 |

### Trouble

| キー | 動作 |
| --- | --- |
| `<leader>xx` | 診断一覧をトグル |

### Claude Code (`plugins/claudecode.lua`)

| モード | キー | 動作 |
| --- | --- | --- |
| Normal | `<leader>ac` | Claude Code をトグル |
| Normal | `<leader>af` | Claude にフォーカス |
| Normal | `<leader>ar` | セッションを再開 (`--resume`) |
| Normal | `<leader>aC` | 前回の続きから (`--continue`) |
| Normal | `<leader>ab` | 現在のバッファを追加 |
| Visual | `<leader>as` | 選択範囲を Claude に送信 |
| Normal (NvimTree/neo-tree/oil) | `<leader>as` | ツリーのファイルを追加 |
| Normal | `<leader>aa` | 差分を承認 |
| Normal | `<leader>ad` | 差分を拒否 |
