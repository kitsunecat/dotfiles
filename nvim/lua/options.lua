local opt = vim.opt

-- 行番号
opt.number = true
opt.relativenumber = true

-- インデント
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- 検索
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- 表示
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.wrap = false

-- 不可視文字の可視化
opt.list = true
opt.listchars = { lead = "·", space = "·", tab = "▸ ", trail = "·", nbsp = "␣", extends = "»", precedes = "«" }

-- ファイル
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.autoread = true -- 外部でファイルが変更されたら自動で読み直す

-- クリップボード（OSと共有）
opt.clipboard = "unnamedplus"

-- 分割方向
opt.splitright = true
opt.splitbelow = true
