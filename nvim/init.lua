vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- leaderキーは他のキーマップを定義する前に設定する必要がある
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keymap
-- Ctrl+` でターミナルを開く/閉じる
vim.keymap.set('n', '<C-`>', ':split | terminal<CR>', { noremap = true, silent = true })

-- ターミナルモードからEscでノーマルモードに戻る
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Git
vim.keymap.set("n", "<leader>gd", "<cmd>Gdiffsplit<cr>", { desc = "Diff vs HEAD" })
vim.keymap.set("n", "<leader>gD", "<cmd>Gdiffsplit main<cr>", { desc = "Diff vs main" })
vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git status" })
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Git blame" })
vim.keymap.set("n", "<leader>gv", "<cmd>DiffviewOpen<cr>", { desc = "Diffview open" })
vim.keymap.set("n", "<leader>gV", "<cmd>DiffviewClose<cr>", { desc = "Diffview close" })

-- 外部でファイルが変更されたら自動で読み直す
vim.opt.autoread = true

-- フォーカスが戻ったとき、バッファを切り替えたときなどに checktime を実行
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "checktime",
})

-- 変更が検知されたら通知
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  pattern = "*",
  callback = function()
    vim.notify("ファイルが外部で変更されたため再読み込みしました", vim.log.levels.INFO)
  end,
})

require("options")
require("keymaps")
require("plugins")
