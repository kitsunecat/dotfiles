vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Ctrl+` でターミナルを開く/閉じる
vim.keymap.set('n', '<C-`>', ':split | terminal<CR>', { noremap = true, silent = true })
-- ターミナルモードからEscでノーマルモードに戻る
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

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
