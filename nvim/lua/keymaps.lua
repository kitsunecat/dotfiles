local map = vim.keymap.set

-- 基本操作
map("n", "<leader>w", "<cmd>w<cr>")
map("n", "<leader>q", "<cmd>q<cr>")
map("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- ターミナル
map("n", "<C-`>", ":split | terminal<CR>", { noremap = true, silent = true })
map("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

-- ウィンドウ移動（Ctrl+hjkl）
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- ターミナルモードからウィンドウ移動（ESCを使わずClaudeの会話を中断しない）
map("t", "<C-h>", [[<C-\><C-n><C-w>h]])
map("t", "<C-j>", [[<C-\><C-n><C-w>j]])
map("t", "<C-k>", [[<C-\><C-n><C-w>k]])
map("t", "<C-l>", [[<C-\><C-n><C-w>l]])

-- ウィンドウリサイズ（Ctrl+矢印キー）
map("n", "<C-Up>", "<cmd>resize +2<cr>")
map("n", "<C-Down>", "<cmd>resize -2<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")

-- バッファ
map("n", "<S-l>", "<cmd>bnext<cr>")
map("n", "<S-h>", "<cmd>bprevious<cr>")
map("n", "<leader>bd", "<cmd>bdelete<cr>")

-- インデントをビジュアルモードで連続して使う
map("v", "<", "<gv")
map("v", ">", ">gv")
